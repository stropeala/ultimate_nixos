#========  PROTON MAIL
{ ... }:
{
  flake.nixosModules.proton_mail =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.protonmail-desktop ];
    };
}
