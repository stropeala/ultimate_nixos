{ ... }: {
  #========  ONLY OFFICE
  flake.nixosModules.onlyOffice = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.onlyoffice-desktopeditors ];
  };
}
