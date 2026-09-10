#========  EXAMPLE USER CONFIG
{ ... }:
{
  flake.nixosModules.empty_user_configuration =
    { pkgs, ... }:
    {
      networking.hostName = "empty_user";
      nixpkgs.hostPlatform = "x86_64-linux";

      my = {
        user.name = "empty_user";

        git = {
          name = "git name";
          email = "git@email.com";
        };

        zed.scroll_sensitivity = 1.00;

        gaming = {
          ntsync = false;
          mango_hud.fps_limit = 59;
        };
      };

      #========  KERNEL
      boot.kernelPackages = pkgs.linuxPackages_latest;

      #========  MOUNTS
      fileSystems."/mnt/EXAMPLEdrive" = {
        device = "/dev/disk/by-uuid/***";
        fsType = "btrfs";
        options = [
          "defaults"
          "rw"
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
