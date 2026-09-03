{ ... }: {
  # Groups the dev list that will be installed
  flake.nixosModules.development = { pkgs, ... }: {
    programs.nix-index.enable = true;
    programs.nix-ld.enable = true; # needed for dynamically linked tools

    environment.systemPackages = with pkgs; [
      # Programming languages & tools
      rustup
      uv
      bun
      gcc
      pkg-config
      sqlite
      postgresql
      git
      github-desktop
      zed-editor
      nixd
      nil
      nixfmt
      statix
      deadnix
      devenv

      # CLI
      fd # faster find
      ripgrep # faster grep
      dust # faster du
      duf # faster df
      jaq # faster jq

      # DB
      sqlitebrowser
    ];
  };
}
