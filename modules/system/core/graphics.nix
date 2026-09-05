#========  GRAPHICS
# needed for steam & proton on both NVIDIA and AMD
{ ... }:
{
  flake.nixosModules.graphics =
    { ... }:
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
}
