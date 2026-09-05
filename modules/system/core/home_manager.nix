#========  HOME MANAGER
{ inputs, ... }:
{
  flake.nixosModules.home_manager =
    { config, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "hm-bak";

        users.${config.my.user.name} = {
          home.stateVersion = config.my.state_version;
        };
      };
    };
}
