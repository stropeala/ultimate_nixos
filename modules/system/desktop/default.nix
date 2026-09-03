{ self, ... }: {
  #======== SYSTEM DESKTOP BUNDLE
  flake.nixosModules.desktop =
    { ... }:
    let
      modules = with self.nixosModules; [
        core
        plasma
        sddm
        printing
        bluetooth
        kdeconnect
        network
        audio
        graphics
        fish
        firefox
        brave
        flatpak
        fonts
        git
        ssh
        kitty
        terminalQol
        mangohud
        mimeApps
      ];
    in
    {
      imports = modules;
    };
}
