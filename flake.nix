{
  description = "Master flake for Stropeala's NixOS configuration";

  inputs = {
    #========  SYSTEM
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    #========  APPS
    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # KDE Plasma Manager
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    # Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # 3D Fetch
    areofyl-fetch = {
      url = "github:areofyl/fetch";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #========  FLAKE PARTS & IMPORT TREE
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
