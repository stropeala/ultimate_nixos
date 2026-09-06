#========  PRINTING
{ ... }:
{
  flake.nixosModules.printing =
    { pkgs, ... }:
    {
      services.printing = {
        enable = true;
        drivers = with pkgs; [
          gutenprint
          hplip
          splix
          brlaser
        ];
      };

      services.avahi = {
        enable = false; # change to true if needed for compatible printer
        nssmdns4 = true;
        openFirewall = true;
      };

      services.ipp-usb.enable = false; # change to true if needed for compatible printer
    };
}
