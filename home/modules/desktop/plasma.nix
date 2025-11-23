{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    # Entire Plasma desktop theme
    workspace.lookAndFeel = "org.kde.breezedark.desktop";

    # Plasma theme (panel, widgets)
    workspace.theme = "Breeze Dark";

    # Window decorations
    workspace.windowDecoration = {
      theme = "Breeze";
      buttons = "close,maximize,minimize";
    };

    # App color schemes (Dolphin, System Settings, all KDE apps)
    workspace.colorScheme = "BreezeDark";

    # Icons
    workspace.iconTheme = "breeze-dark";

    # Cursors (optional)
    #workspace.cursorTheme = "Breeze_Snow";

    # GTK apps (Firefox, Discord, VSCode, Chrome, Steam, etc.)
    gtk = {
      enable = true;
      theme = "Breeze-Dark";
      iconTheme = "breeze-dark";
    };
  };
}
