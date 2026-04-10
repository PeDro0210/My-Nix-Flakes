{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    podman-compose
    podman
  ];

}
