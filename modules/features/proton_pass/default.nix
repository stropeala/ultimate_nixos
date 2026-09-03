{ ... }: {
  #========  PROTON PASS
  flake.nixosModules.protonPass = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.proton-pass ];
  };
}
