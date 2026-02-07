{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    neovim # need it for the 12.01
    wiremix
    ncspot
  ];

}
