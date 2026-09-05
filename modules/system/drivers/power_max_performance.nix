#========  POWER MAX PERFORMANCE
{ ... }:
{
  flake.nixosModules.power_max_performance =
    { ... }:
    {
      powerManagement.scsiLinkPolicy = "max_performance";
    };
}
