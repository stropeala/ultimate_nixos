{ ... }: {
  #========  NIXOSTROP SPECIFIC CONFIG (shared config in in default.nix)
  flake.nixosModules.nixostropConfiguration = { pkgs, ... }: {
    imports = [ ./_nixostrop_hardware.nix ];

    networking.hostName = "nixostrop";

    users.users."nixostrop" = {
      isNormalUser = true;
      description = "nixostrop";
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
      fish_add_path "/home/nixostrop/.local/bin"
    '';

    #========  DOTFILES
    # Zed
    # sudo chown -R nixostrop:users /etc/nixos
    system.activationScripts.nixostropDotfilesZed.text =
      let
        zedThemes = ../../features/zed/themes;
      in
      ''
        install -D -m644 -o nixostrop -g users ${../../features/zed/keymap.json} /home/nixostrop/.config/zed/keymap.json
        install -D -m644 -o nixostrop -g users ${../../features/zed/tasks.json} /home/nixostrop/.config/zed/tasks.json
        install -D -m644 -o nixostrop -g users ${zedThemes}/custom-catppuccin-mocha_v1.json /home/nixostrop/.config/zed/themes/custom-catppuccin-mocha_v1.json
        install -D -m644 -o nixostrop -g users ${zedThemes}/custom-catppuccin-mocha_v2.json /home/nixostrop/.config/zed/themes/custom-catppuccin-mocha_v2.json
        install -D -m644 -o nixostrop -g users ${zedThemes}/custom-catppuccin-mocha_v3.json /home/nixostrop/.config/zed/themes/custom-catppuccin-mocha_v3.json
        install -D -m644 -o nixostrop -g users ${./nixostrop_zed_settings.json} /home/nixostrop/.config/zed/settings.json
      '';

    # ProtonVPN
    system.activationScripts.nixostropDotfilesProtonVPN.text = ''
      install -D -m644 -o nixostrop -g users ${../../features/proton_vpn/app-config.json} /home/nixostrop/.config/Proton/VPN/app-config.json
    '';

    # MangoHUD
    system.activationScripts.nixostropDotfilesMangoHUD.text = ''
      install -d -m755 -o nixostrop -g users /home/nixostrop/.config/MangoHud
      cat > /home/nixostrop/.config/MangoHud/MangoHud.conf <<'MANGOHUD_CONF'
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
      fps_limit=143
      MANGOHUD_CONF
      chown nixostrop:users /home/nixostrop/.config/MangoHud/MangoHud.conf
    '';

    # Fonts
    system.activationScripts.nixostropDotfilesFonts.text = ''
      install -d -m755 -o nixostrop -g users /home/nixostrop/.local/share/fonts
      for f in ${pkgs.corefonts}/share/fonts/truetype/*.ttf; do
        install -m644 -o nixostrop -g users "$f" /home/nixostrop/.local/share/fonts/
      done
      ${pkgs.fontconfig}/bin/fc-cache -f /home/nixostrop/.local/share/fonts || true
    '';

    #========  TOUCHPAD
    # Touchpad is disabled on the desktop

    #========  KERNEL
    # Nvidia desktop fits better with the lts kernel

    #========  MOUNTS
    fileSystems."/mnt/SSD340" = {
      device = "/dev/disk/by-uuid/64f737eb-9aac-41d6-b473-7e1b39e8af5a";
      fsType = "btrfs";
      options = [
        "defaults"
        "rw"
      ];
    };

    fileSystems."/mnt/HDD150" = {
      device = "/dev/disk/by-uuid/20823498823473FE";
      fsType = "ntfs";
      options = [
        "defaults"
        "rw"
        "uid=1000"
        "gid=100"
      ];
    };

    fileSystems."/mnt/WINDOWS100" = {
      device = "/dev/disk/by-uuid/6C0253160252E51C";
      fsType = "ntfs";
      options = [
        "defaults"
        "rw"
        "uid=1000"
        "gid=100"
      ];
    };
  };
}
