{ pkgs, ... }:
{

  #TODO: refactor this for later, but this is a good start
  environment.systemPackages = with pkgs; [
    wget
    libgcc
    gcc
    wezterm
    zoxide
    deno
    starship
    fzf
    btop
    yazi
    mktemp
    cliphist

    fastfetch
    pipes # The most important one

    iredis
    meson
    ninja
    gdb
    vlc
    cmake

    #fish related

    fishPlugins.fzf-fish
    grc
    fd

    ueberzugpp

    bat # prettier Cat alternative
    eza # Ls but cooler
    xh # Httpie but better
    fselect # fzf but better

    presenterm

    imagemagick
    caligula

    unzip

    unrar # for the fucking kid that uses winrar in 2025

    dxvk
  ];

  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.starship.enable = true;

  programs.npm.enable = true;

  #General configs
  programs.zoxide.enableFishIntegration = true;

}
