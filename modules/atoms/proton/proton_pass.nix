#========  PROTON PASS
{ ... }:
{
  flake.nixosModules.proton_pass =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.proton-pass ];
    };
}
