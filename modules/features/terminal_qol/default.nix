{ ... }: {
  #========  TERMINAL QUALITY OF LIFE
  flake.nixosModules.terminalQol = { pkgs, ... }: {
    # auto-loads/unloads a project's .envrc (env vars, nix develop shells) as
    # you cd in and out of directories
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    environment.systemPackages = with pkgs; [
      eza # nicer `ls` — icons, git status column, tree view
      bat # nicer `cat` — syntax highlighting, git diff markers, line numbers
      skim # fuzzy finder backed by ripgrep
      zoxide # `z <partial-dir-name>` jumps to your most-used matching directory
    ];

    # zoxide ships its own fish integration; eza/bat get simple aliases.
    # bat also becomes the colorized man pager, system-wide.
    programs.fish.interactiveShellInit = ''
      zoxide init fish | source
      alias ls "eza --icons"
      alias ll "eza --icons -l --git"
      alias lt "eza --icons --tree"
    '';

    environment.variables.MANPAGER = "sh -c 'col -bx | bat -l man -p'";
  };
}
