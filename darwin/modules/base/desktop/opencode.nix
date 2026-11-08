{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.opencode2-desktop];
}
