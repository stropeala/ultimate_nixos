#========  OBSIDIAN
# config.my.obsidian.vault
# obsidian = {
#   vault = "OBSIDIAN";
# };
# fileSystems."/home/${config.my.user.name}/OBSIDIAN" = {
#   device = "/mnt/mounted_drive/OBSIDIAN";
#   fsType = "none";
#   options = [ "bind" ];
#   depends = [ "/mnt/mounted_drive" ];
# };
# in host config
{ self, inputs, ... }:
{
  #========  NIXOS module
  flake.nixosModules.obsidian =
    { config, ... }:
    {
      nixpkgs.overlays = [ inputs.obsidian-extensions.overlays.default ];

      home-manager.users.${config.my.user.name} = {
        imports = [ self.homeModules.obsidian ];
        programs.obsidian.vaults.notes.target = config.my.obsidian.vault;
      };
    };

  #========  HOME-MANAGER module
  flake.homeModules.obsidian =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.obsidian = {
        enable = true;

        defaultSettings = {
          #====  app
          app = {
            newFileLocation = "root";
            useMarkdownLinks = false; # [[wikilinks]]
            alwaysUpdateLinks = true;
            readableLineLength = true;
            foldHeading = true;
            foldIndent = true;
            showUnsupportedFiles = false;
          };

          #====  appearance
          appearance = {
            theme = "obsidian";
            baseFontSize = 16;
            accentColor = "#5699f0";
          };

          #====  themes
          themes = [
            {
              pkg = pkgs.obsidianThemes.catppuccin;
              enable = true;
            }
            {
              pkg = pkgs.obsidianThemes.obsidianite;
              enable = false;
            }
          ];

          #====  core plugins
          corePlugins = [
            "file-explorer"
            "global-search"
            "switcher"
            "command-palette"
            "slash-command"
            "page-preview"
            "backlink"
            "outgoing-link"
            "outline"
            "tag-pane"
            "properties"
            "bookmarks"
            "bases"
            "canvas"
            "graph"
            "note-composer"
            "footnotes"
            "word-count"
            "editor-status"
            "file-recovery"
            "workspaces"
          ];

          #====  community plugins
          communityPlugins = with pkgs.obsidianPlugins; [
            # git
            obsidian-git

            # diagrams
            obsidian-excalidraw-plugin

            # zed
            {
              pkg = open-in-zed;
              settings = {
                zedPath = lib.getExe config.programs.zed-editor.package;
                zedAppName = "Zed";
              };
            }

            # dataview, tasks, calendar, kanban
            dataview
            obsidian-tasks-plugin
            obsidian-kanban

            # reading & writing
            pdf-plus
            obsidian-latex-suite
            table-editor-obsidian
            native-powerpoint-doc-editor

            # theme accent
            {
              pkg = obsidian-style-settings;
              settings = {
                "catppuccin-theme-settings@@catppuccin-theme-dark" = "ctp-mocha";
                "catppuccin-theme-settings@@catppuccin-theme-accents" = "ctp-accent-blue";
              };
            }
          ];

          # hotkeys
          hotkeys = {
            "open-in-zed:open-vault-in-zed" = [
              {
                modifiers = [ "Alt" ];
                key = "Z";
              }
            ];
          };
        };
      };
    };
}
