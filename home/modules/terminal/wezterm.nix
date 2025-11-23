{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    # optional: override package if you ever want a specific version
    # package = pkgs.wezterm;

    extraConfig = ''
      local wezterm = require 'wezterm'

      return {
        default_prog = { "fish", "-l" },
        
        font = wezterm.font_with_fallback {
          { family = "Monaspace Xenon", weight = "Regular" },
          { family = "JetBrainsMono Nerd Font Mono", weight = "Regular" },
          { family = "Noto Color Emoji" },
        },
        font_size = 11.5,
        line_height = 1.0,
        cell_width = 0.9,
        initial_cols = 100,
        initial_rows = 28,

        -- Colors
        color_scheme = "DoomOneCustom",
        window_background_opacity = 0.95,
        enable_tab_bar = true,
        use_fancy_tab_bar = false,

        colors = {
          foreground = "#bbc2cf",
          background = "#282c34",
          cursor_bg = "#51afef",
          cursor_border = "#51afef",
          cursor_fg = "#282c34",
          selection_bg = "#2257a0",
          selection_fg = "#ffffff",

          ansi = {
            "#1B2229", "#ff6c6b", "#98be65", "#ecbe7b",
            "#51afef", "#c678dd", "#46d9ff", "#bbc2cf"
          },
          brights = {
            "#3f444a", "#ff6c6b", "#98be65", "#ecbe7b",
            "#51afef", "#a9a1e1", "#46d9ff", "#efefef"
          },

          indexed = {
            [16] = "#ff6c6b", -- extra emphasis color
          },

          tab_bar = {
            background = "#21242a",
            active_tab = {
              bg_color = "#282c34",
              fg_color = "#51afef",
              intensity = "Bold",
              underline = "None",
              italic = false,
              strikethrough = false,
            },
            inactive_tab = {
              bg_color = "#21242a",
              fg_color = "#bbc2cf",
            },
            inactive_tab_hover = {
              bg_color = "#23272e",
              fg_color = "#51afef",
              italic = true,
            },
            new_tab = {
              bg_color = "#21242a",
              fg_color = "#bbc2cf",
            },
            new_tab_hover = {
              bg_color = "#23272e",
              fg_color = "#51afef",
              italic = true,
            },
          },
        }
      }
    '';
  };

  # (Optional) If you want Nix to also manage fonts for WezTerm:
  # fonts.fontconfig.enable = true;
  # home.packages = with pkgs; [
  #   (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  #   noto-fonts-emoji
  #   # Monaspace may be packaged as `monaspace`; if not, you can install it manually.
  # ];
}
