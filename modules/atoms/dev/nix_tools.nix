#========  NIX TOOLS
{ ... }:
{
  flake.nixosModules.nix_tools =
    { pkgs, ... }:
    {
      programs.nix-index.enable = true;

      programs.nix-ld = {
        enable = true; # needed for dynamically linked tools
        libraries = with pkgs; [
          util-linux
          stdenv.cc.cc
          zlib
          libusb1
        ];
      };

      environment.systemPackages = with pkgs; [
        nixd
        nil
        nixfmt
        nix-tree
        statix
        deadnix
      ];
    };
}
