{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme = "kvantum";  # Используем Kvantum как платформенную тему
  };

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum  # Для Qt5
    qt6Packages.qtstyleplugin-kvantum # Для Qt6
    kvantum                           # Менеджер тем Kvantum
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kvantum";
  };

  # GTK настройки остаются такими же
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    # ... остальные GTK настройки
  };
}
