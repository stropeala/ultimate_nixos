#========  BLUETOOTH
{ ... }:
{
  flake.nixosModules.bluetooth =
    { ... }:
    {
      hardware.bluetooth.enable = true;
    };
}
