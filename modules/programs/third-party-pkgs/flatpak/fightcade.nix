{ pkgs, ... }:

let
  # script for setting up the patch for the auto download roms

  auto_rom_script = pkgs.writeScriptBin "auto_rom_script" ''
    curl "https://fightcade.download/fc2json.zip" --output "/home/$USER/.var/app/com.fightcade.Fightcade/data/fc2json.zip"
    z "/home/$USER/.var/app/com.fightcade.Fightcade/data"
    unzip "/home/$USER/.var/app/com.fightcade.Fightcade/data/fc2json.zip"  
  '';
in
{

  services.flatpak.update.auto.enable = true;

  # Configure nix-flatpak
  services.flatpak = {
    enable = true;
    packages = [
      "com.fightcade.Fightcade"
    ];
  };

  environment.systemPackages = [ auto_rom_script ];
}
