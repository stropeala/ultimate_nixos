#========  GAMESCOPE
# gamescope -W 2560 -H 1440 -f --mangoapp -- gamemoderun %command%
# gamescope -W 1920 -H 1200 -f --mangoapp -- gamemoderun %command%
{ ... }:
{
  flake.nixosModules.gamescope =
    { ... }:
    {
      programs.gamescope = {
        enable = true;
        env.ENABLE_GAMESCOPE_WSI = "0";
      };
    };
}
