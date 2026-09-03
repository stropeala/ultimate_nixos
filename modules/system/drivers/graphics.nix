{ ... }: {
  #========  GRAPHICS
  # Needed for Steam & Proton on both NVIDIA desktop and AMD laptop
  flake.nixosModules.graphics = { ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
