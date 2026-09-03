{ ... }: {
  #========  TUNING
  flake.nixosModules.tuning = { pkgs, ... }: {
    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
      "vm.swappiness" = 150;
      "vm.page-cluster" = 0;
      "vm.dirty_bytes" = 268435456;
      "vm.dirty_background_bytes" = 67108864;
      "kernel.nmi_watchdog" = 1;

      # networking — bbr + cake
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
      "net.ipv4.tcp_fin_timeout" = 5;

      # SteamOS-style tweaks from nix-gaming's platformOptimizations
      "kernel.sched_cfs_bandwidth_slice_us" = 3000;
      "kernel.split_lock_mitigate" = 0;
      
      "kernel.sysrq" = 0;
    };

    # Kernel log
    # journalctl -b -1 -k | grep -iE "nvrm|xid|oom|hung|bug:"
    services.journald.storage = "persistent";

    # Compressed RAM swap
    zramSwap = {
      enable = true;
      memoryPercent = 50;
    };

    # Cpu microcode updates (vendor picked automatically per host)
    hardware.enableRedistributableFirmware = true;

    # Device rules that apply automatically whenever a matching drive/module is detected
    services.udev.extraRules = ''
      ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
      ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
      ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="none"
      ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTRS{id/bus}=="ata", RUN+="${pkgs.hdparm}/bin/hdparm -B 254 -S 0 /dev/%k"
    '';
  };
}
