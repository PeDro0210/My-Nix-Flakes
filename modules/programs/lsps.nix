{ pkgs, ... }:
{

  # This lsp are for my general use dev tools, like clang, rustc, nix related and soo on

  #TODO: refactor this for later, but this is a good start
  environment.systemPackages = with pkgs; [
    # Runtime
    cargo
    rustc
    lld

    #Lsp
    rust-analyzer
    nil
    lua-language-server

    #Formaters
    nixpkgs-fmt
    nixfmt-rfc-style
    nil
    nixd
    stylua
    rustfmt

    #linter
    rustPackages.clippy

    #c/cpp
    clang-tools

  ];

}
