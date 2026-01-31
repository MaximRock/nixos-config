{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
      nrlg = "sudo nixos-rebuild list-generations";
      btw = "echo i use nixos, max";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "python"
        "docker"
      ];
      theme = "bira";
    };
  };
}
