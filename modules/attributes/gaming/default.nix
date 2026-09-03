{ ... }: {
  # Groups the gaming list that will be installed
  flake.nixosModules.gaming = { pkgs, ... }: {

    # Steam
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
    };

    # gamemoderun %command%
    programs.gamemode = {
      enable = true;
      enableRenice = true;
      settings.general.softrealtime = "auto";
    };

    # gamescope -W 2560 -H 1440 -f --mangoapp -- gamemoderun %command%
    # gamescope -W 1920 -H 1200 -f --mangoapp -- gamemoderun %command%
    programs.gamescope = {
      enable = true;
      env.ENABLE_GAMESCOPE_WSI = "0";
    };

    environment.systemPackages = with pkgs; [
      protonplus
    ];
  };
}
