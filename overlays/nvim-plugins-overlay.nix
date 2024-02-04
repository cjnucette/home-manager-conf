{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
# This is a function that takes as an argument the original Nixpkgs.
# The first argument should be used for finding dependencies,
# and the second should be used for overriding recipes.
# (self: super: { })
(final: prev: {
  vimPlugins =
    prev.vimPlugins
    // {
      oil-nvim = final.vimUtils.buildVimPlugin {
        name = "oil-nvim";
        src = inputs.oil-nvim-src;
        dontBuild = true;
      };

      conform = final.vimUtils.buildVimPlugin {
        name = "conform";
        src = inputs.conform-src;
        dontBuild = true;
      };

      statuscol-nvim = final.vimUtils.buildVimPlugin {
        name = "statuscol-nvim";
        src = inputs.statuscol-nvim-src;
      };

      nvim-ufo = final.vimUtils.buildVimPlugin {
        name = "nvim-ufo";
        src = inputs.nvim-ufo-src;
      };

      dropbar-nvim = final.vimUtils.buildVimPlugin {
        name = "dropbar-nvim";
        src = inputs.dropbar-nvim-src;
      };

      neodev-nvim = final.vimUtils.buildVimPlugin {
        name = "neodev-nvim";
        src = inputs.neodev-nvim-src;
      };

      clear-action-nvim = final.vimUtils.buildVimPlugin {
        name = "clear-action-nvim";
        src = inputs.clear-action-nvim-src;
      };

      maximize-nvim = final.vimUtils.buildVimPlugin {
        name = "maximize-nvim";
        src = inputs.maximize-nvim-src;
      };
    };
})
