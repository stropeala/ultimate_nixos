#========  HOME MANAGER
{ inputs, lib, ... }:
{
  options.flake.homeModules = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.deferredModule;
    default = { };
    description = "home-manager modules, contributed by atoms.";
  };

  config.flake.nixosModules.home_manager =
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
