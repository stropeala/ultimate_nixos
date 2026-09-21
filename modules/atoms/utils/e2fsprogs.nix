#========  E2FSPROGS
{ ... }:
{
  flake.nixosModules.e2fsprogs =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        e2fsprogs
      ];
    };
}
