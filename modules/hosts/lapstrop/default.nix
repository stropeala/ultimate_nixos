{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.lapstrop = inputs.nixpkgs.lib.nixosSystem {
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
      howdy
      asusControl
      ntsync
      powerMonitor
      lapstropConfiguration

      # Host platform
      { nixpkgs.hostPlatform = "x86_64-linux"; }

      # Home-manager
      ({ ... }: {
        home-manager.users.lapstrop = {
          home.stateVersion = "26.05";
          imports = with self.homeModules; [ plasmaManager ];
        };
      })
    ];
  };
}
