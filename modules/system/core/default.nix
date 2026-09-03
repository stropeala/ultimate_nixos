{
  self,
  inputs,
  ...
}:
{
  #========  CORE
  flake.nixosModules.core =
    { pkgs, ... }:
    let
      modules = with self.nixosModules; [
        # System modules
        bootloader
        nixSettings
        locale
        tuning
        homeManager
      ];
    in
    {
      imports = modules;

      # System packages
      environment.systemPackages = with pkgs; [
        wget
        ntfs3g
        gnutar
        xz
        zstd
        fastfetch
        btop
        v4l-utils
        kitty
      ];

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "26.05"; # Did you read the comment?
    };
}
