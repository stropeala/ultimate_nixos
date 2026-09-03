{ ... }: {
  #========  SDDM
  flake.nixosModules.sddm = { pkgs, ... }: {
    services.displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
    };

    # Theme & wallpaper
    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
        loginBackground = true;
        background = ../wallpaper/skyrim-night-wallpapers.png;
      })
    ];
  };
}
