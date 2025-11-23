{ config, pkgs, ... }:

{
  # Force KDE to use Breeze Dark global theme + colors
  xdg.configFile."kdeglobals".text = ''
[KDE]
LookAndFeelPackage=org.kde.breezedark.desktop

[General]
ColorScheme=BreezeDark
  '';
}
