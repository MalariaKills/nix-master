{ config, pkgs, ... }:

{
  # Ensure KDE apps honor the dark color scheme
  xdg.configFile."kdeglobals".text = ''
[General]
ColorScheme=BreezeDark

[Icons]
Theme=breeze-dark

[KDE]
widgetStyle=Breeze
LookAndFeelPackage=BreezeDark
'';  

  # Plasma desktop theme
  xdg.configFile."plasmarc".text = ''
[Theme]
name=BreezeDark
color=BreezeDark
'';  

  # Window decorations (KWin)
  xdg.configFile."kwinrc".text = ''
[org.kde.kdecoration2]
theme=Breeze
plugin=org.kde.breeze
'';  

  # GTK 3 + 4 Themes (fixes Dolphin + other GTK apps)
  xdg.configFile."gtk-3.0/settings.ini".text = ''
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=breeze-dark
gtk-application-prefer-dark-theme=1
'';  

  xdg.configFile."gtk-4.0/settings.ini".text = ''
[Settings]
gtk-theme-name=Breeze-Dark
gtk-icon-theme-name=breeze-dark
gtk-application-prefer-dark-theme=1
'';  

  # Install theme packages (NixOS requires these!)
  home.packages = with pkgs; [
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
  ];
}
