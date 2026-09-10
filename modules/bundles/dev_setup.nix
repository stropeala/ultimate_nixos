#========  DEV SETUP BUNDLE
{ self, ... }:
{
  flake.nixosModules.dev_setup =
    { ... }:
    {
      imports = with self.nixosModules; [
        cli_tools
        devenv_direnv
        git
        kitty
        nix_tools
        programming_languages
        zed
      ];
    };
}
