#========  SYSTEM TWEAKS
{ ... }:
{
  flake.nixosModules.system_tweaks =
    { ... }:
    {
      # tcp_bbr
      boot.kernelModules = [ "tcp_bbr" ];

      boot.kernel.sysctl = {
        # zram-aware paging, swap here is compressed ram
        "vm.swappiness" = 150;
        "vm.page-cluster" = 0;

        "vm.dirty_bytes" = 268435456;
        "vm.dirty_background_bytes" = 67108864;
        "kernel.nmi_watchdog" = 1;
        "kernel.sysrq" = 0;

        # bbr + cake
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "cake";
        "net.ipv4.tcp_fin_timeout" = 5;
      };

      # keeps the previous boot's kernel log
      # journalctl -b -1 -k | grep -iE "nvrm|xid|oom|hung|bug:"
      services.journald.storage = "persistent";

      # compressed ram swap
      zramSwap = {
        enable = true;
        memoryPercent = 50;
      };
    };
}
