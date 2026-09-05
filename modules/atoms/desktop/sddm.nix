#========  SDDM
{ inputs, ... }:
{
  flake.nixosModules.sddm =
    { pkgs, ... }:
    {
      imports = [ inputs.catppuccin.nixosModules.catppuccin ];

      catppuccin = {
        enable = true;
        autoEnable = false;
        flavor = "mocha";
        accent = "blue";
        sddm = {
          enable = true;
          font = "Noto Sans";
          fontSize = "10";
          background = ../../../data/wallpapers/skyrim-night-wallpapers.png;
          loginBackground = true;
          userIcon = true;
          clockEnabled = true;
        };
      };

      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;

        settings = {
          General.Numlock = "none";
          Users = {
            RememberLastUser = true;
            RememberLastSession = true;
          };
          Theme.CursorTheme = "Catppuccin-Mocha-Blue-Cursors";
        };
      };

      environment.systemPackages = [ pkgs.catppuccin-cursors.mochaBlue ];
    };
}
