#========  ZED EDITOR
#========  UNSTABLE
# scroll sensitivity differs per host
# my.zed.scroll_sensitivity = float
# in host config
{ ... }:
{
  flake.nixosModules.zed_UNSTABLE =
    { config, pkgs, ... }:
    let
      user = config.my.user.name;

      settings = pkgs.writeText "zed-settings.json" (
        builtins.replaceStrings
          [ "@user@" "@scrollSensitivity@" ]
          [ user (builtins.toJSON config.my.zed.scroll_sensitivity) ]
          (builtins.readFile ../../../data/zed/settings.json)
      );

      themes = ../../../data/zed/themes;
    in
    {
      environment.systemPackages = [ pkgs.unstable.zed-editor ];

      home-manager.users.${user} =
        { lib, ... }:
        {
          home.activation.zed_dotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
            run rm -rf "$HOME/.config/zed/themes"
            run install -D -m644 ${../../../data/zed/keymap.json} "$HOME/.config/zed/keymap.json"
            run install -D -m644 ${../../../data/zed/tasks.json}  "$HOME/.config/zed/tasks.json"
            run install -D -m644 ${settings} "$HOME/.config/zed/settings.json"

            for theme in ${themes}/*.json; do
              run install -D -m644 "$theme" "$HOME/.config/zed/themes/$(basename "$theme")"
            done
          '';
        };
    };
}
