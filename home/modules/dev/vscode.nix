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
      esbenp.prettier-vscode
      eamodio.gitlens
    ];
  };
}
