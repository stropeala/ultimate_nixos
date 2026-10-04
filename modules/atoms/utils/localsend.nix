#========  LOCALSEND
{ ... }:
{
  flake.nixosModules.localsend =
    { ... }:
    {
      programs.localsend = {
        enable = true;
        openFirewall = true; # TCP & UDP 53317
      };
    };
}
