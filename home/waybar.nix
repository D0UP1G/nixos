{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    
    style = ''
      * {
          font-family: "Iosevka Nerd Font";
          font-weight: bold;
          font-size: 13px;
      }

      window#waybar {
          background-color: transparent;
      }

      window > box {
          margin-top: 5px;
          margin-left: 5px;
          margin-right: 5px;
          padding-left: 2px;
          padding-right: 2px;
      }

      #window {
          background-color: #202020;
          border-radius: 4px;
          padding: 8px 12px 8px 8px;
          margin: 4px 0;
      }

      window#waybar.empty #window {
          background: rgba(12, 12, 12, 0);
      }

      .modules-left {
          padding: 3px;
      }

      .modules-right {
          padding: 3px;
      }

      .modules-center {
          padding: 3px;
      }

      #workspaces {
          background-color: #202020;
          border-radius: 4px;
          padding: 4px 4px 4px 6px;
          margin: 4px 0;
      }

      #workspaces button {
          min-height: 0;
          padding: 0 7px;
          margin-right: 2px;
          color: #f5e0dc;
      }

      #workspaces button.urgent {
          color: #f5e0dc;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #workspaces button.empty {
          color: #cdd6f4;
      }

      #workspaces button.visible {
          color: #89dceb;
      }

      #workspaces button.active {
          color: #fab387;
      }

      @keyframes blink {
          to {
              color: #202020;
              background-color: #dcf5f3;
          }
      }

      #custom-launcher {
          background-color: #202020;
          border-radius: 4px;
          padding: 8px 8px 8px 4px;
          margin: 4px 0;
          color: #89dceb;
      }

      #custom-power {
          background-color: #202020;
          border-radius: 4px;
          padding: 8px 12px 8px 8px;
          margin: 4px 0;
      }

      #cpu {
          background-color: #202020;
          border-radius: 4px 4px 4px 4px;
          padding: 8px 8px 8px 20px;
          margin: 4px 0;
          color: #f2cdcd;
      }

      #memory {
          background-color: #202020;
          border-radius: 4px;
          padding: 8px 8px 8px 20px;
          margin: 4px 0;
          color: #fab387;
      }

      #wireplumber {
          background-color: #202020;
          border-radius: 4px;
          padding: 8px 8px 8px 20px;
          margin: 4px 0;
          color: #f9e2af;
      }

      #wireplumber.muted {
          color: #f38ba8;
      }

      #clock {
          background-color: #202020;
          border-radius: 4px 4px 4px 4px;
          padding: 8px 10px 10px 10px;
          margin: 4px 0;
          color: #94e2d5;
      }

      #network {
          background-color: #202020;
          color: #cdd6f4;
          border-radius: 4px;
          padding: 8px;
          margin: 4px 0;
      }

      #network.disabled {
          color: #f38ba8;
      }

      #tray {
          background-color: #202020;
          border-radius: 20px;
          padding: 8px 12px 8px 12px;
          margin: 4px 0;
      }

      #battery {
          background-color: #202020;
          color: #cdd6f4;
          border-radius: 4px;
          padding: 8px;
          margin: 4px 0;
      }

      #backlight {
          background-color: #202020;
          color: #cdd6f4;
          border-radius: 4px;
          padding: 8px;
          margin: 4px 0;
      }
    '';
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 4;
        
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
          "cpu"
          "memory"
        ];
        
        modules-center = [
          "hyprland/window"
        ];
        
        modules-right = [
          "tray"
          "network#spd"
          "wireplumber"
          "network"
          "backlight"
          "clock"
          "battery"
          "custom/power"
        ];
        
        backlight = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = ["" ""];
        };
        
        "hyprland/workspaces" = {
          format = "{name}";
          "persistent-workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
          };
        };
        
        "hyprland/window" = {
          icon = false;
          "separate-outputs" = true;
          format = "{}";
        };
        
        tray = {
          "icon-size" = 15;
          spacing = 7;
        };
        
        clock = {
          format = "{:%H:%M}  ";
          "format-alt" = "{:%A, %B %d, %Y (%R)}";
          "tooltip-format" = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            "on-click-right" = "mode";
            format = {
              months = "<span color='#f5e0dc'><b>{}</b></span>";
              days = "<span color='#cdd6f4'><b>{}</b></span>";
              weeks = "<span color='#fab387'><b>W{}</b></span>";
              weekdays = "<span color='#f5c2e7'><b>{}</b></span>";
              today = "<span color='#cba6f7'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            "on-click-right" = "mode";
            "on-click-forward" = "tz_up";
            "on-click-backward" = "tz_down";
            "on-scroll-up" = "shift_up";
            "on-scroll-down" = "shift_down";
          };
        };
        
        cpu = {
          interval = 1;
          format = "CPU {usage:>2}% {icon0}{icon1}{icon2}{icon3}";
          "format-icons" = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
          "on-click" = "${pkgs.alacritty}/bin/alacritty -e ${pkgs.btop}/bin/btop";
        };
        
        memory = {
          interval = 30;
          format = "MEM  {used:0.1f}G/{total:0.1f}G";
        };
        
        network = {
          format = " Disabled";
          "format-wifi" = " ";
          "format-ethernet" = "  ";
          "format-disconnected" = "睊";
          tooltip = true;
          "tooltip-format" = "{ifname}\n{ipaddr}";
          "tooltip-format-wifi" = "{essid} {ifname}\n{ipaddr}\nstrength: {signalStrength}%";
          "on-click" = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
        };
        
        "custom/launcher" = {
          format = "   ";
          tooltip = false;
          "on-click" = "${pkgs.wofi}/bin/wofi --show drun";
        };
        
        "custom/power" = {
          format = "  ";
          "on-click" = "${pkgs.systemd}/bin/poweroff";
          tooltip = false;
        };
        
        wireplumber = {
          "scroll-step" = 10;
          format = "{volume}%";
          "format-bluetooth" = "{icon}{volume}%";
          "format-muted" = "muted ";
          "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
          "format-icons" = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
            ];
          };
        };
        
        "network#spd" = {
          interval = 1;
          format = "{ifname}";
          "format-wifi" = "↓ {bandwidthDownBytes} ↑ {bandwidthUpBytes}";
          "format-ethernet" = "↓ {bandwidthDownBytes} ↑ {bandwidthUpBytes}";
        };
        
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          "format-charging" = " {capacity}%";
          "format-pluged" = " {capacity}%";
          "format-full" = " {capacity}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
         
          ];
        };
      };
    };
  };
  
  # Установка необходимых пакетов для работы waybar
  home.packages = with pkgs; [
    wofi
    networkmanager_dmenu
    pavucontrol
    btop
  ];
}
