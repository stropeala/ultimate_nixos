{ ... }: {
  #========  ZAPZAP
  flake.nixosModules.zapzap = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.zapzap ];
  };
}
