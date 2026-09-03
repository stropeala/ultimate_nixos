{ ... }: {
  #========  FISH
  flake.nixosModules.fish = { ... }: {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        fastfetch
      '';
    };
  };
}
