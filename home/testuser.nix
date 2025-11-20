{ config, pkgs, ... }:

{
  home.username = "testuser";
  home.homeDirectory = "/home/testuser";

  # Lock HM's state version to when you started using it
  home.stateVersion = "25.05";

  programs.git = {
    enable = true;
    userName = "VM";
    userEmail = "mo.sunday@proton.me";
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;  # or pkgs.vscodium if you decide to go FOSS later

    extensions = with pkgs.vscode-extensions; [
      
      #Nix
      jnoortheen.nix-ide
      
      #Languages
      ms-python.python
      rust-lang.rust-analyzer
      golang.go

      #General
      esbenp.prettier-vscode
      eamodio.gitlens
    ];
  };

  # You can add more HM programs here later (fish, starship, etc.)
}

