#========  DIRENV  DEVENV
{ self, ... }:
{
  flake.nixosModules.direnv_devenv =
    { config, pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.devenv ];

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.direnv_devenv ];
    };

  flake.homeModules.direnv_devenv =
    { ... }:
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableFishIntegration = true;
      };

      programs.fish.functions.make-devenv = {
        description = "Scaffold a devenv project and hand it to direnv";
        body = ''
          if test -e devenv.nix
            echo "devenv.nix already exists here."
            return 1
          end

          devenv init; or return $status

          printf '%s\n' 'eval "$(devenv direnvrc)"' 'use devenv' > .envrc

          direnv allow
        '';
      };

    };
}
