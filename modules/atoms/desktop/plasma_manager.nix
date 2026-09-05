#========  PLASMA MANAGER
{ self, inputs, ... }:
let
  # theme names
  flavor = "Mocha";
  accent = "Blue";
  aurorae_style = "Classic"; # or "Modern"

  flavor_lower = "mocha";
  accent_lower = "blue";

  color_scheme_name = "Catppuccin${flavor}${accent}";
  aurorae_theme_name = "Catppuccin${flavor}-${aurorae_style}";

  cursor_theme_name = "catppuccin-${flavor_lower}-${accent_lower}-cursors";
  cursor_size = 24;

  look_and_feel = "org.kde.breeze.desktop";

  wallpaper = ../../../data/wallpapers/skyrim-night-wallpapers.png;
  avatar = ../../../data/avatar/yukikica.jpg;
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
    { pkgs, ... }:
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
        flavor = flavor_lower;
        accent = accent_lower;
        kvantum.enable = false;
        cursors.enable = true;
        gtk.icon.enable = true;
      };

      gtk = {
        enable = true;
        theme = {
          name = "Catppuccin-${flavor}-Standard-${accent}-Dark";
          package = pkgs.catppuccin-gtk.override {
            accents = [ accent_lower ];
            size = "standard";
            variant = flavor_lower;
          };
        };
      };

      qt = {
        enable = true;
        platformTheme.name = "kde";
      };

      home.file."Pictures/Wallpapers/skyrim-night-wallpapers.png".source = wallpaper;
      home.file."Pictures/Avatars/yukikica.jpg".source = avatar;

      xdg.dataFile."color-schemes/${color_scheme_name}.colors".source =
        "${catppuccin_kde}/generated/color-schemes/${color_scheme_name}.colors";

      xdg.dataFile."aurorae/themes/${aurorae_theme_name}".source =
        "${catppuccin_kde}/Resources/Aurorae/${aurorae_theme_name}";

      #========  PLASMA
      programs.plasma = {
        enable = true;

        # spectacle shortcut
        spectacle.shortcuts.captureRectangularRegion = "Ctrl+Alt+Q";
        # disable konsole shortcut
        shortcuts."services/org.kde.konsole.desktop"._launch = [ ];
        # kitty shortcut
        hotkeys.commands.launch-kitty = {
          name = "Launch Kitty";
          key = "Ctrl+Alt+T";
          command = "kitty";
        };

        overrideConfig = false;
        immutableByDefault = true;

        resetFiles = [ "kscreenlockerrc" ];

        # appearance
        workspace = {
          # plasma style
          theme = "breeze";

          # colors
          colorScheme = color_scheme_name;

          # icons
          iconTheme = "Papirus-Dark"; # catppuccin
          # iconTheme = "breeze-dark"; # kde default

          # application style
          widgetStyle = "Breeze";

          # cursor
          cursor = {
            theme = cursor_theme_name;
            size = cursor_size;
          };

          # window decorations
          windowDecorations = {
            # catppuccin
            # library = "org.kde.kwin.aurorae.v2"
            # theme = "__aurorae__svg__${aurorae_theme_name}"

            # default
            library = "org.kde.breeze";
            theme = "Breeze";
          };

          # splash screen
          splashScreen.theme = "org.kde.breeze.desktop";

          # system sounds
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

        # lock screen
        kscreenlocker = {
          autoLock = true;
          timeout = 60;
          lockOnResume = true;
          passwordRequired = true;
          passwordRequiredDelay = 5;
          appearance = {
            alwaysShowClock = true;
            wallpaper = wallpaper;
          };
        };

        # window decoration buttons
        kwin.titlebarButtons = {
          left = [ ];
          right = [
            "minimize"
            "maximize"
            "close"
          ];
        };

        configFile = {
          kdeglobals.General = {
            accentColorFromWallpaper = false;
            TerminalApplication = "kitty";
          };

          kdeglobals.KDE.LookAndFeelPackage = look_and_feel;
          kscreenlockerrc.Greeter.Theme = look_and_feel;

          kwinrc.Plugins = {
            blurEnabled = true;
            contrastEnabled = true;
          };

          kwinrc.TabBox.LayoutName = "org.kde.breeze";
        };
      };
    };
}
