#========  PRINTING
{ ... }:
{
  flake.nixosModules.printing =
    { ... }:
    {
      services.printing.enable = true;
      services.avahi = {
        enable = false; # change to true if needed for compatible printer
        nssmdns4 = true;
        openFirewall = true;
      };
      services.ipp-usb.enable = false; # change to true if needed for compatible printer
    };
}
