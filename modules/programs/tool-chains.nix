{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    cc-tool
    gcc
  ];
}
