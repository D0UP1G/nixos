{
        programs.waybar = {
                enable = true;
                settings = {
                        topBar = {
                                layer = "top";
                                position = "top";
                                height = 10;
                                margin = "5";
                                sapcing = 10;
                                mode = "top";
                                reload_style_on_change = true;

                                modules-left = [
                                        "hyprland/workspaces"
                                ];

                                modules-center = [
                                        "hyprland/window"
                                ];

                                modules-right = [
                                        "tray"
                                        # "hyprland/language"
					"idle_inhibitor"
					"backlight"
                                        "wireplumber"
					"disk"
                                        "battery"
                                        "memory"
                                        "cpu"
                                        "temperature"
                                        "clock"
                                ];

				idle_inhibitor = {
				    format = "{icon}";
				    format-icons = {
					activated = "🫨";
					deactivated = "💤";
				    };
				};

				backlight = {
				    interval = 2;
				    format = "☀️{percent}%";
				    on-scroll-up = "brightnessctl set +4";
				    on-scroll-down = "brightnessctl set 4-";
				};

				wireplumber = {
				    format = "{icon} {volume}%";
				    format-muted = "🔇";
				    on-click = "pavucontrol";
				    format-icons = ["🔕" "🔈" "🔉" "🔊" "🤪"];
				};

				disk = {
				    intervel = 30;
				    format = "💽{percentage_used}%";
				    tooltip-format = "{used} used out of {total} on \"{path}\" ({percentage_used}%)";
				};

				memory = {
				    interval = 10;
				    format = "📼{used}";
				    tooltip-format = "{used}GiB used of {total}GiB ({percentage}%)";
				};

				cpu = {
				    interval = 10;
				    format = "🔥{usage}%";
				};

				temperature = {
				    interval = 10;
				};

				clock = {
				    interval = 1;
				    format ="{:%H:%M:%S}";
				};

				battery = {
				    interval = 10;
				    format = "{icon}{capacity}%";
				    format-icons = [ "|-    |" "|--   |" "|---  |" "|=    |" "|==   |" "|===  |" "|+    |" "|++   |" "|+++  |" "|++++ |" "|+++++|" ];
				    tooltip = true;
				    tooltip-format = "{timeTo}";
				};

				"hyprland/workspaces" = {
				    show-special = true;
				    persistent-workspaces = {
					"*" = [1 2 3 4 5 6 7 8 9 10];
				    };
				    format = "{icon}";
				    format-icons = {
					active = "";
					empty = "=";
					default = "";
					urgent = "=";
					special = "=";
				    };
				};

				"hyprland/window" = {
				    icon = true;
				    icon-size = 20;
				    rewrite = {
					"^$" = "Desktop";
				    };
				    max-length = 50;
				};

				"hyprland/language" = {
				    format = "{short}";
				};
			};
		};
		style = ''
		    window#waybar {
			font-family: "JetBrains Mono NerdFont";
			background-color: rgba(0,0,0,0);
			font-size: 1rem;
			border-radius: 0.5rem;
color: white;
		    }


		.modules-left, .modules-center {
opacity: 1;
	 /* background: linear-gradient(45deg, rgb(214, 39, 200), rgb(5, 83, 252)); */
	 border-radius: 0.5rem;
padding: 2px;
		}

		.modules-right {
opacity: 1;
	 background-color: rgba(0,0,0,0.5);
	 border-radius: 0.5rem;
padding: 2px 2px 2px 10px
		}

		.modules-left, .modules-center, .modules-right * {
margin: 0 3px;
		}

#workspaces {
    background-color: rgba(0,0,0,0.5);
    border-radius: 0.5rem;
padding: 0 2px;
}

#workspaces button {
color: white;
       font-size: 0.6rem;
padding: 0 0.3rem 0 0;
}

#window {
    background-color: rgba(0,0,0,0.5);
    border-radius: 0.5rem;
padding: 2px 5px;
}

#clock {
    font-weight: bolder;
    border-radius: 0.5rem;
    padding: 0 3px 0 0;
}

#battery {
color: lightgreen;
}

#memory {
color: lightpink;
}

#disk {
color: lightskyblue;
}

#cpu {
color: lightgoldenrodyellow;
}

#temperature {
color: lightslategray;
}
'';
};
}
