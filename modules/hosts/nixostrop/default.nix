{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.nixostrop = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      # Here we select which modules we want to install on this host
      # Attributes bundles
      defApps
      development
      gaming

      # Defaults
      desktop
      areofylFetch

      # Diffs
      nvidiaDrivers
      maxPerformance
      nixostropConfiguration

      # Host platform
      { nixpkgs.hostPlatform = "x86_64-linux"; }

      # Home-manager
      ({ ... }: {
        home-manager.users.nixostrop = {
          home.stateVersion = "26.05";
          imports = with self.homeManagerModules; [ plasmaManager ];
        };
      })
    ];
  };
}
