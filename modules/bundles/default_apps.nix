#========  DEFAULT APPS BUNDLE
{ self, ... }:
{
  flake.nixosModules.default_apps =
    { ... }:
    {
      imports = with self.nixosModules; [
        # browsers
        brave
        firefox

        # office
        only_office

        # media
        haruna
        qbittorrent
        vlc

        # social
        legcord
        zapzap

        # proton suite
        proton_mail
        proton_pass
        proton_vpn

        # utils
        bleachbit
        filelight
        gparted
      ];
    };
}
