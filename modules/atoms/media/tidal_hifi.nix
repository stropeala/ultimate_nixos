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

      tidal_hifi_shm = pkgs_unstable.tidal-hifi.overrideAttrs (old: {
        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeBinaryWrapper ];
        postFixup = (old.postFixup or "") + ''
          wrapProgram "$out/bin/tidal-hifi" \
            --add-flags "--disable-dev-shm-usage"
        '';
      });
    in
    {
      environment.systemPackages = [ tidal_hifi_shm ];
    };
}
