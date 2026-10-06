#========  DEVENV & DIRENV (direnv just for zed integration)
#========  UNSTABLE (DEVENV)
# devenv init --include-envrc
# direnv allow
{ self, ... }:
{
  flake.nixosModules.devenv_direnv_UNSTABLE =
    { config, pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.unstable.devenv ];
      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.devenv_direnv ];
    };

  flake.homeModules.devenv_direnv =
    { ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        silent = true;
        enableFishIntegration = true;
      };
    };
}
