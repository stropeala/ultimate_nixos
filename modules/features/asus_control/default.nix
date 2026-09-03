{ ... }: {
  #========  ASUS NOTEBOOK CONTROL
  # Only for lapstrop
  flake.nixosModules.asusControl = { pkgs, ... }: {
    services.asusd.enable = true;
    systemd.tmpfiles.rules = [ "d /etc/asusd 0755 root root -" ];
    environment.systemPackages = [ pkgs.asusctl ];
  };
}
