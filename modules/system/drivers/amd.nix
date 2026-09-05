#========  AMD
# lapstrop Ryzen AI 7 445 (Gorgon Point, Zen 5) + Radeon 840M iGPU
{ ... }:
{
  flake.nixosModules.amd_drivers =
    { pkgs, ... }:
    {
      hardware.amdgpu.initrd.enable = true;

      # tools
      environment.systemPackages = with pkgs; [
        amdgpu_top # per-engine load, VRAM, power
        libva-utils # vainfo, to confirm decode is live
      ];
    };
}
