#========  LEGCORD (DISCORD)
{ ... }:
{
  flake.nixosModules.legcord =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.legcord ];
    };
}
