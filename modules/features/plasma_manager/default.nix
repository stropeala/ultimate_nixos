{ inputs, ... }: {
  #========  PLASMA MANAGER
  flake.homeManagerModules.plasmaManager = { pkgs, ... }: {
    imports = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

    programs.plasma = {
      enable = true;
      overrideConfig = true;

      workspace = {
        colorScheme = "CatppuccinMochaBlue";
        theme = "breeze-dark";
        iconTheme = "Papirus-Dark";
        wallpaper = ../wallpaper/skyrim-night-wallpapers.png;
      };
    };

    xdg.dataFile."color-schemes/CatppuccinMochaBlue.colors".source = ./CatppuccinMochaBlue.colors;
  };
}
