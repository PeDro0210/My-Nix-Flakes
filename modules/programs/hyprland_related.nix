{
  pkgs,
  inputs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    kitty
    rofi

    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww # swww codeberg fork
    inputs.waymac_launcher.packages.${pkgs.stdenv.hostPlatform.system}.default

    # for workspace to work as intended
    waybar
    pyprland
    xdg-desktop-portal-hyprland
    wl-clipboard
    hyprshot

    wlrctl
    wl-kbptr

    quickshell

    wallust

  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;

  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1;";
  };

  # For loging in to hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "pedro0210"; # this my user, change it to yours
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd start-hyprland;";
      };
    };
  };

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

}
