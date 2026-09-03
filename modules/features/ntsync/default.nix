{ ... }: {
  #========  NTSYNC
  # Only for lapstrop, stuttery on nixostrop
  flake.nixosModules.ntsync = { pkgs, ... }: {
    boot.kernelModules = [ "ntsync" ];
    services.udev.packages = [
      (pkgs.writeTextFile {
        name = "ntsync-udev-rules";
        text = ''KERNEL=="ntsync", MODE="0660", TAG+="uaccess"'';
        destination = "/etc/udev/rules.d/70-ntsync.rules";
      })
    ];
  };
}
