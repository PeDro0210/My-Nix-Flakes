# Ik is kinda contradictory but the sketchybar config I'm using rellies on it for some relies on it

# I'll change the sketchubar for being indenpendit of it
{ pkgs, config, ... }:
{

  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [
    ];

    casks = [
      "mouseless"
      "obs"
      "steam"
    ];
    brews = [
      #"r"
    ];

  };
}
