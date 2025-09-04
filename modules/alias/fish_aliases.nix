{ pkgs, ... }:

# this nix file is just made for large cli commands
let

  rebuildNixOs = pkgs.writeScriptBin "rebuild-nixos" ''
    cd /home/$(whoami)/Nix-Config
    git add .
    sudo nixos-rebuild switch --flake .#pedropc --impure --upgrade
    cd - 
  '';

  nixOsConfig = pkgs.writeScriptBin "nixos-config" ''
    cd /home/$(whoami)/Nix-Config
    nvim
  '';
in
{

  environment.systemPackages = [
    rebuildNixOs
    nixOsConfig
  ];

}
