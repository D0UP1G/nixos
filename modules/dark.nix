# In /etc/nixos/configuration.nix
{ config, pkgs, ... }:
{
  # Enable essential system services
  services.dbus.enable = true; # Required for portals and themes[citation:2]
  xdg.portal = {
    enable = true;
    wlr.enable = true; # Required for screen sharing in Sway[citation:2]
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # Critical for GTK apps[citation:2][citation:5]
  };

  # Enable Sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Helps GTK integration[citation:2][citation:5]
  };

  # ... rest of your system config (users, boot, networking, etc.)
}
