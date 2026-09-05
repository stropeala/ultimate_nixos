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
        # windows file system support
        ntfs3g

        # tar utilities
        gnutar
        xz

        # compression utilities
        zstd

        # system utilities
        fastfetch
        btop
        v4l-utils
      ];

      hardware.enableRedistributableFirmware = true;
      system.stateVersion = config.my.state_version;
    };
}
