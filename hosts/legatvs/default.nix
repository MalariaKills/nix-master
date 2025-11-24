{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/apps/core.nix
    ../../modules/apps/graphical.nix
  ];

  ###################################
  # Bootloader (UEFI, typical laptop)
  ###################################
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "legatvs";

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
  # KDE Plasma 6 + SDDM (+ COSMIC)
  ###################################
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Optional extra desktop option
  services.desktopManager.cosmic.enable = true;

  # Enable KWallet for credential storage (for KDE apps)
  security.pam.services.sddm.enableKwallet = true;
  security.pam.services.login.enableKwallet = true;

  # Enable GNOME Keyring for apps that need org.freedesktop.secrets (VSCode, etc.)
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # Enable XDG Desktop Portal for proper app integration
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    config.common.default = "kde";
  };

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
  users.users.spablo = {
    isNormalUser = true;
    description = "spablo";
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
  # NixOS State Version
  ###################################
  system.stateVersion = "25.05";
}