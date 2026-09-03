{ ... }: {
  #========  NETWORK
  flake.nixosModules.network = { ... }: {
    # Enable networking
    networking.networkmanager.enable = true;

    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
