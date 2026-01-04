{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    # Install the portal.
    extraPortals = [
      pkgs.xdg-desktop-portal-termfilechooser
    ];
    # Override the default filechooser portal.
    config = {
      hyprland = {
        default = [
          "hyprland"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [ "xdg-desktop-portal-termfilechooser" ];
      };
    };
  };
  # Set it up.
  environment.etc."xdg/xdg-desktop-portal-termfilechooser/config".text = ''
    [filechooser]
    cmd=/usr/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
  '';
}
