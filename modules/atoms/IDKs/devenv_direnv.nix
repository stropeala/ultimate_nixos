#========  DEVENV & DIRENV (just for zed integration)
# devenv init --include-envrc
# direnv allow
{ self, ... }:
{
  flake.nixosModules.devenv_direnv =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        devenv
        direnv
      ];

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
