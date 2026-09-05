#========  LOCALSEND
{ ... }:
{
  flake.nixosModules.localsend =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.localsend ];
    };
}
