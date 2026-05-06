{ pkgs, ... }:
{
  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      docker-compose-language-service
      dockerfile-language-server
      emmet-language-server
      nixd
      (python3.withPackages (
        ps: with ps; [
          python-lsp-server
          flake8
        ]
      ))
    ];

    hm-activation = true;
    backup = true;
  };
}
