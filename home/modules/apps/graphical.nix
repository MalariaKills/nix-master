{ pkgs, ... }:

{
  # GUI / desktop apps for *Graphical Linux Environments only*.
  # Import this only on hosts that actually run Plasma/COSMIC.
  environment.systemPackages = with pkgs; [
    # --- Common apps ---
    joplin-desktop
    steam
    rustdesk
    nicotine-plus
    discord

    # --- Common GUI utilities ---
    firefox
    vlc
    gimp

    # --- KDE basics on Plasma ---
    dolphin        # file manager
    konsole        # terminal
    spectacle      # screenshots
    kate           # GUI text editor
  ];
}
