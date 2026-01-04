# In ~/.config/home-manager/home.nix
{ pkgs, ... }:
{
  # Configure GTK themes (this is where gtk.gtk3 belongs)
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    # This is the correct place for gtk3.extraConfig
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    # For GTK4 apps, use dconf
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Configure QT to follow the GTK theme
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "gtk";
  };

  # For GTK4/libadwaita apps to respect dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # ... other home-manager settings
}
