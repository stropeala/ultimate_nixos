#========  TIDAL HIFI
{ inputs, ... }:
{
  flake.nixosModules.tidal_hifi =
    { pkgs, ... }:
    let
      pkgs_unstable = import inputs.nixpkgs_unstable {
        inherit (pkgs.stdenv.hostPlatform) system;
        config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ "castlabs-electron" ];
      };
    in
    {
      environment.systemPackages = [ pkgs_unstable.tidal-hifi ];
    };
}
