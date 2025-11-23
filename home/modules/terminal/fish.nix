{ config, pkgs, ... }:

let
  nvim = "${pkgs.neovim}/bin/nvim";
in
{
  # Make sure these are installed somewhere
  home.packages = [
    pkgs.fastfetch
    pkgs.neovim
  ];

  programs.fish = {
    enable = true;

    # Runs in interactive shells
    interactiveShellInit = ''
      # No greeting
      set -g fish_greeting ""

      # Only run fastfetch in interactive TTYs
      if status is-interactive; and test -t 1
        fastfetch
      end
    '';

    # Runs for all fish shells (login + interactive)
    shellInit = ''
      # Starship prompt
      starship init fish | source
    '';
  };

  programs.starship = {
    enable = true;

    # Optional: if you use this, you can drop the manual `starship init` above.
    # enableFishIntegration = true;
  };

  # Environment variables (applies to all shells, not just fish)
  home.sessionVariables = {
    SUDO_EDITOR = nvim;
    # Or, alternatively:
    # VISUAL = nvim;
    # EDITOR = nvim;
  };
}
