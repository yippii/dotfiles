{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.comfyui = {pkgs, ...}: {
    imports = [inputs.comfyui-nix.nixosModules.default];

    services.comfyui = {
      enable = true;
      gpuSupport = "cuda"; # Enable NVIDIA GPU acceleration (recommended for most users)
      cudaCapabilities = ["8.9"];
      enableManager = true; # Enable the built-in ComfyUI Manager
      port = 8188;
      listenAddress = "0.0.0.0"; # Use "0.0.0.0" for network access
      dataDir = "/var/lib/comfyui";
      openFirewall = true;
    };
  };
}
