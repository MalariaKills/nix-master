{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      # Add spacing between prompts for clean monk-like flow
      add_newline = true;

      format = ''
[👹](bold #d7875f) $username[ ・](dimmed) $hostname $directory$git_branch$git_status $package $rust$line_break$character
'';

      line_break = {
        disabled = true;
      };

      character = {
        success_symbol = "[〆](bold #d7875f)";  # matches the oni symbol
        error_symbol   = "[✗](bold #cc241d)";  # deeper crimson for error
      };

      username = {
        show_always = true;
        style_user  = "bold #d7875f";          # torii gate orange
        format      = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        format   = "[$hostname](bold #3a5c47)"; # pine green
      };

      directory = {
        style     = "bold #b87745";            # warm walnut brown from your desk
        read_only = " 󰌾";
      };

      git_branch = {
        symbol = " ";
        style  = "bold #6BAED6";               # cool blue for clarity
      };

      git_status = {
        style = "bold #cc241d";                # matches error symbol
      };

      rust = {
        symbol = "🦀 ";
        style  = "bold #d7875f";               # matches key accents
      };
    };
  };
}
