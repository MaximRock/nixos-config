{ pkgs, inputs, ... }:

{
  xdg.configFile."/.dotfiles/.vscode/settings.json".source =
    ./configs/vscode-nix/settings.json;

  home.packages = with pkgs; [
    nixfmt-rfc-style
    nixd
    statik
    deadnix
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}