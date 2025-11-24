{ config, pkgs, ... }:

{
  imports = [
    ./modules/terminal/wezterm.nix
    ./modules/terminal/starship.nix
    ./modules/terminal/fish.nix
    ./modules/terminal/fastfetch.nix

    ./modules/dev/vscode.nix

    ./modules/fonts/default.nix
  ];

  home.username = "testuser";
  home.homeDirectory = "/home/testuser";

  # Lock HM's state version to when you started using it
  home.stateVersion = "25.05";

  #################################
  # Git
  #################################
  programs.git = {
    enable = true;
    userName = "VM";
    userEmail = "mo.sunday@proton.me";
  };

  #################################
  # OS keyring (per-user)
  #################################
  # This runs the GNOME keyring daemon in your session so apps like
  # VSCode/Copilot can store secrets in a keyring.
  programs.gnome-keyring.enable = true;

  #################################
  # XDG portals / helpers in user env
  #################################
  # These make sure you have the portal bits + xdg tools available
  # in your PATH for things like "open browser to log into GitHub".
  home.packages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-kde
    xdg-utils             # xdg-open, xdg-settings, etc.
  ];
}
