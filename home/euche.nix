{ config, pkgs, ... }:

{
  imports = [
    ./modules/dev/vscode.nix
  ];

  home.username = "euche";
  home.homeDirectory = "/home/euche";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "euche";
    userEmail = "mo.sunday@proton.me";
  };
}