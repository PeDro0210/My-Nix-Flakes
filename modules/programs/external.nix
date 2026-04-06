{
  pkgs,
  hytale-launcher,
  inputs,
  system,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    firefox-bin
    vesktop
    openrgb-with-all-plugins
    nwg-look
    protonup-ng # Steam in proton
    font-manager
    gnome-tweaks
    libreoffice
    blender

    #games

    prismlauncher # like dude, I need my minecraft launcher
    protonup-qt
    lutris-free

    wine

    quick-webapps

    pegasus-frontend
    hytale-launcher.packages."${system}".default
    retroarch

  ];

  # Obs
  programs.obs-studio = {
    enable = true;

    # optional Nvidia hardware acceleration
    package = (
      pkgs.obs-studio.override {
        cudaSupport = true;
      }
    );
    enableVirtualCamera = true;

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-backgroundremoval
      obs-pipewire-audio-capture
      obs-vaapi # optional AMD hardware acceleration
      obs-gstreamer
      obs-vkcapture
    ];
  };

  #Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.gamemode.enable = true;

  #Openrgb
  services.hardware.openrgb.enable = true;
  services.udev.extraRules = (builtins.readFile "${pkgs.openrgb}/lib/udev/rules.d/60-openrgb.rules");

}
