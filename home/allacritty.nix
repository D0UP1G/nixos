{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
        padding = {
          x = 10;
          y = 10;
        };
      };

      font = {
        size = 12;
      };

      colors = {
        primary = {
          background = "#1E1E2E";
          foreground = "#CDD6F4";
          bright_foreground = "#CDD6F4";
          dim_foreground = "#CDD6F4";
        };

        normal = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        bright = {
          black = "#585B70";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#A6ADC8";
        };

        dim = {
          black = "#45475A";
          red = "#F38BA8";
          green = "#A6E3A1";
          yellow = "#F9E2AF";
          blue = "#89B4FA";
          magenta = "#F5C2E7";
          cyan = "#94E2D5";
          white = "#BAC2DE";
        };

        indexed_colors = [
          { index = 16; color = "#FAB387"; }
          { index = 17; color = "#F5E0DC"; }
        ];

        cursor = {
          cursor = "#F5E0DC";
          text = "#1E1E2E";
        };

        vi_mode_cursor = {
          cursor = "#B4BEFE";
          text = "#1E1E2E";
        };

        selection = {
          background = "#F5E0DC";
          text = "#1E1E2E";
        };

        search = {
          matches = {
            background = "#A6ADC8";
            foreground = "#1E1E2E";
          };
          focused_match = {
            background = "#A6E3A1";
            foreground = "#1E1E2E";
          };
        };

        hints = {
          start = {
            background = "#F9E2AF";
            foreground = "#1E1E2E";
          };
          end = {
            background = "#A6ADC8";
            foreground = "#1E1E2E";
          };
        };
      };

      keyboard.bindings = [
        {
          key = "Return";
          mods = "Control|Shift";
          action = "SpawnNewInstance";
        }
      ];
    };
  };
}
