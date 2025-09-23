{
    catppuccin.tmux = {
	enable = true;
	flavor = "macchiato";
	extraConfig = ''
	    set -g @catppuccin_window_status_style "rounded"
	    set -g status-right-length 100
	    set -g status-left-length 100
	    set -g status-left ""
	    set -g status-right "#{E:@catppuccin_status_application}"
	    set -ag status-right "#{E:@catppuccin_status_session}"
	    set -ag status-right "#{E:@catppuccin_status_uptime}"
	    '';
    };

    programs.tmux = {
	enable = true;
	mouse = true;
	keyMode = "vi";
	clock24 = true;
	disableConfirmationPrompt = true;
	newSession = true;
# prefix = "C-s";

	extraConfig = /*conf*/ ''
	    bind-key h select-pane -L
	    bind-key j select-pane -D
	    bind-key k select-pane -U
	    bind-key l select-pane -R

	    bind-key r source ~/.config/tmux/tmux.conf

	    set -g status-position top
	    '';
    };
}
