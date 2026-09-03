{ inputs, ... }: {
  #========  FLATPAK
  flake.nixosModules.flatpak = { ... }: {
    imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

    services.flatpak = {
      enable = true;
      update.auto = {
        enable = true;
        onCalendar = "weekly";
      };
      packages = [
        #========  APPS
        # tidal-hifi
        {
          appId = "com.mastermindzh.tidal-hifi";
          origin = "flathub";
        }
      ];
    };
  };
}
