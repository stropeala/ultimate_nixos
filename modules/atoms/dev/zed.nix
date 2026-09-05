#========  ZED EDITOR
# scroll sensitivity differs per host
# my.zed.scroll_sensitivity = float
# in host config
{ ... }:
{
  flake.nixosModules.zed =
    { config, pkgs, ... }:
    let
      user = config.my.user.name;
      home = config.my.user.home;

      settings = pkgs.writeText "zed-settings.json" (
        builtins.replaceStrings
          [ "@user@" "@scrollSensitivity@" ]
          [ user (builtins.toJSON config.my.zed.scroll_sensitivity) ]
          (builtins.readFile ../../../data/zed/settings.json)
      );

      themes = ../../../data/zed/themes;
      install = "install -D -m644 -o ${user} -g users";
    in
    {
      environment.systemPackages = [ pkgs.zed-editor ];

      system.activationScripts.zed_dotfiles = {
        deps = [ "users" ];
        text = ''
          ${install} ${../../../data/zed/keymap.json} ${home}/.config/zed/keymap.json
          ${install} ${../../../data/zed/tasks.json}  ${home}/.config/zed/tasks.json
          ${install} ${settings} ${home}/.config/zed/settings.json
          for theme in ${themes}/*.json; do
            ${install} "$theme" "${home}/.config/zed/themes/$(basename "$theme")"
          done
        '';
      };
    };
}
