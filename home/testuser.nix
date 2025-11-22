{ config, pkgs, ... }:

{

  imports = [
    ./modules/dev/vscode.nix
    ./modules/terminal/wezterm.nix
  ];

  home.username = "testuser";
  home.homeDirectory = "/home/testuser";

  # Lock HM's state version to when you started using it
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "VM";
    userEmail = "mo.sunday@proton.me";
  };

  # You can add more HM programs here later (fish, starship, etc.)
}

