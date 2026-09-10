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

        # media
        haruna
        qbittorrent
        tidal_hifi
        vlc

        # office
        only_office

        # proton suite
        proton_mail
        proton_pass
        proton_vpn

        # social
        legcord
        zapzap

        # utils
        bleachbit
        filelight
        gparted
        sqlite_browser
      ];
    };
}
