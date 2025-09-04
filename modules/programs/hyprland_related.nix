{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kitty
    rofi-wayland
    swww # For background
    # for workspace to work as intended
    waybar
    pyprland
    xdg-desktop-portal-hyprland
    wl-clipboard
    hyprshot
    wlogout

    wlrctl
    wl-kbptr
    hyprlock
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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # For loging in to hyprland
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      default_session = {
        user = "pedro0210"; # this my user, change it to yours
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --theme border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=red --cmd Hyprland";
      };
    };
  };

  # For wl-kbptr

}
