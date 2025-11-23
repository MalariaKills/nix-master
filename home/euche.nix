{ config, pkgs, ... }:

{
  imports = [
    ./modules/desktop/plasma.nix

    ./modules/terminal/wezterm.nix
    ./modules/terminal/starship.nix
    ./modules/terminal/fish.nix
    ./modules/terminal/fastfetch.nix
    
    ./modules/dev/vscode.nix

    ./modules/fonts/default.nix
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