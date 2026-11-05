#========  PRISM LAUNCHER
{ ... }:
{
  flake.nixosModules.prism_launcher =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.prismlauncher ];
    };
}
