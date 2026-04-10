{ pkgs, lib, ... }:
{

  environment.systemPackages = with pkgs; [
    aerospace
    jankyborders
  ];

  launchd.user.agents.aerospace = {
    command = ''
      aerospace --config-path ~/.config/aerospace/aerospace.toml
    '';
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
    };

  };
  services.skhd.enable = true;
  services.sketchybar.enable = true;

}
