{ inputs, ... }:
{
  flake.nixosModules.nixpkgs_unstable_overlay =
    { lib, ... }:
    {
      nixpkgs.overlays = [
        (final: _prev: {
          unstable = import inputs.nixpkgs_unstable {
            inherit (final.stdenv.hostPlatform) system;
            config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "castlabs-electron" ];
          };
        })
      ];
    };
}
