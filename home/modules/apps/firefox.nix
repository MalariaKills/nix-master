{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      extensions = with pkgs.firefox-addons; [
        bitwarden
        ublock-origin
      ];

      settings = {
        # Optional: some privacy-focused settings
        "browser.startup.homepage" = "about:home";
        "privacy.donottrackheader.enabled" = true;
      };
    };
  };
}
