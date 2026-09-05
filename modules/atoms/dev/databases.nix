#========  DATABASES
{ ... }:
{
  flake.nixosModules.databases =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        sqlite
        postgresql
        sqlitebrowser
      ];
    };
}
