{ pkgs, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";

  imports = [
    ./drivers/nvidia.nix
    ./drivers/bluetooth.nix
    ./programs/cli_related.nix
    ./programs/hyprland_related.nix
    ./programs/pipewire_related.nix
    ./utils/fonts.nix
    ./programs/external.nix
    ./programs/unstable.nix
    ./programs/theme_related.nix
    ./programs/lsps.nix
    ./drivers/keyboard.nix
  ];

  #TODO: change the boot loader config to another place
  # bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Guatemala";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_GT.UTF-8";
    LC_IDENTIFICATION = "es_GT.UTF-8";
    LC_MEASUREMENT = "es_GT.UTF-8";
    LC_MONETARY = "es_GT.UTF-8";
    LC_NAME = "es_GT.UTF-8";
    LC_NUMERIC = "es_GT.UTF-8";
    LC_PAPER = "es_GT.UTF-8";
    LC_TELEPHONE = "es_GT.UTF-8";
    LC_TIME = "es_GT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # This is my user config, use your own username
  users.users.pedro0210 = {
    isNormalUser = true;
    description = "PeDro0210";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  # For removing weird printing app on the destkop dir, but not from the system
  environment.extraSetup = ''
    rm $out/share/applications/cups.desktop
  '';

  system.stateVersion = "25.11";

}
