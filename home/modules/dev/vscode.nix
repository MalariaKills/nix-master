# This is a home manager config for vscode
# Intended to be used across ALL production devices
# Cannot add to modules/apps core.nix or graphical.nix
# Because declaring extensions requires HM.
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default.extensions = with pkgs.vscode-extensions; [

      #Nix
      jnoortheen.nix-ide

      #Languages
      ms-python.python
      rust-lang.rust-analyzer
      golang.go

      #General
      github.copilot
      esbenp.prettier-vscode
      eamodio.gitlens
    ];

    # User settings
    userSettings = {
      # Custom title bar for better Wayland/portal integration
      "window.titleBarStyle" = "custom";
    };
  };

  # Override the VSCode desktop file to add password-store flag
  # This ensures VSCode always uses gnome-libsecret (works with KWallet's secret service)
  xdg.desktopEntries.code = {
    name = "Visual Studio Code";
    genericName = "Text Editor";
    exec = "${pkgs.vscode}/bin/code --password-store=gnome-libsecret %F";
    icon = "vscode";
    type = "Application";
    categories = [ "Development" "IDE" ];
    mimeType = [ "text/plain" "inode/directory" ];
    settings = {
      StartupWMClass = "Code";
    };
  };
}
