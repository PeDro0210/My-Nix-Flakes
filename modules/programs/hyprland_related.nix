{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    kitty
    rofi
    swww # For background

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

  # The one and only xdg-portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
    ];
  };

  # For loging in to hyprland
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "pedro0210"; # this my user, change it to yours
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --theme border=gray;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red --cmd Hyprland";
      };
    };
  };

  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

}
