#========  ASUS NOTEBOOK CONTROL
{ ... }:
{
  flake.nixosModules.asus_control =
    { pkgs, ... }:
    {
      services.asusd.enable = true;
      systemd.tmpfiles.rules = [ "d /etc/asusd 0755 root root -" ];
      environment.systemPackages = [ pkgs.asusctl ];
    };
}
