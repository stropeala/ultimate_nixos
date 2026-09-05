#========  PROTON VPN
{ ... }:
{
  flake.nixosModules.proton_vpn =
    { config, pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.proton-vpn ];

      # autostart
      environment.etc."xdg/autostart/proton-vpn.desktop".source =
        "${pkgs.proton-vpn}/share/applications/proton.vpn.app.gtk.desktop";

      # config
      system.activationScripts.proton_vpn_config = {
        deps = [ "users" ];
        text = ''
          install -D -m644 -o ${config.my.user.name} -g users \
            ${../../../data/proton_vpn/app-config.json} \
            ${config.my.user.home}/.config/Proton/VPN/app-config.json
        '';
      };
    };
}
