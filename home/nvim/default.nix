{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    deno
    # lsp, linters
    rust-analyzer
    lua-language-server
  #   rnix-lsp
  #   vscode-langservers-extracted
  #   javascript-typescript-langserver
  #   emmet-ls
  #   nodePackages.prettier
  #   shfmt
  #   alejandra
  ];

  programs.neovim = {
    enable = true;
    withNodeJs = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = builtins.readFile ./nvim_init.lua;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    extraPackages = with pkgs; [gcc];
  };

  home.file = {
    ".config/nvim/lua" = {
      source = ./files/nvim/lua;
      recursive = true;
    };
  };
}
