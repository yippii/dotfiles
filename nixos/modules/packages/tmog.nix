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
    version = "1.1.1";

    src = pkgs.fetchurl {
      url = "https://tmog.org/downloads/TaskManagerOG-1.1.1-linux-x86_64.tar.gz";
      hash = "sha256-OEgAMUgsocqdmJU7zMrWTeVHuK3EvEu2ectxdn25wbA=";
    };

    tmog = pkgs.stdenv.mkDerivation {
      inherit pname version src;

      meta = {
        description = "Task Manager OG";
        homepage = "https://tmog.org/";
        downloadPage = "https://tmog.org/rtm/downloads/";
        platforms = ["x86_64-linux"];
      };

      nativeBuildInputs = with pkgs; [
        qt6Packages.wrapQtAppsHook
        autoPatchelfHook
      ];

      buildInputs = with pkgs; [
        stdenv.cc.cc.lib
        qt6Packages.qtbase
        qt6.qtsvg
        libgpg-error
        libgcrypt
        glib
      ];

      installPhase = ''
        runHook preInstall

        mkdir -p $out/bin $out/share $out/libexec
        cp -r bin/* $out/bin
        cp -r share/* $out/share
        cp -r libexec/* $out/libexec

        runHook postInstall
      '';
    };
  in {
    packages.tmog = tmog;
  };
}
