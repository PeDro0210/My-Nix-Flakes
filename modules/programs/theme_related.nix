{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kanagawa-gtk-theme
  ];

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

}
