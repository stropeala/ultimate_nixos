#========  SQLITE BROWSER
{ ... }:
{
  flake.nixosModules.sqlite_browser =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.sqlitebrowser ];
    };
}
