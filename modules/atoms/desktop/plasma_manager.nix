#========  PLASMA MANAGER
{ self, inputs, ... }:
let
  # theme names
  flavor = "Mocha";
  accent = "Blue";
  aurorae_style = "Modern"; # or "Classic"

  color_scheme_name = "Catppuccin${flavor}${accent}";
  aurorae_theme_name = "Catppuccin${flavor}-${aurorae_style}";
  cursor_theme_name = "Catppuccin-${flavor}-${accent}-Cursors";
  cursor_size = 24;

  wallpaper = ../../../data/wallpapers/skyrim-night-wallpapers.png;
in
{
  #========  NIXOS module
  flake.nixosModules.plasma_manager =
    { config, pkgs, ... }:
    {
      services.desktopManager.plasma6.enable = true;

      environment.systemPackages = [ pkgs.kdePackages.kate ];

      environment.sessionVariables = {
        XCURSOR_THEME = cursor_theme_name;
        XCURSOR_SIZE = toString cursor_size;
        NIXOS_OZONE_WL = "1";
      };

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.plasma_desktop ];
    };

  #========  HOME-MANAGER module
  flake.homeModules.plasma_desktop =
    { pkgs, lib, ... }:
    let
      catppuccin_kde = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "kde";
        rev = "6606b5179cfc1e9ba5c3b6b70e15c468e2dddca2";
        hash = "sha256-Yj+Nj8N4YgHkmPN4TXAinajpVuU0rEbk1Jl1UU7w6bU=";
      };
    in
    {
      imports = [
        inputs.plasma-manager.homeModules.plasma-manager
        inputs.catppuccin.homeModules.catppuccin
      ];

      catppuccin = {
        enable = true;
        autoEnable = false;
        flavor = lib.toLower flavor;
        accent = lib.toLower accent;
        kvantum.enable = true;
      };

      gtk = {
        enable = true;
        theme = {
          name = "Catppuccin-${flavor}-Standard-${accent}-Dark";
          package = pkgs.catppuccin-gtk.override {
            accents = [ (lib.toLower accent) ];
            size = "standard";
            variant = lib.toLower flavor;
          };
        };
      };

      home.packages = [
        pkgs.kdePackages.qtstyleplugin-kvantum

        (pkgs.catppuccin-papirus-folders.override {
          flavor = lib.toLower flavor;
          accent = lib.toLower accent;
        })

        pkgs.catppuccin-cursors.mochaBlue
      ];

      xdg.dataFile."color-schemes/${color_scheme_name}.colors".source =
        "${catppuccin_kde}/generated/color-schemes/${color_scheme_name}.colors";

      xdg.dataFile."aurorae/themes/${aurorae_theme_name}".source =
        "${catppuccin_kde}/Resources/Aurorae/${aurorae_theme_name}";

      #========  PLASMA
      programs.plasma = {
        enable = true;

        overrideConfig = false;
        immutableByDefault = true;

        # appearance
        workspace = {
          theme = "breeze-dark";
          colorScheme = color_scheme_name;
          iconTheme = "Papirus-Dark";

          cursor = {
            theme = cursor_theme_name;
            size = cursor_size;
          };

          windowDecorations = {
            library = "org.kde.kwin.aurorae";
            theme = "__aurorae__svg__${aurorae_theme_name}";
          };

          widgetStyle = "kvantum";
          splashScreen.theme = "None";
          soundTheme = "freedesktop";

          inherit wallpaper;
        };

        # fonts
        fonts =
          let
            sans = size: {
              family = "Noto Sans";
              pointSize = size;
            };
          in
          {
            general = sans 10;
            small = sans 8;
            toolbar = sans 10;
            menu = sans 10;
            windowTitle = sans 10;
            fixedWidth = {
              family = "JetBrains Mono";
              pointSize = 10;
            };
          };

        # lock screen wallpaper
        kscreenlocker.appearance.wallpaper = wallpaper;

        # window decoration buttons
        kwin.titlebarButtons = {
          left = [ ];
          right = [
            "minimize"
            "maximize"
            "close"
          ];
        };

        # blur & contrast
        configFile.kwinrc.Plugins = {
          blurEnabled = true;
          contrastEnabled = true;
        };
      };
    };
}
