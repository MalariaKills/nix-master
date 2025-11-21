{ pkgs, ... }:

{
  # GUI / desktop apps for *Graphical Linux Environments only*.
  # Import this only on hosts that actually run Plasma/COSMIC.
  environment.systemPackages = with pkgs; [
    # --- Common apps ---
    joplin-desktop
    steam
    #rustdesk too heavy for vm
    nicotine-plus
    discord

    # --- Common GUI utilities ---
    firefox
    vlc
    gimp

    # --- KDE basics on Plasma ---
    kdePackages.dolphin        # file manager
    kdePackages.konsole        # terminal
    kdePackages.spectacle      # screenshots
    kdePackages.kate           # GUI text editor
  ];
}
