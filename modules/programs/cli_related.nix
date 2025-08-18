{ pkgs, ... }:
{

  #TODO: refactor this for later, but this is a good start
  environment.systemPackages = with pkgs; [
    wget
    libgcc
    gcc
    wezterm
    zoxide
    lsd
    deno
    starship
    fzf
    btop
    yazi
    mktemp
    cliphist

    mpd
    spotifyd
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

    hwinfo
  ];

  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.fish.enable = true;
  programs.starship.enable = true;

  programs.npm.enable = true;

  #General configs
  programs.zoxide.enableFishIntegration = true;

}
