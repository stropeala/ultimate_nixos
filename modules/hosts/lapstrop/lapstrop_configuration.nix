#========  LAPSTROP CONFIG
{ ... }:
{
  flake.nixosModules.lapstrop_configuration =
    { pkgs, ... }:
    {
      networking.hostName = "lapstrop";
      nixpkgs.hostPlatform = "x86_64-linux";

      my = {
        user.name = "lapstrop";
        zed.scroll_sensitivity = 2.69;
        mango_hud.fps_limit = 59;
        gaming.ntsync = true;
      };

      #========  KERNEL
      # ryzen laptop fits better with the latest kernel
      boot.kernelPackages = pkgs.linuxPackages_latest;

      #========  TOUCHPAD
      services.libinput.enable = true;

      #========  MOUNTS
      fileSystems."/mnt/WINDOWS169" = {
        device = "/dev/disk/by-uuid/641A67331A670182";
        fsType = "ntfs";
        options = [
          "defaults"
          "rw"
          "uid=1000"
          "gid=100"
        ];
      };

      fileSystems."/mnt/PROTONDRIVE30" = {
        device = "/dev/disk/by-uuid/26BA51A8BA517571";
        fsType = "ntfs";
        options = [
          "defaults"
          "rw"
          "uid=1000"
          "gid=100"
        ];
      };

      swapDevices = [
        {
          device = "/swapfile";
          size = 8 * 1024;
        }
      ];
    };
}
