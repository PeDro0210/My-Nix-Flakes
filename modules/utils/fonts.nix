{ pkgs, ... }:
{

  fonts.packages = with pkgs; [
    pixel-code
    sketchybar-app-font
    nerd-font-patcher
  ];

}
