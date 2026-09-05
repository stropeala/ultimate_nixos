#========  VULKAN TOOLS
{ ... }:
{
  flake.nixosModules.vulkan_tools =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.vulkan-tools ];
    };
}
