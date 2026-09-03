{ ... }: {
  #========  SCSI POWER MAX PERFORMANCE
  # Only for nixostrop
  flake.nixosModules.maxPerformance = { ... }: {
    powerManagement.scsiLinkPolicy = "max_performance";
  };
}
