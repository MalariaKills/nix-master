{ config, pkgs, ... }:

{
  # Fontconfig required so WezTerm + system apps see fonts
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # Nerd Fonts mono
    nerd-fonts.jetbrains-mono

    # Emoji fonts
    noto-fonts-emoji

    # Monaspace family (Xenon)
    pkgs.monaspace
  ];
}
