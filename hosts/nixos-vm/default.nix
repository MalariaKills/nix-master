{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/apps/core.nix
    ../../modules/apps/graphical.nix
  ];

  ###################################
  # Bootloader
  ###################################
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";

  ###################################
  # Locale
  ###################################
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  ###################################
  # KDE Plasma 6 + SDDM
  ###################################
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Include COSMIC as an option
  services.desktopManager.cosmic.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  ###################################
  # Printing
  ###################################
  services.printing.enable = true;

  ###################################
  # Pipewire + Audio
  ###################################
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ###################################
  # User
  ###################################
  users.users.testuser = {
    isNormalUser = true;
    description = "testuser";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  ###################################
  # Unfree
  ###################################
  nixpkgs.config.allowUnfree = true;

  ###################################
  # Flakes
  ###################################
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  ###################################
  # System-level: GNOME Keyring
  # (auto-unlock at login + VSCode/Copilot integration)
  ###################################
  services.gnome.gnome-keyring.enable = true;

  # unlock keyring on login
  security.pam.services.login.gnome-keyring.enable = true;
  security.pam.services.sddm.gnome-keyring.enable = true;

  ###################################
  # System-level: XDG Portals
  # Ensures things like VSCode login links, file pickers, etc.
  ###################################
  xdg.portal = {
    enable = true;

    # KDE Plasma portal
    extraPortals = [
      pkgs.xdg-desktop-portal-kde
      pkgs.xdg-desktop-portal-gtk  # fallback portal for apps
    ];

    config.common.default = "kde";
  };

  # just in case (not required, but helpful)
  environment.systemPackages = with pkgs; [
    xdg-utils
  ];

  ###################################
  # NixOS State Version
  ###################################
  system.stateVersion = "25.05";
}
