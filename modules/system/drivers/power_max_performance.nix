#========  POWER MAX PERFORMANCE
{ self, ... }:
{
  flake.nixosModules.power_max_performance =
    { config, ... }:
    {
      #========  CPU
      powerManagement.cpuFreqGovernor = "performance";

      #========  DISKS
      powerManagement.scsiLinkPolicy = "max_performance";

      #========  PROFILE
      services.power-profiles-daemon.enable = true;

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.desktop_power ];
    };

  #========  HOME-MANAGER module
  flake.homeModules.desktop_power =
    { ... }:
    {
      programs.plasma.powerdevil.AC = {
        powerProfile = "performance";
        powerButtonAction = "showLogoutScreen";
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
        turnOffDisplay.idleTimeout = "never";
      };
    };
}
