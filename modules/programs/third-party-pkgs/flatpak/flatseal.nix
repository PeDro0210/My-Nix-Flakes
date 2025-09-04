{ pkgs, ... }:

{

  services.flatpak.update.auto.enable = true;

  # Configure nix-flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
    ];
  };

}
