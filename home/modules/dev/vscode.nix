# This is a home manager config for vscode
# Intended to be used across ALL production devices
# Cannot add to modules/apps core.nix or graphical.nix
# Because declaring extensions requires HM.
{ pkgs, ... }:

let
  # Create a wrapper that always passes --password-store=gnome-libsecret
  vscode-wrapped = (pkgs.symlinkJoin {
    name = "vscode-wrapped";
    paths = [ pkgs.vscode ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/code \
        --add-flags "--password-store=gnome-libsecret"
    '';
  }) // {
    # Preserve metadata that home-manager expects
    pname = pkgs.vscode.pname;
    version = pkgs.vscode.version;
  };
in
{
  programs.vscode = {
    enable = true;
    package = vscode-wrapped;

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
}
