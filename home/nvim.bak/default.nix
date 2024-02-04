{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = builtins.readFile ./nvim_settings.lua;
    plugins = with pkgs.vimPlugins; [
      # deps
      plenary-nvim
      promise-async
      nvim-web-devicons
      mini-nvim
      nvim-notify
      nui-nvim

      # plugins
      SchemaStore-nvim
      bufferline-nvim
      catppuccin-nvim
      cmp-buffer
      cmp-cmdline
      cmp-emoji
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      comment-nvim
      conform
      dressing-nvim
      dropbar-nvim
      friendly-snippets
      indent-blankline-nvim
      lspkind-nvim
      lualine-lsp-progress
      lualine-nvim
      luasnip
      neo-tree-nvim
      neodev-nvim
      noice-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      nvim-navic
      nvim-surround
      # (nvim-treesitter.withPlugins (p: with p; [ lua vim javascript typescript tsx css html json toml rust jq nix ]))
      nvim-treesitter.withAllGrammars
      nvim-ts-context-commentstring
      nvim-ufo
      oil-nvim
      package-info-nvim
      statuscol-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      toggleterm-nvim
      vim-fugitive
      which-key-nvim
    ];
  };
}
