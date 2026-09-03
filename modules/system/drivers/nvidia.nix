{ ... }: {
  #========  NVIDIA
  # Only for nixostrop NVIDIA desktop
  flake.nixosModules.nvidiaDrivers = { config, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true; # open-source kernel module, supported for Ampere (RTX 3060 Ti)
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
