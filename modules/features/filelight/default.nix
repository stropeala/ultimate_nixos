{ ... }: {
  #========  FILELIGHT
  flake.nixosModules.filelight = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.kdePackages.filelight ];
  };
}
