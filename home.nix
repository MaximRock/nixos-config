{ pkgs, yandexBrowserPackages, unstable, ... }:

{
  home.username = "max";
  home.homeDirectory = "/home/max";
  home.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/editors/vscode.nix
    ./modules/editors/vscode-nix.nix
    ./modules/editors/nvf-nvim.nix
    ./modules/terminals/wezterm.nix
    ./modules/shell/zsh.nix
    # ./modules/networking/nekoray.nix
  ];

  home.packages = with pkgs; [
    tree
    bat
    btop
    htop
    yandexBrowserPackages.yandex-browser-stable # nix flake lock --update-input yandex-browser
  ];

  home.file = {

  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
