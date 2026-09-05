#========  FISH
{ self, ... }:
{
  flake.nixosModules.fish =
    { config, ... }:
    {
      programs.fish.enable = true;

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.fish ];
    };

  flake.homeModules.fish =
    { config, ... }:
    {
      programs.fish = {
        enable = true;

        interactiveShellInit = ''
          fastfetch
          fish_add_path "${config.home.homeDirectory}/.local/bin"
        '';
      };
    };
}
