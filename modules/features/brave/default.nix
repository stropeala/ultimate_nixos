{ ... }: {
  #========  BRAVE
  flake.nixosModules.brave = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.brave ];
    environment.sessionVariables.BROWSER = "brave";
  };
}
