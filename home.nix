{ config, pkgs, ... }:

{
  # GTK theme configuration
  gtk = {
    enable = true;
#    theme = {
#      name = "Adwaita-dark";
#      package = pkgs.gnome-themes-extra;
    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme.override { tweaks = [ "black" ]; };
};
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  # Qt theme configuration
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };

  # Ensure dconf is installed for GTK4/libadwaita
  home.packages = with pkgs; [ dconf ];

  # Set dconf settings for dark theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  # Home Manager state version
  home.stateVersion = "24.11";
  }
