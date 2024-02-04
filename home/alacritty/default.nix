{ config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        normal = { family = "FiraCode Nerd Font"; style = "Regular"; };
        bold = { family = "FiraCode Nerd Font"; style = "Bold"; };
        italic = { family = "FiraCode Nerd Font"; style = "Italic"; };
        bold_italic = { family = "FiraCode Nerd Font"; style = "BoldItalic"; };
        size = 13;
        draw_bold_text_with_bright_colors = true;
      };
      window = {
        dimensions = {
          columns = 100;
          lines = 24;
        };
        padding = {
          x = 5;
          y = 5;
        };
      };
      scrolling.history = 10000;
      scrolling.multiplier = 1;
      selection.save_to_clipboard = true;
      colors = {
        # Default colors
        primary = {
          background = "0x222436";
          foreground = "0xc8d3f5";
        };
        # Normal colors
        normal = {
          black = "0x1b1d2b";
          red = "0xff757f";
          green = "0xc3e88d";
          yellow = "0xffc777";
          blue = "0x82aaff";
          magenta = "0xc099ff";
          cyan = "0x86e1fc";
          white = "0x828bb8";
        };
        # Bright colors
        bright = {
          black = "0x444a73";
          red = "0xff757f";
          green = "0xc3e88d";
          yellow = "0xffc777";
          blue = "0x82aaff";
          magenta = "0xc099ff";
          cyan = "0x86e1fc";
          white = "0xc8d3f5";
        };
        indexed_colors = [
          { index = 16; color = "0xff966c"; }
          { index = 17; color = "0xc53b53"; }
        ];
      };
    };
  };
}
