{ ... }:
{
  flake.nixosModules.tidal_hifi_UNSTABLE =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.UNSTABLE.tidal-hifi.overrideAttrs (old: {
          nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ pkgs.makeBinaryWrapper ];
          postFixup = (old.postFixup or "") + ''
            wrapProgram "$out/bin/tidal-hifi" --add-flags "--disable-dev-shm-usage"
          '';
        }))
      ];
    };
}
