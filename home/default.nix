{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "cjnucette";
    homeDirectory = "/home/cjnucette";
    stateVersion = "23.05";
  };

  imports = [
    ./alacritty
    ./bash
    ./git
    # ./nvim
    # ./nixvim
    ./wezterm
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # cli
    bat
    bc
    blackbox-terminal
    conky
    direnv
    eza
    ffmpeg
    gnumake
    htop
    jq
    killall
    kitty
    libgccjit
    lm_sensors
    mkvtoolnix
    neofetch
    neovim
    nnn
    p7zip
    rio
    silver-searcher
    sshfs
    stow
    tilix
    tmux
    unzip
    xclip
    yt-dlp
    zip

    # gui
    (nerdfonts.override {fonts = ["JetBrainsMono" "FiraCode" "DroidSansMono" "Ubuntu"];})
    papirus-icon-theme
    corefonts
    adw-gtk3
    numix-cursor-theme

    # apps
    brave
    celluloid
    cinnamon.nemo-with-extensions
    firefox
    google-chrome
    mplayer
    mpv
    ioquake3

    # gnome
    gnome.gnome-tweaks
    gnome.gnome-clocks
    gnome.gnome-weather
    gnome.gnome-software
    gnome.eog
    gnome-extension-manager
    gnomeExtensions.dash-to-panel
    gnomeExtensions.search-light
    gnomeExtensions.tiling-assistant
    gnomeExtensions.rounded-corners
    # gnomeExtensions.material-you-color-theming
    gnomeExtensions.color-picker
    gnomeExtensions.wallpaper-slideshow

    # nvim deps
    (python311.withPackages (ps: with ps; [neovim pip gtts]))
    sox
    fd
    ripgrep
    deno
    nodejs_21

    # lsp, linters
    rust-analyzer
    lua-language-server
    rnix-lsp
    nixd
    vscode-langservers-extracted
    javascript-typescript-langserver
    emmet-ls
    nodePackages.prettier
    shfmt
    alejandra
    ltex-ls
  ];

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
    settings.git.git_protocol = "ssh";
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
