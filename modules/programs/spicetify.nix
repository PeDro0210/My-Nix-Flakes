{ pkgs, ... }@inputs:

{
  programs.spicetify =

    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
      ];
      theme = spicePkgs.themes.text;
      colorScheme = "RosePineMoon";

    };
}
