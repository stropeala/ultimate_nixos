{ ... }: {
  #========  POWER MONITOR
  # Only for lapstrop
  flake.nixosModules.powerMonitor = { pkgs, ... }: {
    systemd.user.services.power-monitor = {
      description = "Auto-switch power profile on AC/battery change";
      after = [ "graphical-session.target" ];
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        Restart = "on-failure";
        ExecStart = pkgs.writeShellScript "power-monitor.sh" ''
          BAT=$(echo /sys/class/power_supply/BAT*)
          AC_PROFILE="performance"
          BAT_PROFILE="balanced"
          while true; do
            status=$(cat "$BAT/status" 2>/dev/null)
            if [ "$status" = "Discharging" ]; then
              ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set "$BAT_PROFILE"
            else
              ${pkgs.power-profiles-daemon}/bin/powerprofilesctl set "$AC_PROFILE"
            fi
            ${pkgs.inotify-tools}/bin/inotifywait -qq "$BAT/status" 2>/dev/null || sleep 30
          done
        '';
      };
    };
  };
}
