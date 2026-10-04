#========  3D FETCH
{ inputs, ... }:
{
  flake.nixosModules.areofyl_fetch =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.areofyl-fetch.overlays.default ];
      environment.systemPackages = [ pkgs.areofyl-fetch ];
    };
}
