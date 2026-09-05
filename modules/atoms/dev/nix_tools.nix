#========  NIX TOOLS
{ ... }:
{
  flake.nixosModules.nix_tools =
    { pkgs, ... }:
    {
      programs.nix-index.enable = true;

      environment.systemPackages = with pkgs; [
        nixd
        nil
        nixfmt
        statix
        deadnix
        devenv
      ];
    };
}
