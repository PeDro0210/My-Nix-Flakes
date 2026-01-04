{ pkgs, ... }:
{
  virtualisation.podman.enable = true;

  environment.systemPackages = with pkgs; [
    podman-compose
    docker-compose
    docker
  ];

  users.users."pedro0210".extraGroups = [ "podman" "docker" ];
}
