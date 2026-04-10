{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    wezterm
    neovim
    tree-sitter
    zoxide
    starship
    fzf
    yazi
    fish
    eza
    btop
    fastfetch
    wget

    wallust
  ];

  programs.fish.enable = true;
  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
  };

}
