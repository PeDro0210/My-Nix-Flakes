{ config, ... }:
{
  hardware = {
    graphics = {
      enable = true;
    };
  };

  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting"
  ];

  hardware.nvidia = {
    modesetting.enable = true;

    open = true;

    powerManagement.enable = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;

    # for multi-gpu setup
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:01:0:0";
      amdgpuBusId = "PCI:11:0:0";
    };
  };

  # For weird bug for hyprland freezing
  boot.kernelParams = [
    "initcall_blacklist=simpledrm_platform_driver_init"
    "pcie_aspm=off"
  ];

}
