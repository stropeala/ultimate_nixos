#========  ASUSD & POWERDEVIL
{ self, ... }:
{
  #========  NIXOS module
  flake.nixosModules.asusd_and_powerdevil =
    { config, ... }:
    {
      #========  ASUSD
      services.asusd.enable = true;

      # cat /etc/asusd/asusd.ron
      services.asusd.asusdConfig.text = ''
        (
            charge_control_end_threshold: 80,
            base_charge_control_end_threshold: 80,
            disable_nvidia_powerd_on_battery: true,
            ac_command: "",
            bat_command: "",
            platform_profile_linked_epp: true,
            platform_profile_on_battery: Balanced,
            change_platform_profile_on_battery: true,
            platform_profile_on_ac: Performance,
            change_platform_profile_on_ac: true,
            profile_quiet_epp: Power,
            profile_balanced_epp: BalancePower,
            profile_custom_epp: Performance,
            profile_performance_epp: Performance,
            ac_profile_tunings: {},
            dc_profile_tunings: {
                Balanced: (
                    enabled: false,
                    group: {},
                ),
                Quiet: (
                    enabled: false,
                    group: {},
                ),
            },
            armoury_settings: {},
        )
      '';

      #========  POWERDEVIL
      services.power-profiles-daemon.enable = true;

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.laptop_power ];
    };

  #========  HOME-MANAGER module
  flake.homeModules.laptop_power =
    { ... }:
    {
      programs.plasma.powerdevil = {
        AC = {
          powerButtonAction = "showLogoutScreen";
          autoSuspend = {
            action = "sleep";
            idleTimeout = 7200;
          };
          whenSleepingEnter = "standby";
          whenLaptopLidClosed = "sleep";
          inhibitLidActionWhenExternalMonitorConnected = true;
          displayBrightness = 100;
          keyboardBrightness = 100;
          dimDisplay.idleTimeout = 1800;
          turnOffDisplay = {
            idleTimeout = 3600;
            idleTimeoutWhenLocked = 1800;
          };
        };

        battery = {
          powerButtonAction = "showLogoutScreen";
          autoSuspend = {
            action = "sleep";
            idleTimeout = 3600;
          };
          whenSleepingEnter = "standby";
          whenLaptopLidClosed = "sleep";
          inhibitLidActionWhenExternalMonitorConnected = false;
          displayBrightness = 60;
          dimDisplay.idleTimeout = 900;
          turnOffDisplay = {
            idleTimeout = 1800;
            idleTimeoutWhenLocked = 60;
          };
        };

        lowBattery = {
          powerButtonAction = "showLogoutScreen";
          autoSuspend = {
            action = "sleep";
            idleTimeout = 900;
          };
          whenSleepingEnter = "standby";
          whenLaptopLidClosed = "sleep";
          inhibitLidActionWhenExternalMonitorConnected = false;
          displayBrightness = 25;
          dimDisplay.idleTimeout = 300;
          turnOffDisplay = {
            idleTimeout = 480;
            idleTimeoutWhenLocked = 60;
          };
        };

        batteryLevels = {
          lowLevel = 15;
          criticalLevel = 5;
          criticalAction = "sleep";
        };

        general.pausePlayersOnSuspend = true;
      };
    };
}
