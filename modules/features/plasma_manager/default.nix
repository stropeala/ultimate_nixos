{ inputs, ... }: {
  #========  PLASMA MANAGER
  flake.homeModules.plasmaManager = { pkgs, ... }: {
    imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

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
