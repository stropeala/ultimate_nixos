{ inputs, ... }: {
  #========  3D FETCH
  flake.nixosModules.areofylFetch = { pkgs, ... }: {
    nixpkgs.overlays = [ inputs.areofyl-fetch.overlays.default ];
    environment.systemPackages = [
      inputs.areofyl-fetch.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
