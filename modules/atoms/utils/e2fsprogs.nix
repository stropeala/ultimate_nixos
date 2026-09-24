#========  E2FSPROGS
# sudo filefrag ~/dir/*.file_extention
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
