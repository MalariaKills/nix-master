{ pkgs, ... }:

{
  # Packages that should exist on *every* machine:
  # - NixOS desktop
  # - NixOS laptop
  # - NixOS VM
  # - WSL
  # - (later) macOS via nix-darwin
  environment.systemPackages = with pkgs; [
    # --- Core CLI tools ---
    git
    curl
    wget
    htop
    tmux
    unzip
    zip
    tree

    # --- Modern replacements / QoL ---
    ripgrep          # fast grep
    fd               # better find
    eza              # better ls
    zoxide           # smarter cd
    fzf              # fuzzy finder
    bat              # cat with syntax highlighting

    # --- JSON / YAML tools ---
    jq
    yq

    # --- Editors (safe everywhere) ---
    neovim

    # --- Nix tooling (for your flake/HM workflow) ---
    nil                  # Nix LSP (works with VS Code)
    alejandra            # Nix formatter
    nixd                 # alternative Nix LSP
    nix-tree             # visualize closure deps
    nix-output-monitor   # nicer nix build UX
    nix-index            # "what package provides this file?"

    # --- Languages / dev toolchains you actually use ---
    python3
    go
    cargo
    rustc
  ];
}
