{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    includes = [{ path = "/home/cjnucette/.config/home-manager/home/git/gitconfig"; }];
  };
}
