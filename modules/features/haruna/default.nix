{ ... }: {
  #========  HARUNA
  flake.nixosModules.haruna = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.haruna ];
  };
}
