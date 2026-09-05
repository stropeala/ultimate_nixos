#========  KDE CONNECT
{ ... }:
{
  flake.nixosModules.kde_connect =
    { ... }:
    {
      programs.kdeconnect.enable = true;
    };
}
