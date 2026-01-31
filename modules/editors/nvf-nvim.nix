{ pkgs, nvfConfig, ... }:


{
  import = [
    ./configs/nvf-config/lsp/lsp-packgs.nix
  ];

  programs.nvf = {
  enable = true;
  settings = {
    vim = {
      options = nvfConfig.options;
      extraPlugins = {
        inc-rename = nvfConfig.plugins.incRename;
        rainbow-delimiters = nvfConfig.plugins.rainbowDelimiters;
        indent-blankline = nvfConfig.plugins.indentBlankline;
      };
      lazy = {
        enable = true;
        plugins = {
          "neo-tree.nvim" = {
            package = pkgs.vimPlugins.neo-tree-nvim;
            setupModule = "neo-tree";
            setupOpts = nvfConfig.plugins.neoTree.setupNeoTree;
            keys = nvfConfig.mappings.mappKeys;
          };
        };
      };

      lsp = nvfConfig.lsp // {
        servers = {
          lua_ls = nvfConfig.lsp.servers.lua_ls;
          nixd = nvfConfig.lsp.servers.nixd;
          jsonls = nvfConfig.lsp.servers.jsonls;
        };
      };

      # visuals = {
      #   nvim-web-devicons = nvfConfig.plugins.newWebDevicon;
      #   nvim-cursorline = nvfConfig.plugins.cursorLine;
      # };

      # treesitter = nvfConfig.plugins.treeSitter;
      # theme = nvfConfig.plugins.themeNvim;
      # statusline.lualine = nvfConfig.plugins.luaLine;
      # autocomplete.blink-cmp = nvfConfig.plugins.blinkCmp;
      # formatter.conform-nvim = nvfConfig.plugins.conForm;
      # autopairs.nvim-autopairs.enable = true;
      # telescope = nvfConfig.plugins.teleScope;
      # tabline.nvimBufferline = nvfConfig.plugins.bufferLine;
      # diagnostics = nvfConfig.diagnostics;

      # binds.whichKey = {
      #   enable = true;
      # };

      # ui.noice = nvfConfig.plugins.noIce;
      # dashboard.alpha = nvfConfig.plugins.dashboardAlpha;
    };
  };
};
}







# let 
#   pathNVFConfig = ./configs/nvf-config;
#   pathNVFPlugins = pathNVFConfig + /plugins;
#   pathLSPConfig = pathNVFConfig + /lsp;

#   nvimOptions = import (pathNVFConfig + "/options.nix") { inherit pkgs; };
#   nvimMappings = import (pathNVFConfig + "/mappings.nix") { inherit pkgs; };

#   lspConfig = import pathLSPConfig { inherit pkgs; };

#   lualineConfig = import (pathNVFPlugins + /lualine.nix) { inherit pkgs; };
#   incRenameConfig = import (pathNVFPlugins + "/inc-rename.nix") { inherit pkgs; };
#   rainbowDelimitersConfig = import (pathNVFPlugins + "/rainbow-delimiters.nix") { inherit pkgs; };
#   indentBlanklineConfig = import (pathNVFPlugins + "/indent-blankline.nix") { inherit pkgs; };
#   neoTreeConfig = import (pathNVFPlugins + "/neo-tree.nix") { inherit pkgs; };
# in 

# {
  
#   programs.nvf = {
#     enable = true;
#     settings = {
#       vim = {
#         options = nvimOptions;
#         extraPlugins = {
#           inc-rename = incRenameConfig;
#           rainbow-delimiters = rainbowDelimitersConfig;
#           indent-blankline = indentBlanklineConfig;
#         };
#         lazy = {
#           enable = true;
#           plugins = {
#             "neo-tree.nvim" = {
#               package = pkgs.vimPlugins.neo-tree-nvim;
#               setupModule = "neo-tree";
#               setupOpts = neoTreeConfig;
#               keys = nvimMappings.mappKeys;
#             };
#           };
#         };
#         lsp = lspConfig // {
#           servers = {
#             lua_ls = pathNVFConfig.lsp.servers.lua_ls;
#             nixd = pathNVFConfig.lsp.servers.nixd;
#             jsonls = pathNVFConfig.lsp.servers.jsonls;
#           };
#         };
#         theme = {
#           enable = true;
#           name = "tokyonight";
#           style = "moon";
#         };
#         statusline.lualine = lualineConfig;
#       };
#     };
#   };
# }
