{ ... }:

{
  themeName = "tokyonight";
  themeStyle = "moon";
  luaLineTheme = "material";
  formatters = {
    lua = [ "stylua" ];
    nix = [ "nixfmt" ];
    json = [ "jq" ];
  };
  themeAlpha = "dashboard";
    treesitterGrammars = [
    "regex"
    "kdl" 
    "lua"
    "nix"
    "json"
  ];
}
