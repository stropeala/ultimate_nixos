#========  NTSYNC
# this differs per host
# my.gaming.ntsync = bool
# in host config
{ ... }:
{
  flake.nixosModules.ntsync =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    lib.mkIf config.my.gaming.ntsync {
      boot.kernelModules = [ "ntsync" ];

      services.udev.packages = [
        (pkgs.writeTextFile {
          name = "ntsync-udev-rules";
          text = ''KERNEL=="ntsync", MODE="0660", TAG+="uaccess"'';
          destination = "/etc/udev/rules.d/70-ntsync.rules";
        })
      ];
    };
}
