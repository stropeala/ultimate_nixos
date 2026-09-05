#========  CLI TOOLS
{ ... }:
{
  flake.nixosModules.cli_tools =
    { pkgs, ... }:
    {
      # auto loads & unloads .envrc when you cd in and out
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      environment.systemPackages = with pkgs; [
        fd # faster find
        ripgrep # faster grep
        dust # faster du
        duf # faster df
        jaq # faster jq
        eza # nicer ls
        bat # nicer cat
        skim # fuzzy finder backed by ripgrep
        zoxide # "z <partial-dir>" jumps to your most-used match

      ];

      programs.fish.interactiveShellInit = ''
        zoxide init fish | source
        alias ls "eza --icons"
        alias ll "eza --icons -l --git"
        alias lt "eza --icons --tree"
      '';

      environment.variables.MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
}
