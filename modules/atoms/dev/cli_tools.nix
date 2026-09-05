#========  CLI TOOLS
{ self, ... }:
{
  flake.nixosModules.cli_tools =
    { config, pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        fd # faster find
        ripgrep # faster grep
        dust # faster du
        duf # faster df
        jaq # faster jq
      ];

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.cli_tools ];
    };

  flake.homeModules.cli_tools =
    { ... }:
    {
      # nicer ls
      # ls/ll/lt abbreviations
      programs.eza = {
        enable = true;
        enableFishIntegration = true;
        icons = "auto";
        git = true;
      };

      # "z <partial-dir>" jumps to your most-used match
      programs.zoxide = {
        enable = true;
        enableFishIntegration = true;
      };

      # nicer cat
      programs.bat.enable = true;

      # fuzzy finder
      # ctrl+r history
      # ctrl+t files
      programs.skim = {
        enable = true;
        enableFishIntegration = true;
        defaultCommand = "rg --files --hidden --follow --glob '!.git'";
      };

      home.sessionVariables.MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
}
