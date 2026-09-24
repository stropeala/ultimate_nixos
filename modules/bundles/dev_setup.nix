#========  DEV SETUP BUNDLE
{ self, ... }:
{
  flake.nixosModules.dev_setup =
    { ... }:
    {
      imports = with self.nixosModules; [
        cli_tools
        devenv_direnv_UNSTABLE
        git
        kitty
        nix_tools
        zed
      ];
    };
}
