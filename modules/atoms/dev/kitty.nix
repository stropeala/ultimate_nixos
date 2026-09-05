#========  KITTY
{ self, ... }:
{
  flake.nixosModules.kitty =
    { config, ... }:
    {
      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.kitty ];
    };

  flake.homeModules.kitty =
    { ... }:
    {
      programs.kitty = {
        enable = true;
        shellIntegration.enableFishIntegration = true;

        font = {
          name = "JetBrainsMono Nerd Font";
          size = 12.0;
        };

        settings = {
          shell = "/run/current-system/sw/bin/fish";

          touch_scroll_multiplier = 2.69;

          background_opacity = "0.92";
          window_padding_width = 10;
          confirm_os_window_close = 0;

          enable_audio_bell = false;

          cursor_shape = "beam";
          cursor_trail = 1;
          cursor_trail_start_threshold = 1;
          cursor_trail_color = "#cba6f7";
          cursor_blink_interval = 0;

          tab_bar_style = "powerline";
          tab_powerline_style = "slanted";

          # Catppuccin Mocha
          foreground = "#CDD6F4";
          background = "#1E1E2E";
          selection_foreground = "#1E1E2E";
          selection_background = "#F5E0DC";

          color0 = "#45475A";
          color1 = "#F38BA8";
          color2 = "#A6E3A1";
          color3 = "#F9E2AF";
          color4 = "#89B4FA";
          color5 = "#F5C2E7";
          color6 = "#94E2D5";
          color7 = "#BAC2DE";

          color8 = "#585B70";
          color9 = "#F38BA8";
          color10 = "#A6E3A1";
          color11 = "#F9E2AF";
          color12 = "#89B4FA";
          color13 = "#F5C2E7";
          color14 = "#94E2D5";
          color15 = "#A6ADC8";
        };
      };
    };
}
