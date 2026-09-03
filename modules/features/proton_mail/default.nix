{ ... }: {
  #========  PROTON MAIL
  flake.nixosModules.protonMail = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.protonmail-desktop ];
  };
}
