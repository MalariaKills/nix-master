{ config, pkgs, ... }:

{
  imports = [
    ./modules/dev/vscode.nix
    ./modules/terminal/wezterm.nix
    ./modules/terminal/starship.nix
    ./modules/terminal/fish.nix
    ./modules/terminal/fastfetch.nix
    ./modules/fonts/default.nix
  ];

  home.username = "spablo";
  home.homeDirectory = "/home/spablo";

  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "legatvs";
    userEmail = "mo.sunday@proton.me";
  };

  # More HM programs later (fish, starship, etc.)
}
