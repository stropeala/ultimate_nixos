#========  LAPSTROP (ASUS laptop AMD APU)
{ self, inputs, ... }:
{
  flake.nixosConfigurations.lapstrop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      #========  ADDITIONS
      # face unlock
      howdy

      # on trial
      # ...

      #========  BUNDLES
      default_apps
      desktop_setup
      dev_setup
      gaming_setup

      #========  SYSTEM
      core

      #========  DRIVERS
      amd_drivers
      asusd_and_powerdevil

      #========  HOST SPECIFIC
      ./_lapstrop_hardware.nix
      lapstrop_configuration
    ];
  };
}
