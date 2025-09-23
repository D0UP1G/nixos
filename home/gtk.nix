{
  config,
  pkgs,
  ...
}:{
  # Настройка dconf для GNOME/GTK приложений
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark"; # Пример темы
    };
  };

  # Настройка GTK
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
  };

  # Настройка Qt для KDE и других Qt-приложений
  qt = {
    enable = true;
    platformTheme = "gnome"; # Или "qtct" для более тонкого контроля
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
