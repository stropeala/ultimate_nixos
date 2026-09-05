#========  GIT
{ ... }:
{
  flake.nixosModules.git =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        delta
        github-desktop
      ];

      environment.etc."gitconfig".text = ''
        [user]
          name = Petre Razvan
          email = petre.ispir2002@protonmail.com
          # Settings -> SSH and GPG keys -> New SSH key -> key type "Signing Key"
          signingkey = ~/.ssh/id_ed25519.pub

        [init]
          defaultBranch = main

        [pull]
          rebase = false

        [diff]
          colorMoved = default

        [core]
          pager = delta

        [interactive]
          diffFilter = delta --color-only

        [delta]
          navigate = true
          dark = true

        [merge]
          conflictStyle = zdiff3

        [gpg]
          format = ssh

        [commit]
          gpgsign = true

        [safe]
          directory = /etc/nixos

        [alias]
          s = status --short --branch
          l = log --graph --oneline --decorate
          pf = push --force-with-lease
          undo = reset --soft HEAD~1
          amend = commit --amend --no-edit
      '';
    };
}
