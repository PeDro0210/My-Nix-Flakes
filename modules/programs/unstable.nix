{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    wiremix
    ncspot
  ];

}
