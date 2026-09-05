#========  BLEACHBIT
{ ... }:
{
  flake.nixosModules.bleachbit =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.bleachbit ];
    };
}
