#========  INTEL iGPU
# nixostrop i5 10600K (Comet Lake) UHD Graphics 630, Gen9.5
{ ... }:
{
  flake.nixosModules.intel_drivers =
    { pkgs, ... }:
    {
      # video acceleration
      hardware.graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime # opencl for QSV filters
      ];

      hardware.graphics.extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
      ];

      # tools
      environment.systemPackages = with pkgs; [
        intel-gpu-tools
      ];
    };
}
