#========  KERNEL GAMING TWEAKS
{ ... }:
{
  flake.nixosModules.kernel_gaming_tweaks =
    { ... }:
    {
      boot.kernel.sysctl = {
        # proton & wine map a very large number of small regions
        "vm.max_map_count" = 2147483642;

        # steamos style tweaks from nix-gaming's platformOptimizations
        "kernel.sched_cfs_bandwidth_slice_us" = 3000;
        "kernel.split_lock_mitigate" = 0;
      };
    };
}
