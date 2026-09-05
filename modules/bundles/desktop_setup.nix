#========  DESKTOP SETUP BUNDLE
{ self, ... }:
{
  flake.nixosModules.desktop_setup =
    { ... }:
    {
      imports = with self.nixosModules; [
        fonts
        mime_apps
        plasma_manager
        sddm
      ];
    };
}
