#========  SSH CLIENT
# ssh-keygen -t ed25519 -C "petre.ispir2002@protonmail.com"
{ ... }:
{
  flake.nixosModules.ssh =
    { ... }:
    {
      programs.ssh.extraConfig = ''
        Host *
          ForwardAgent no
          AddKeysToAgent no
          Compression no
          ServerAliveInterval 0
          ServerAliveCountMax 3
          HashKnownHosts no
          ControlMaster no
          ControlPersist no

        Host github.com
          IdentityFile ~/.ssh/id_ed25519
      '';
    };
}
