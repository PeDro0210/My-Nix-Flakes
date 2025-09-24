{ pkgs, ... }:
{
  virtualisation.podman.enable = true;

  environment.systemPackages = with pkgs; [
    podman-compose
  ];

  users.users."pedro0210".extraGroups = [ "podman" ];
}
