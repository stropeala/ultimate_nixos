{ ... }: {
  #========  MANGOHUD
  flake.nixosModules.mangohud = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.mangohud ];
  };
}
