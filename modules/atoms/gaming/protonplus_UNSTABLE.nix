#========  PROTON PLUS
#========  UNSTABLE
{ inputs, ... }:
{
  flake.nixosModules.protonplus_UNSTABLE =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nixpkgs_unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.protonplus
      ];
    };
}
