{ pkgs, ... }@inputs:

{
  nix.settings.experimental-features = "nix-command flakes";

  #TODO: refactor this
  imports = [
    ./drivers/nvidia.nix
    ./drivers/bluetooth.nix
    ./drivers/printing.nix
    ./drivers/keyboard.nix

    ./programs/cli_related.nix
    ./programs/hyprland_related.nix
    ./programs/pipewire_related.nix
    ./programs/external.nix
    ./programs/unstable.nix
    ./programs/theme_related.nix
    ./programs/lsps.nix
    ./programs/third-party-pkgs/flatpak/fightcade.nix
    ./programs/third-party-pkgs/flatpak/general.nix
    ./programs/xdg.nix
    ./programs/spicetify.nix

    ./alias/fish_aliases.nix
    ./alias/extra_groups.nix

    ./utils/containers.nix
    ./utils/gc.nix
    ./utils/fonts.nix
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

  system.stateVersion = "25.11";

  # for fking fightcade nixpkg
  programs.nix-ld.enable = true;

  #TODO: remove them when is not needed for pkg building

  # is decrepete, but still I need it
  nixpkgs.config.permittedInsecurePackages = [
    "mbedtls-2.28.10"
  ];

  # for mounting usbs
  services.gvfs.enable = true;
  services.udisks2.enable = true;
}
