#========  LAPSTROP (ASUS laptop AMD APU)
{ self, inputs, ... }:
{
  flake.nixosConfigurations.lapstrop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      #========  ADDITIONS
      # face unlock
      howdy

      # needed just for tidal
      flatpak

      # cool factor 3D Fetch
      areofyl_fetch

      # on trial
      kde_connect
      localsend
      direnv

      #========  BUNDLES
      default_apps
      desktop_setup
      dev_setup
      gaming_setup

      #========  SYSTEM
      core

      #========  DRIVERS
      amd_drivers
      asus_control
      power_auto_profile

      #========  HOST SPECIFIC
      ./_lapstrop_hardware.nix
      lapstrop_configuration
    ];
  };
}
