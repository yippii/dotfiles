{
  self,
  inputs,
  ...
}: {
  flake.homeModules.desktop = {
    lib,
    config,
    pkgs,
    ...
  }: let
    cfg_orig = config.programs.zen-browser;

    zen-package =
      (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.override {
        policies = cfg_orig.policies;
      }).overrideAttrs
      (prev: {
        postInstall =
          prev.postInstall or ""
          + ''
            chmod -R u+w "$out/lib/zen-bin-${prev.version}"
            cp -r "${inputs.sine-bootloader}/program/"* "$out/lib/zen-bin-${prev.version}"
          '';
      });

    combined_chrome = pkgs.stdenv.mkDerivation {
      pname = "chrome-zen";
      version = "1.0";

      src = inputs.sine;
      bootloader = inputs.sine-bootloader;
      plugins_src_1 = inputs.zia;

      buildInputs = [pkgs.jq];

      installPhase = ''
        # --- STEP 1: Bootstrapping Sine ---
        mkdir -p $out/JS
        cp --no-preserve=mode -r $src/{engine.json,src} $out/JS
        cp --no-preserve=mode -r $bootloader/profile/utils $src/locales $out

        # --- STEP 2: Installing Sine Mods ---
        # Installing Nebula
        mkdir -p $out/sine-mods
        cp --no-preserve=mode -r $plugins_src_1 $out/sine-mods/zia
        echo "{}" > $out/sine-mods/mods.json
        jq --arg key "zia" --slurpfile new $plugins_src_1/theme.json  \
        '.[$key] = ($new[0] + {
          "stars": 229,
          "origin": "store",
          "preferences": "preferences.json",
          "no-updates": false,
          "enabled": true
        })' $out/sine-mods/mods.json > $out/sine-mods/mods.json.tmp

        # --- Post Step 2 Cleanup ---
        mv $out/sine-mods/mods.json.tmp $out/sine-mods/mods.json
      '';
    };
  in {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    xdg.configFile = {
      ".zen" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
        force = true;
      };
      "zen/default/chrome" = {
        force = true;
        source = combined_chrome;
        recursive = true;
      };
    };

    home = {
      file.".zen".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/zen";
      activation.zenTheme = lib.hm.dag.entryAfter ["writeBoundary"] ''
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
  };
}
