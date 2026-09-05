#========  GAMEMODE
# gamemoderun %command%
{ ... }:
{
  flake.nixosModules.gamemode =
    { ... }:
    {
      programs.gamemode = {
        enable = true;
        enableRenice = true;
        settings.general.softrealtime = "auto";
      };
    };
}
