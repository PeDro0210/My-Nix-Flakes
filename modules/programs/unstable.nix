{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs-unstable.wiremix
    pkgs-unstable.ncspot
  ];

}
