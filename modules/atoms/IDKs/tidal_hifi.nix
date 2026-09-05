#========  TIDAL HIFI
{ ... }:
{
  flake.nixosModules.tidal_hifi =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.tidal-hifi ];
    };
}
