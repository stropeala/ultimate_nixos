{ self, ... }: {
  # Groups the default apps list that will be installed
  flake.nixosModules.defApps =
    { ... }:
    let
      modules = with self.nixosModules; [
        # Apps
        legcord
        localsend
        zapzap

        # Utils
        bleachbit
        filelight
        gparted
        haruna
        onlyOffice
        qbittorrent
        vlc

        # Proton suite
        protonMail
        protonPass
        protonVpn
      ];
    in
    {
      imports = modules;
    };
}
