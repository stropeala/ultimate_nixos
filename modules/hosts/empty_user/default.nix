#========  EXAMPLE USER
{ self, inputs, ... }:
{
  flake.nixosConfigurations.empty_user = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      #========  ADDITIONS
      # cool factor 3D Fetch
      areofyl_fetch

      #========  BUNDLES
      default_apps
      desktop_setup
      dev_setup
      gaming_setup

      #========  SYSTEM
      core

      #========  DRIVERS
      amd_drivers
      intel_drivers
      nvidia_drivers

      #========  HOST SPECIFIC
      ./_empty_user_hardware.nix
      empty_user_configuration
    ];
  };
}
