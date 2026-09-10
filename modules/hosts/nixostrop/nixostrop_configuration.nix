#========  NIXOSTROP CONFIG
{ ... }:
{
  flake.nixosModules.nixostrop_configuration =
    { ... }:
    {
      networking.hostName = "nixostrop";
      nixpkgs.hostPlatform = "x86_64-linux";

      my = {
        user.name = "nixostrop";

        git = {
          name = "Petre Razvan";
          email = "petre.ispir2002@protonmail.com";
        };

        zed.scroll_sensitivity = 0.69;

        gaming = {
          ntsync = false;
          mango_hud.fps_limit = 143;
        };
      };

      #========  KERNEL
      # NVIDIA desktop fits better with the LTS kernel
      # boot.kernelPackages unset

      #========  TOUCHPAD
      # services.libinput.enable unset

      #========  MOUNTS
      fileSystems."/mnt/SSD340" = {
        device = "/dev/disk/by-uuid/64f737eb-9aac-41d6-b473-7e1b39e8af5a";
        fsType = "btrfs";
        options = [
          "defaults"
          "rw"
        ];
      };

      fileSystems."/mnt/HDD150" = {
        device = "/dev/disk/by-uuid/20823498823473FE";
        fsType = "ntfs";
        options = [
          "defaults"
          "rw"
          "uid=1000"
          "gid=100"
        ];
      };

      fileSystems."/mnt/WINDOWS100" = {
        device = "/dev/disk/by-uuid/6C0253160252E51C";
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
