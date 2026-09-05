#========  MANGOHUD
# frame cap differs per host
# my.mango_hud.fps_limit = int
# in host config
{ ... }:
{
  flake.nixosModules.mango_hud =
    { config, pkgs, ... }:
    let
      conf = pkgs.writeText "MangoHud.conf" ''
        frame_timing
        gpu_stats
        gpu_temp
        gpu_power
        cpu_stats
        cpu_temp
        vram
        ram
        position=top-left
        toggle_hud=Shift_R+F12
        fps_limit=${toString config.my.mango_hud.fps_limit}
      '';
    in
    {
      environment.systemPackages = [ pkgs.mangohud ];

      system.activationScripts.mango_hud_config = {
        deps = [ "users" ];
        text = ''
          install -D -m644 -o ${config.my.user.name} -g users \
            ${conf} ${config.my.user.home}/.config/MangoHud/MangoHud.conf
        '';
      };
    };
}
