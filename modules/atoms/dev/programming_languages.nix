#========  PROGRAMMING LANGUAGES & TOOLS
{ ... }:
{
  flake.nixosModules.programming_languages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # rust
        rustup

        # python
        uv

        # js/ts
        bun

        # others
        sqlitebrowser
        pkg-config
      ];
    };
}
