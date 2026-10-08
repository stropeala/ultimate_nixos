{ inputs, ... }:
{
  flake.nixosModules.nixpkgs_overlay_UNSTABLE=
    { ... }:
    {
      nixpkgs.overlays = [
        (final: _prev: {
          UNSTABLE = import inputs.nixpkgs_UNSTABLE {
            inherit (final.stdenv.hostPlatform) system;
            config.allowUnfree = true;
          };
        })
      ];
    };
}
