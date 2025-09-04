{ pkgs, ... }:
{

  fonts.packages = with pkgs; [
    pixel-code
    fira-code-symbols
  ];

}
