#========  PROTON PLUS
#========  UNSTABLE
{ inputs, ... }:
{
  flake.nixosModules.protonplus =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        inputs.nixpkgs_unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.protonplus
      ];
    };
}
