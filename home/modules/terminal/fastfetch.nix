{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    # This turns into ~/.config/fastfetch/config.jsonc automatically
    settings = {
      logo = {
        padding = {
          left = 4;
        };
      };

      modules = [
        {
          type = "os";
          key = "{icon} distro";
          format = "{name}";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "kernel";
          key = " kernel";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "uptime";
          key = "󰅐 uptime";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "de";
          key = "󰇄 desktop";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "terminal";
          key = " term";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "shell";
          key = " shell";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "cpu";
          key = "󰍛 cpu";
          showPeCoreCount = true;
          outputColor = "38;2;236;228;216";
        }
        {
          type = "disk";
          key = "󰉉 disk";
          folders = "/";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "memory";
          key = " memory";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "localip";
          key = "󰩟 network";
          format = "{ipv4} ({ifname})";
          outputColor = "38;2;236;228;216";
        }
        {
          type = "colors";
          key = " colors";
          symbol = "circle";
        }
      ];

      # Hyphen needs quoting in Nix
      "logoColor-1" = "38;2;215;135;95";
    };
  };
}
