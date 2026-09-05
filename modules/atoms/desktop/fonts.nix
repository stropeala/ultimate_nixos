#========  FONTS
{ ... }:
{
  flake.nixosModules.fonts =
    { pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        # fonts
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        noto-fonts
        corefonts

        # icons
        papirus-icon-theme
      ];
    };
}
