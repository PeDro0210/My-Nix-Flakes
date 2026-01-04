{pkgs,...}:{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
      gutenprint
      cups-bjnp
      cups
    ];
  };


  environment.systemPackages = with pkgs; [
    system-config-printer
  ];


}
