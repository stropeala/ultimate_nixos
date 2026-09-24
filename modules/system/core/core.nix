#========  CORE (set and forget, imported on every host)
{ self, ... }:
{
  flake.nixosModules.core =
    { config, pkgs, ... }:
    {
      imports = with self.nixosModules; [
        # audio
        audio

        # boot
        bootloader

        # shell
        fish

        # graphics
        graphics

        # home manager
        home_manager

        # locale
        locale

        # per host options and settings
        my_options

        # nixos
        nixos_settings

        # printing
        printing

        # tweaks
        system_tweaks
        storage_tweaks

        # users
        users

        # networking
        bluetooth
        network
        ssh
      ];

      environment.systemPackages = with pkgs; [
        # file system support
        # ntfs
        ntfs3g
        # exfat
        exfatprogs
        # sudo filefrag ~/dir_name/file_name.file_extention
        e2fsprogs

        # compression utilities
        zstd
        p7zip
        gnutar
        xz

        # system utilities
        fastfetch
        btop
        v4l-utils
        p7zip
        binutils
      ];

      hardware.enableRedistributableFirmware = true;
      system.stateVersion = config.my.state_version;
    };
}
