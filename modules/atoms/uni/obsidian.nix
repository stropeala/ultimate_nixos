#========  OBSIDIAN
{ self, inputs, ... }:
{
  flake.nixosModules.obsidian =
    { config, ... }:
    {
      nixpkgs.overlays = [ inputs.obsidian-extensions.overlays.default ];

      home-manager.users.${config.my.user.name} = {
        imports = [ self.homeModules.obsidian ];
        programs.obsidian.vaults.notes.target = config.my.obsidian.vault;
      };
    };

  flake.homeModules.obsidian =
    { pkgs, ... }:
    {
      programs.obsidian = {
        enable = true;
        defaultSettings = {
          themes = with pkgs.obsidianThemes; [
            catppuccin
          ];

          appearance = {
            cssTheme = "Catppuccin";
            theme = "obsidian";
          };

          communityPlugins = with pkgs.obsidianPlugins; [
            obsidian-git
            obsidian-excalidraw-plugin
          ];
        };
      };
    };
}
