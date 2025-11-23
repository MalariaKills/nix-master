{ config, pkgs, ... }:

{
  # Optional: enable fastfetch via HM (if available in your HM version)
  programs.fastfetch.enable = true;

  # Write your JSON config to ~/.config/fastfetch/config.json
  xdg.configFile."fastfetch/config.json".text = ''
{
  "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
  "logo": {
    "padding": { "left": 4 }
  },
  "modules": [
    {
      "type": "os",
      "key": "{icon} distro",
      "format": "{name}",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "kernel",
      "key": " kernel",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "uptime",
      "key": "󰅐 uptime",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "de",
      "key": "󰇄 desktop",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "terminal",
      "key": " term",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "shell",
      "key": " shell",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "cpu",
      "key": "󰍛 cpu",
      "showPeCoreCount": true,
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "disk",
      "key": "󰉉 disk",
      "folders": "/",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "memory",
      "key": " memory",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "localip",
      "key": "󰩟 network",
      "format": "{ipv4} ({ifname})",
      "outputColor": "38;2;236;228;216"
    },
    {
      "type": "colors",
      "key": " colors",
      "symbol": "circle"
    }
  ],
  "logoColor-1": "38;2;215;135;95"
}
  '';
}
