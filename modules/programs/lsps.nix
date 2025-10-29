{ pkgs, ... }:
{

  # Mostly lsp for tools I don't do independent projects and are sitting around in my system
  environment.systemPackages = with pkgs; [
    #Lsp
    nil
    nixd
    libsForQt5.qt5.qtdeclarative

    #Formaters
    nixpkgs-fmt
    nixfmt-rfc-style
    stylua

  ];

}
