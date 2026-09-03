{ ... }: {
  #========  LAPSTROP SPECIFIC CONFIG (shared config in in default.nix)
  flake.nixosModules.lapstropConfiguration = { pkgs, ... }: {
    imports = [ ./lapstrop_hardware.nix ];

    networking.hostName = "lapstrop";

    users.users."lapstrop" = {
      isNormalUser = true;
      description = "lapstrop";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
      ];
      shell = pkgs.fish;
    };

    #========  PATH
    # fish
    programs.fish.interactiveShellInit = ''
      fish_add_path "/home/lapstrop/.local/bin"
    '';

    #========  DOTFILES
    # Zed
    system.activationScripts.lapstropDotfilesZed.text =
      let
        zedThemes = ../../features/zed/themes;
      in
      ''
        install -D -m644 -o lapstrop -g users ${../../features/zed/keymap.json} /home/lapstrop/.config/zed/keymap.json
        install -D -m644 -o lapstrop -g users ${../../features/zed/tasks.json} /home/lapstrop/.config/zed/tasks.json
        install -D -m644 -o lapstrop -g users ${zedThemes}/custom-catppuccin-mocha_v1.json /home/lapstrop/.config/zed/themes/custom-catppuccin-mocha_v1.json
        install -D -m644 -o lapstrop -g users ${zedThemes}/custom-catppuccin-mocha_v2.json /home/lapstrop/.config/zed/themes/custom-catppuccin-mocha_v2.json
        install -D -m644 -o lapstrop -g users ${zedThemes}/custom-catppuccin-mocha_v3.json /home/lapstrop/.config/zed/themes/custom-catppuccin-mocha_v3.json
        install -D -m644 -o lapstrop -g users ${./lapstrop_zed_settings.jsonc} /home/lapstrop/.config/zed/settings.jsonc
      '';

    # ProtonVPN
    system.activationScripts.lapstropDotfilesProtonVPN.text = ''
      install -D -m644 -o lapstrop -g users ${../../features/proton_vpn/app-config.json} /home/lapstrop/.config/Proton/VPN/app-config.json
    '';

    # MangoHUD
    system.activationScripts.lapstropDotfilesMangoHUD.text = ''
      install -d -m755 -o lapstrop -g users /home/lapstrop/.config/MangoHud
      cat > /home/lapstrop/.config/MangoHud/MangoHud.conf <<'MANGOHUD_CONF'
      frame_timing
      gpu_stats
      gpu_temp
      gpu_power
      cpu_stats
      cpu_temp
      vram
      ram
      position=top-left
      toggle_hud=Shift_R+F12
      fps_limit=59
      MANGOHUD_CONF
      chown lapstrop:users /home/lapstrop/.config/MangoHud/MangoHud.conf
    '';

    # Fonts
    system.activationScripts.lapstropDotfilesFonts.text = ''
      install -d -m755 -o lapstrop -g users /home/lapstrop/.local/share/fonts
      for f in ${pkgs.corefonts}/share/fonts/truetype/*.ttf; do
        install -m644 -o lapstrop -g users "$f" /home/lapstrop/.local/share/fonts/
      done
      ${pkgs.fontconfig}/bin/fc-cache -f /home/lapstrop/.local/share/fonts || true
    '';

    #========  TOUCHPAD
    # Touchpad is enabled on the laptop
    services.libinput.enable = true;

    #========  KERNEL
    # Ryzen laptop fits better with the latest kernel
    boot.kernelPackages = pkgs.linuxPackages_latest;

    #========  MOUNTS
    fileSystems."/mnt/WINDOWS169" = {
      device = "/dev/disk/by-uuid/641A67331A670182";
      fsType = "ntfs";
      options = [
        "defaults"
        "rw"
        "uid=1000"
        "gid=100"
      ];
    };

    fileSystems."/mnt/PROTONDRIVE30" = {
      device = "/dev/disk/by-uuid/26BA51A8BA517571";
      fsType = "ntfs";
      options = [
        "defaults"
        "rw"
        "uid=1000"
        "gid=100"
      ];
    };

    swapDevices = [
      {
        device = "/swapfile";
        size = 8 * 1024;
      }
    ];
  };
}
