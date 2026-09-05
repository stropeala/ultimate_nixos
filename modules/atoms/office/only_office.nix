#========  ONLY OFFICE
{ ... }:
{
  flake.nixosModules.only_office =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.onlyoffice-desktopeditors ];
    };
}
