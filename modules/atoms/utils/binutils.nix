#========  BINUTILS
{ ... }:
{
  flake.nixosModules.binutils =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.binutils ];
    };
}
