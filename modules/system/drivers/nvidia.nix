#========  NVIDIA
{ ... }:
{
  flake.nixosModules.nvidia_drivers =
    { config, pkgs, ... }:
    {
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = true;
        open = true; # supported for Ampere (RTX 3060 Ti)
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };

      # hardware video decode
      hardware.graphics.extraPackages = [ pkgs.nvidia-vaapi-driver ];

      environment.sessionVariables = {
        NVD_BACKEND = "direct";
        LIBVA_DRIVER_NAME = "nvidia";
      };

      # tools
      environment.systemPackages = with pkgs; [
        nvtopPackages.nvidia
        libva-utils # vainfo, to confirm decode is live
      ];

    };
}
