{ ... }: {
  #========  PROTON VPN
  flake.nixosModules.protonVpn = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.proton-vpn ];

    # Autostart
    environment.etc."xdg/autostart/proton-vpn.desktop".source =
      "${pkgs.proton-vpn}/share/applications/proton.vpn.app.gtk.desktop";
  };
}
