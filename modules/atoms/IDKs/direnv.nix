#========  DIRENV
{ self, ... }:
{
  flake.nixosModules.direnv =
    { config, ... }:
    {
      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.direnv ];
    };

  flake.homeModules.direnv =
    { ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableFishIntegration = true;
      };
    };
}
