#========  NIXOSTROP desktop (INTEL and NVIDIA)
{ self, inputs, ... }:
{
  flake.nixosConfigurations.nixostrop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      #========  ADDITIONS
      # needed just for tidal
      flatpak

      # cool factor 3D Fetch
      areofyl_fetch

      # on trial
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
      intel_drivers
      nvidia_drivers
      power_max_performance

      #========  HOST SPECIFIC
      ./_nixostrop_hardware.nix
      nixostrop_configuration
    ];
  };
}
