{ ... }:
{
  security.rtkit.enable = true;

  # the pipewire part

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # For removing the ags on any microphone
    extraConfig.pipewire."context.modules" = [
      {
        name = "libpipewire-module-echo-cancel";
        args = {
          aec_method = "webrtc";
          aec_args = "analog_gain_control=0";
        };
      }
    ];
  };

}
