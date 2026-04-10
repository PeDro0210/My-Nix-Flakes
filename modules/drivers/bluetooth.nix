{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        AutoEnable = true;
        ControllerMode = "bredr";
        UserspaceHID = true;
      };
    };
    powerOnBoot = true;
  };

  services.blueman.enable = true;

}
