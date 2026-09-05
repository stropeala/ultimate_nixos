#========  PER HOST OPTIONS
# the values that differ between machines
{ ... }:
{
  flake.nixosModules.my_options =
    { lib, config, ... }:
    {
      options.my = {
        user = {
          name = lib.mkOption {
            type = lib.types.str;
            description = "login name of the user on this host";
          };

          description = lib.mkOption {
            type = lib.types.str;
            default = config.my.user.name;
            defaultText = lib.literalExpression "config.my.user.name";
            description = "GECOS description for the account";
          };

          extra_groups = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [
              "networkmanager"
              "wheel"
              "video"
            ];
            description = "extra groups for the user";
          };

          home = lib.mkOption {
            type = lib.types.str;
            default = "/home/${config.my.user.name}";
            defaultText = lib.literalExpression ''"/home/''${config.my.user.name}"'';
            readOnly = true;
            description = "home directory of the user";
          };
        };

        state_version = lib.mkOption {
          type = lib.types.str;
          default = "26.05";
          description = "nixos & home-manager state version, do not modify";
        };

        zed.scroll_sensitivity = lib.mkOption {
          type = lib.types.float;
          default = 1.0;
          description = "zed scroll_sensitivity";
        };

        mango_hud.fps_limit = lib.mkOption {
          type = lib.types.int;
          default = 59;
          description = "mangoHud frame cap";
        };

        gaming.ntsync = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "ntsync kernel module, off by default";
        };
      };
    };
}
