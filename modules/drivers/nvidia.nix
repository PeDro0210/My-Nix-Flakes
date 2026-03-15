{ config, ... }:
{
  hardware = {
    graphics = {
      enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    open = true;

    powerManagement.enable = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # For weird bug for hyprland freezing
  boot.kernelParams = [
    "initcall_blacklist=simpledrm_platform_driver_init"
    "pcie_aspm=off"
  ];

}
