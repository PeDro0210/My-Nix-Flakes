{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kanagawa-gtk-theme
    rose-pine-icon-theme
  ];

  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = "kvantum";
  };

}
