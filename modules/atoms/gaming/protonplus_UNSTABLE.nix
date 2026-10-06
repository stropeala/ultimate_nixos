#========  PROTON PLUS
#========  UNSTABLE
{ ... }:
{
  flake.nixosModules.protonplus_UNSTABLE =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.unstable.protonplus ];
    };
}
