{
  self,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    pname = "com.tmog.taskmanager";
    version = "1.0.0";

    src = pkgs.fetchurl {
      url = "https://tmog.org/rtm/downloads/TaskManagerOG-1.0.0-x86_64.AppImage";
      hash = "sha256-7jd6c5SfiQhju8+tCd02tgugR28Me8vQ0Os0NeKQKpY=";
    };

    appimageContents = pkgs.appimageTools.extract {
      inherit pname version src;
    };

    tmog = pkgs.appimageTools.wrapType2 {
      inherit pname version src;

      meta = {
        description = "Task Manager OG";
        homepage = "https://tmog.org/";
        downloadPage = "https://tmog.org/rtm/downloads/";
        platforms = ["x86_64-linux"];
      };

      extraInstallCommands =
        ''
          install -Dm444 ${appimageContents}/${pname}.desktop -t $out/share/applications/

          install -Dm444 ${appimageContents}/tmog-task-manager.png -t $out/share/icons/hicolor/512x512/apps/
        ''
        + pkgs.lib.optionalString (builtins.pathExists "${appimageContents}/usr/share/icons") ''
          cp -r ${appimageContents}/usr/share/icons/* $out/share/icons/ 2>/dev/null || true

          substituteInPlace $out/share/applications/${pname}.desktop \
            --replace-fail 'Exec=tmog-task-manager' 'Exec=${pname}'
        '';
    };
  in {
    packages.tmog = tmog;
  };
}
