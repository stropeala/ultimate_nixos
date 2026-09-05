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
    { config, pkgs, ... }:
    let
      fish_theme_damin = pkgs.stdenvNoCC.mkDerivation {
        pname = "fish-theme-damin";
        version = "0-unstable-2026-02-14";

        src = pkgs.fetchFromGitHub {
          owner = "miniex";
          repo = "fish-theme-damin";
          rev = "684c7f888008552d2c5e325df95bcee91db6c688";
          hash = "sha256-BTsfSGT8rpiaS3TQ6xtjzB+J6OG2U8VjYmDdJnWF9/g=";
        };

        dontConfigure = true;
        dontBuild = true;

        installPhase = ''
          runHook preInstall

          mkdir -p "$out"/{conf.d,functions,completions}
          cp -r conf.d/.      "$out/conf.d/"
          cp -r functions/.   "$out/functions/"
          cp -r completions/. "$out/completions/"

          runHook postInstall
        '';

        meta.description = "damin theme for fish";
      };
    in
    {
      programs.fish = {
        enable = true;

        plugins = [
          {
            name = "fish-theme-damin";
            src = fish_theme_damin;
          }
        ];

        interactiveShellInit = ''
          fastfetch
          fish_add_path "${config.home.homeDirectory}/.local/bin"
        '';
      };
    };
}
