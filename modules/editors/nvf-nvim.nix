{ pkgs, ... }:

let 
  pathNVFConfig = ./configs/nvf-config;
  pathNVFPlugins = pathNVFConfig + /plugins;
  # pathLSPConfig = pathNVFConfig + /lsp;

  nvimOptions = import (pathNVFConfig + "/options.nix") { inherit pkgs; };
  nvimMappings = import (pathNVFConfig + "/mappings") { inherit pkgs; };

  lualineConfig = import (pathNVFPlugins + /lualine.nix) { inherit pkgs; };
  incRenameConfig = import (pathNVFPlugins + "/inc-rename.nix") { inherit pkgs; };
  rainbowDelimitersConfig = import (pathNVFPlugins + "/rainbow-delimiters.nix") { inherit pkgs; };
  indentBlanklineConfig = import (pathNVFPlugins + "/indent-blankline.nix") { inherit pkgs; };
  neoTreeConfig = import (pathNVFPlugins + "/neo-tree.nix") { inherit pkgs; };
in 

{
  
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = nvimOptions;
        extraPlugins = {
          inc-rename = incRenameConfig;
          rainbow-delimiters = rainbowDelimitersConfig;
          indent-blankline = indentBlanklineConfig;
        };
        lazy = {
          enable = true;
          plugins = {
            "neo-tree.nvim" = {
              package = pkgs.vimPlugins.neo-tree-nvim;
              setupModule = "neo-tree";
              setupOpts = neoTreeConfig;
              keys = nvimMappings;
            };
          };
        };
        lsp = pathNVFConfig.lsp // {
          servers = {
            lua_ls = pathNVFConfig.lsp.servers.lua_ls;
            nixd = pathNVFConfig.lsp.servers.nixd;
            jsonls = pathNVFConfig.lsp.servers.jsonls;
          };
        };
        theme = {
          enable = true;
          name = "tokyonight";
          style = "moon";
        };
        statusline.lualine = lualineConfig;
      };
    };
  };
}
