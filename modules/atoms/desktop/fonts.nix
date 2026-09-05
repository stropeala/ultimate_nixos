#========  FONTS
{ self, ... }:
{
  flake.nixosModules.fonts =
    { config, pkgs, ... }:
    {
      fonts.packages = with pkgs; [
        # fonts
        jetbrains-mono
        nerd-fonts.jetbrains-mono
        noto-fonts
        corefonts

        # icons
        papirus-icon-theme
      ];

      home-manager.users.${config.my.user.name}.imports = [ self.homeModules.fonts ];
    };

  flake.homeModules.fonts =
    { pkgs, lib, ... }:
    {
      fonts.fontconfig.enable = lib.mkDefault true;

      home.activation.install_corefonts_for_onlyoffice = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p "$HOME/.local/share/fonts"
        for f in ${pkgs.corefonts}/share/fonts/truetype/*.ttf; do
          cp -f "$f" "$HOME/.local/share/fonts/"
        done
        chmod 644 "$HOME"/.local/share/fonts/*.ttf
        ${pkgs.fontconfig}/bin/fc-cache -f "$HOME/.local/share/fonts" || true
      '';
    };
}
