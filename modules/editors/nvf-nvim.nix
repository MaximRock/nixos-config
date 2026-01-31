{ pkgs, ... }:

let 
  lualineConfig = import ./configs/nvf-config/plugins/lualine.nix { inherit pkgs; };
in 

{
  
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
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
