#========  PROTON PLUS
{ ... }:
{
  flake.nixosModules.protonplus =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.protonplus ];
    };
}
