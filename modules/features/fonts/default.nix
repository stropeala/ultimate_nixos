{ ... }: {
  #========  FONTS
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      jetbrains-mono
      corefonts
      papirus-icon-theme # Plasma icon theme
    ];
  };
}
