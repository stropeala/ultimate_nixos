#========  EXFAT
{ ... }:
{
  flake.nixosModules.exfat =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        exfatprogs
      ];

      boot.supportedFilesystems = [ "exfat" ];
    };
}
