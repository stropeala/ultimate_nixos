#========  WINE
{ ... }:
{
  flake.nixosModules.wine =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        wine
        wine64
        winetricks
        wineWow64Packages.stable
        freetype
      ];
    };
}
