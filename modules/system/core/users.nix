#========  USERS
{ ... }:
{
  flake.nixosModules.users =
    { config, pkgs, ... }:
    {
      users.users.${config.my.user.name} = {
        isNormalUser = true;
        description = config.my.user.description;
        extraGroups = config.my.user.extra_groups;
        shell = pkgs.fish;
      };
    };
}
