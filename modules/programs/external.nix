{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    firefox
    vesktop
    openrgb-with-all-plugins
    spotify
    nwg-look
    protonup # Steam in proton
    font-manager
    gnome-tweaks
    libsForQt5.kdenlive
    libreoffice
    blender
    obs-studio

    stremio

    prismlauncher # like dude, I need my minecraft launcher
    protonup-qt

  ];

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
