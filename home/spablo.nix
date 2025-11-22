{ config, pkgs, ... }:

{
  imports = [
    ./modules/dev/vscode.nix
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
