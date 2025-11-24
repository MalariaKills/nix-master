{ config, pkgs, ... }:

{
  programs.plasma = {
    enable = true;

    workspace = {
      # Global theme (Look & Feel)
      lookAndFeel = "org.kde.breezedark.desktop";

      # Plasma theme (panel, widgets)
      theme = "Breeze Dark";

      # App color scheme (Dolphin, System Settings, etc.)
      colorScheme = "BreezeDark";

      # Icons
      iconTheme = "breeze-dark";

      # If this ever errors, just comment it out:
      # cursorTheme = "Breeze_Snow";
    };
  };

  # GTK apps (Firefox, Discord, VSCode, etc.) handled by plain Home Manager
      gtk = {
      enable = true;

      theme = {
      name = "Breeze-Dark";
    # Optional but nice to be explicit:
    # package = pkgs.kdePackages.breeze-gtk or pkgs.libsForQt5.breeze-gtk;
  };

      iconTheme = {
    name = "breeze-dark";
    # optional: package = pkgs.kdePackages.breeze-icons;
  };

  # Tell GTK apps explicitly: prefer dark
     gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;
     gtk4.extraConfig."gtk-application-prefer-dark-theme" = 1;
};
}
