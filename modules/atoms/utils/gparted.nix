#========  GPARTED
{ ... }:
{
  flake.nixosModules.gparted =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.gparted ];
    };
}
