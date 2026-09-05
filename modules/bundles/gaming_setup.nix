#========  GAMING BUNDLE
{ self, ... }:
{
  flake.nixosModules.gaming_setup =
    { ... }:
    {
      imports = with self.nixosModules; [
        gamemode
        gamescope
        kernel_gaming_tweaks
        mango_hud
        ntsync # my.gaming.ntsync in host config, off by default
        protonplus
        steam
        vulkan_tools
      ];
    };
}
