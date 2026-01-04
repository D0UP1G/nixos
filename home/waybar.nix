{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    waybar
    wofi
    networkmanager
    pamixer
    brightnessctl
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = false;
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        margin = "0 0 5 0";
        spacing = 0;
        modules-left = [ "custom/launcher" "cpu" "memory" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "pulseaudio" "backlight" "battery" "network" "clock" ];
        exclusive = true;
        passthrough = false;
        
        "custom/launcher" = {
          format = "○";  # Кружок как текст
          on-click = "${pkgs.wofi}/bin/wofi --show drun";
          on-click-right = "poweroff";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "󰍛 {usage}%";
          format-alt = "󰍛 {avg_frequency} GHz";
          tooltip = true;
          tooltip-format = "Процессор:\n══════════\n• Использование: {usage}%\n• Температура: {temperature}°C\n• Частота: {avg_frequency} GHz\n• Потоки: {num_threads}\n• Ядра: {num_cores}";
          on-click = "";  # Можно добавить команду для запуска монитора ресурсов
        };

        "memory" = {
          interval = 2;
          format = "󰘚 {percentage}%";
          format-alt = "󰘚 {used:0.1f}G/{total:0.1f}G";
          tooltip = true;
          tooltip-format = "Память:\n════════\n• Использовано: {used:0.1f} GB\n• Всего: {total:0.1f} GB\n• Свободно: {avail:0.1f} GB\n• Использование: {percentage}%\n• Swap: {swapUsed:0.1f}G/{swapTotal:0.1f}G ({swapPercentage}%)";
          on-click = "";  # Можно добавить команду для запуска монитора ресурсов
        };

        "sway/window" = {
          format = "{app_id}";  # Используем title вместо name
          max-length = 50;
          format-alt = "-- Без названия --";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰸈";
          format-icons = {
            default = ["󰕿" "󰖀" "󰕾"];
          };
          scroll-step = 5;
          on-click = "${pkgs.pamixer}/bin/pamixer -t";
        };

        "backlight" = {
          format = "{icon} {percent}%";
          format-icons = [ "󰃝" "󰃞" "󰃟" "󰃠" ];
          on-scroll-up = "${pkgs.brightnessctl}/bin/brightnessctl set +5%";
          on-scroll-down = "${pkgs.brightnessctl}/bin/brightnessctl set 5%-";
        };

        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 20;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󰚥 {capacity}%";
          format-full = "󰁹 {capacity}%";
          format-icons = [ 
            "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" 
            "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
          ];
        };

        "network" = {
          format-wifi = "󰖩 {essid}";
          format-ethernet = "󰈁 {ifname}";
          format-disconnected = "󰖪";
        };

        "clock" = {
          format = "󰥔 {:%H:%M}";
          format-alt = "󰃭 {:%d.%m.%Y}";
          tooltip = true;
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "month";
            on-scroll = 1;
            format = {
              months = "<span color='#1a73e8'><b>{}</b></span>";
              days = "<span color='#e8eaed'><b>{}</b></span>";
              weekdays = "<span color='#1a73e8'><b>{}</b></span>";
              today = "<span color='#ff0000'><b><u>{}</u></b></span>";
            };
          };
        };
      };
    };

    style = ''
      * {
        font-family: "SF Pro Display", "DejaVu Sans", "Font Awesome 6 Free", sans-serif;
        font-size: 14px;
        font-weight: 500;
        min-height: 0;
        border: none;
        padding: 0px;
        margin: 0px;
      }
      
      window#waybar {
        background-color: rgba(32, 33, 36, 1.0);
        color: #e8eaed;
        border: none;
        background-color: transparent;
        border-radius: 10px 10px 10px 10px;
        padding: 0px;	
        border-top: 1px solid rgba(255, 255, 255, 0.08);
      }

      /* Белый круг слева */
      #custom-launcher {
        background-color: #1f1f1f;
        color: white;
        padding: 6px 12px 6px 16px;
        min-width: 28px;
        min-height: 28px;
        font-size: 16px;
        font-weight: 900;
        border-radius: 0px 0px 0px 0px;	
      }
      
      /* Индикатор CPU */
      #cpu {
        background-color: #1f1f1f;
        color: #e8eaed;
        padding: 0 14px;
        border-left: 1px solid rgba(255, 255, 255, 0.06);
      }
      
      /* Индикатор памяти */
      #memory {
        background-color: #1f1f1f;
        color: #e8eaed;
        padding: 0 14px;
        border-left: 1px solid rgba(255, 255, 255, 0.06);
      	border-radius: 0px 0px 10px 0px;
	}
      
      /* Цветовая индикация для CPU */
      #cpu.critical {
        color: #ea4335;
        animation: blink 1s infinite;
      }
      
      #cpu.warning {
        color: #fbbc04;
      }
      
      /* Цветовая индикация для памяти */
      #memory.critical {
        color: #ea4335;
        animation: blink 1s infinite;
      }
      
      #memory.warning {
        color: #fbbc04;
      }
      
      /* Название активного окна в центре */
      #window {
        color: #e8eaed;
        font-weight: normal;
        padding: 0 20px;
        background-color: #1f1f1f;
        border-radius: 0px 0px 10px 10px;
      }
      
      /* Правые модули */
      #pulseaudio, #backlight, #battery, #network, #clock {
        color: #e8eaed;
        padding: 0 14px;
        background-color: #1f1f1f;
      }
      
      #pulseaudio {
        border-left: none;		
        border-radius: 0px 0px 0px 10px;	
      }
      
      /* Часы с календарем */
      #clock {
        background-color: rgba(255, 255, 255, 0.03);
        font-weight: bold;
        border-right: 1px solid rgba(255, 255, 255, 0.06);
        border-radius: 0px 0px 0px 0px;
        background-color: #1f1f1f;
      }
      
      /* Состояния батареи */
      #battery.warning {
        color: #fbbc04;
      }
      
      #battery.critical {
        color: #ea4335;
      }
      
      #battery.charging {
        color: #34a853;
      }
      
      /* Индикатор сети */
      #network.disconnected {
        color: #ea4335;
      }
      
      /* Выключенный звук */
      #pulseaudio.muted {
        color: #9aa0a6;
      }
      
      /* Календарь в тултипе */
      tooltip {
        background-color: rgba(32, 33, 36, 0.95);
        border: 1px solid rgba(255, 255, 255, 0.1);
        border-radius: 8px;
        padding: 12px;
      }
      
      /* Анимация для критических состояний */
      @keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 0.5; }
        100% { opacity: 1; }
      }
    '';
  };
}
