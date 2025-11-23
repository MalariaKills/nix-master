{ config, pkgs, ... }:

{
  # Enable fontconfig for WezTerm, VSCode, etc.
  fonts.fontconfig.enable = true;

  # Install fonts available to this user
  home.packages = with pkgs; [
    # JetBrains Mono Nerd Font (patched for terminals)
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # Emoji support (WezTerm + browsers)
    noto-fonts-emoji

    # Monaspace (Xenon + family)
    monaspace
  ];
}
