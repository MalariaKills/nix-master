# This is a home manager config for vscode
# Intended to be used across ALL production devices
# Cannot add to modules/apps core.nix or graphical.nix
# Because declaring extensions requires HM.
{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;  # or pkgs.vscodium if you decide to go FOSS later

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
  };
}
