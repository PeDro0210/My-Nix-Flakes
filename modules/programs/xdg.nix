{ pkgs, ... }:

{
  # The one and only xdg-portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
