#========  CHECKS
# nix flake check
# evaluates and builds hosts
{ self, lib, ... }:
{
  perSystem =
    { system, ... }:
    {
      checks = lib.optionalAttrs (system == "x86_64-linux") (
        lib.mapAttrs' (
          name: cfg: lib.nameValuePair "nixos_${name}" cfg.config.system.build.toplevel
        ) self.nixosConfigurations
      );
    };
}
