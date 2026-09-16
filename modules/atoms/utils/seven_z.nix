#========  7Z
{ ... }:
{
  flake.nixosModules.seven_z =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        p7zip
      ];
    };
}
