#========  PROGRAMMING LANGUAGES & TOOLS
{ ... }:
{
  flake.nixosModules.programming_languages =
    { pkgs, ... }:
    {
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
        # rust
        rustup

        # python
        uv

        # js/ts
        bun

        # others
        gcc
        pkg-config
      ];
    };
}
