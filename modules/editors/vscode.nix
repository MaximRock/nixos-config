{
  pkgs,
  ...
}:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      mskelton.one-dark-theme
      pkief.material-icon-theme
     # ms-python.python
     # ms-python.vscode-pylance
     # charliermarsh.ruff
     jnoortheen.nix-ide
    ];

    userSettings = {
      "explorer.confirmDelete" = false;
      "explorer.autoReveal" = false;
      "explorer.compactFolders" = false;
      "files.autoSave" = "afterDelay";
      "editor.fontSize" = 17;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnType" = true;
      "editor.suggestOnTriggerCharacters" = true;
      "workbench.colorTheme" = "One Dark";
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.editorAssociations"."*.0_x5" = "default";
      "git.autoRepositoryDetection" = "subFolders";
      "redhat.telemetry.enabled" = true;
      "oneDark.italic" = false;

      # Nix-specific settings for nixd
    #   "nix.serverPath" = "nixd";
    #   "nix.enableLanguageServer" = true;
    #   "nix.serverSettings" = {
    #     "nixd" = {
    #       "formatting" = {
    #         "command" = [ "nixfmt" ];
    #       };
    #       "options" = {
    #         "nixos" = {
    #           "expr" = "(builtins.getFlake \"/home/max/.dotfiles\").nixosConfigurations.nixos.options";
    #         };
    #         "home_manager" = {
    #           "expr" = "(builtins.getFlake \"/home/max/.dotfiles\").homeConfigurations.max.options";
    #         };
    #       };
    #     };
    #   };
    #   "[nix]" = {
    #     "editor.defaultFormatter" = "jnoortheen.nix-ide";
    #     "editor.tabSize" = 2;
    #     "editor.semanticHighlighting.enabled" = true;
    #   };
    };
  };

  # for nix-ide in vscode with nixd
  # home.packages = [
  #   pkgs.alejandra # Форматтер
  #   pkgs.nixfmt-rfc-style
  #   pkgs.nixd # Nix language server

  #   # Дополнительные инструменты для Nix разработки
  #   pkgs.statix # для поиска антипаттернов
  #   pkgs.deadnix # для поиска неиспользуемого кода
  # ];

  # nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
