#========  PROTON PLUS
{ inputs, ... }:
{
  flake.nixosModules.protonplus =
    { pkgs, config, ... }:
    {
      environment.systemPackages = [
        inputs.nixpkgs_unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.protonplus
      ];
    };
}
