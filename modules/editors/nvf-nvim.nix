{ pkgs, ... }:

let 
  pathNVFConfig = "./config/nvf-config";
  pathNVFPlugins = "${pathNVFConfig}/plugins";
  lualineConfig = import "${pathNVFPlugins}/lualine.nix" { inherit pkgs; };
  nvimOptions = import "${pathNVFConfig}/options.nix" { inherit pkgs; };
  incRenameConfig = import "${pathNVFPlugins}/inc-rename.nix" { inherit pkgs; };
  rainbowDelimitersConfig = import "${pathNVFPlugins}/raibow-delimiters.nix" { inherit pkgs; };
  indentBlanklineConfig = import "${pathNVFPlugins}/indent-blankline.nix" { inherit pkgs; };
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
