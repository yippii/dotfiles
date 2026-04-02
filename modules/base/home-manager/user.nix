{ self, inputs, ... }: { 
  flake.homeManagerModules.homeManagerUserConfig = { lib, config, pkgs, ... }:
    let
      cfg_orig = config.programs.zen-browser;

      zen-package =
        (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.override {
          policies = cfg_orig.policies;
        }).overrideAttrs
        (prev: {
          postInstall = prev.postInstall or "" + ''
            chmod -R u+w "$out/lib/zen-bin-${prev.version}"
            cp -r "${inputs.sine-bootloader}/program/"* "$out/lib/zen-bin-${prev.version}"
          '';
        });

      combined_chrome = pkgs.stdenv.mkDerivation {
        pname = "chrome-zen";
        version = "1.0";

        src = inputs.sine;
        src_1 = inputs.nebula-zen;
        src_2 = inputs.sine-bootloader;

        buildInputs = [ pkgs.jq ];

        installPhase = ''
          # Installing Sine
          mkdir -p $out/JS
          cp --no-preserve=mode -r $src/{sine.sys.mjs,engine} $out/JS
          cp --no-preserve=mode -r $src_2/profile/utils $src/locales $out
          # Installing Nebula
          mkdir -p $out/sine-mods
          cp --no-preserve=mode -r $src_1 $out/sine-mods/Nebula
          echo "{}" > $out/sine-mods/mods.json
          jq --arg key "Nebula" --slurpfile new $src_1/theme.json  \
            '.[$key] = ($new[0] + {
              "stars": 1233,
              "origin": "store",
              "preferences": "preferences.json",
              "no-updates": false,
              "enabled": true
            })' $out/sine-mods/mods.json > $out/sine-mods/mods.json.tmp && mv $out/sine-mods/mods.json.tmp $out/sine-mods/mods.json
          ln -s $out/sine-mods/Nebula/README.md $out/sine-mods/Nebula/readme.md
          # Modifying Nebula
          cp --no-preserve=mode ${pkgs.nixos-icons}/share/icons/hicolor/1024x1024/apps/nix-snowflake.png $out/sine-mods/Nebula/Nebula/modules
          substituteInPlace $out/sine-mods/Nebula/Nebula/modules/Topbar-buttons.css \
            --replace-fail "url(\"chrome://branding/content/about-logo.svg\")" "url(\"nix-snowflake.png\")" \
            --replace-fail "scale: 1.7;" "scale: 1.5;" \
        '';
      };
    in {
      imports = [ 
        inputs.zen-browser.homeModules.beta
        inputs.nix4nvchad.homeManagerModule
      ];

      home.username = "yippie";
      home.homeDirectory = "/home/yippie";

      home.stateVersion = "26.05"; # Please read the comment before changing.

      home.packages = with pkgs; [
        pywalfox-native
      ];

      gtk = {
        enable = true;
        iconTheme = {
          name = "Papirus";
          package = pkgs.papirus-icon-theme;
        };


        cursorTheme = {
          name = "catppuccin-macchiato-dark-cursors";
          package = pkgs.catppuccin-cursors.macchiatoDark;
          size = 16;
        };

        theme = {
          name = "adw-gtk3-dark";
          package = pkgs.adw-gtk3;
        };

        gtk2.theme = config.gtk.theme;
        gtk2.force = true;

        gtk3.theme = config.gtk.theme;

        gtk4.enable = false;
        gtk4.theme = config.gtk.theme;

      };

      home.sessionVariables = {
      };

      dconf.settings = {
        "org/gnome/desktop/wm/preferences".button-layout = "appmenu:";
      };

      # Let Home Manager install and manage itself.
      programs.home-manager.enable = true;

      xdg.configFile = {
        ".zen".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
        "zen/default/chrome" = {
          source = combined_chrome;
          recursive = true;
        };
      };

      home = {
        file.".zen".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
        activation.zenTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          if [[ ! -z DRY_RUN ]]; then
            echo "@import \"file://${config.xdg.configHome}/zen/default/chrome/sine-mods/Nebula/userChrome.css\";" > ${config.xdg.configHome}/zen/default/chrome/sine-mods/chrome.css
            echo "@import \"file://${config.xdg.configHome}/zen/default/chrome/sine-mods/Nebula/userContent.css\";" > ${config.xdg.configHome}/zen/default/chrome/sine-mods/content.css
          fi
        '';
      };

      programs.zen-browser = {
        enable = true;
        package = (pkgs.wrapFirefox zen-package {icon = "zen-browser";}).override {
          extraPrefs = cfg_orig.extraPrefs;
          extraPrefsFiles = cfg_orig.extraPrefsFiles;
          nativeMessagingHosts = cfg_orig.nativeMessagingHosts;
        };
        profiles.default = {
          isDefault = true;
          search.default = "google";
          sine.enable = true;
          settings = {
            "browser.tabs.allow_transparent_browser" = true;
            "zen.widget.linux.transparency" = true;
            "zen.welcome-screen.seen" = true;
          };
        };
      };

      programs.nvchad = {
        enable = true;
        extraPackages = with pkgs; [
          nodePackages.bash-language-server
          docker-compose-language-service
          dockerfile-language-server
          emmet-language-server
          nixd
          (python3.withPackages(ps: with ps; [
            python-lsp-server
            flake8
          ]))
        ];
        hm-activation = true;
        backup = true;
      };
    };
}
