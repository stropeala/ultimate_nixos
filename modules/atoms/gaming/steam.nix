#========  STEAM
{ ... }:
{
  flake.nixosModules.steam =
    { ... }:
    {
      programs.steam = {
        enable = true;
        remotePlay.openFirewall = true;
      };
    };
}
