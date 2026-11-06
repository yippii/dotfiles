{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.AI = {pkgs, ...}: {
    environment.systemPackages = [inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.chatgpt];
  };
}
