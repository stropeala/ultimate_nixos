{ ... }: {
  #========  DEFAULT APPS
  flake.nixosModules.mimeApps =
    { ... }:
    let
      defaultApplications = {
        "application/json" = "dev.zed.Zed.desktop";
        "application/pdf" = "onlyoffice-desktopeditors.desktop";
        "application/x-docbook+xml" = "dev.zed.Zed.desktop";
        "application/x-yaml" = "dev.zed.Zed.desktop";

        "audio/aac" = "vlc.desktop";
        "audio/mp4" = "vlc.desktop";
        "audio/mpeg" = "vlc.desktop";
        "audio/mpegurl" = "vlc.desktop";
        "audio/ogg" = "vlc.desktop";
        "audio/opus" = "vlc.desktop";
        "audio/vnd.rn-realaudio" = "vlc.desktop";
        "audio/vorbis" = "vlc.desktop";
        "audio/webm" = "vlc.desktop";
        "audio/x-aiff" = "vlc.desktop";
        "audio/x-ape" = "vlc.desktop";
        "audio/x-flac" = "vlc.desktop";
        "audio/x-m4a" = "vlc.desktop";
        "audio/x-matroska" = "vlc.desktop";
        "audio/x-mp3" = "vlc.desktop";
        "audio/x-mpegurl" = "vlc.desktop";
        "audio/x-ms-asx" = "vlc.desktop";
        "audio/x-ms-wma" = "vlc.desktop";
        "audio/x-musepack" = "vlc.desktop";
        "audio/x-oggflac" = "vlc.desktop";
        "audio/x-pls" = "vlc.desktop";
        "audio/x-pn-realaudio" = "vlc.desktop";
        "audio/x-scpls" = "vlc.desktop";
        "audio/x-speex" = "vlc.desktop";
        "audio/x-vorbis" = "vlc.desktop";
        "audio/x-vorbis+ogg" = "vlc.desktop";
        "audio/x-wav" = "vlc.desktop";
        "audio/x-wavpack" = "vlc.desktop";

        "video/3gpp" = "org.kde.haruna.desktop";
        "video/3gpp2" = "org.kde.haruna.desktop";
        "video/mp2t" = "org.kde.haruna.desktop";
        "video/mp4" = "org.kde.haruna.desktop";
        "video/mpeg" = "org.kde.haruna.desktop";
        "video/ogg" = "org.kde.haruna.desktop";
        "video/quicktime" = "org.kde.haruna.desktop";
        "video/vnd.rn-realvideo" = "org.kde.haruna.desktop";
        "video/webm" = "org.kde.haruna.desktop";
        "video/x-flv" = "org.kde.haruna.desktop";
        "video/x-matroska" = "org.kde.haruna.desktop";
        "video/x-msvideo" = "org.kde.haruna.desktop";
        "video/x-ms-wmv" = "org.kde.haruna.desktop";
        "video/x-ogm+ogg" = "org.kde.haruna.desktop";
        "video/x-theora+ogg" = "org.kde.haruna.desktop";

        "text/markdown" = "dev.zed.Zed.desktop";
        "text/plain" = "dev.zed.Zed.desktop";
        "text/x-cmake" = "dev.zed.Zed.desktop";

        "x-scheme-handler/geo" = "google-maps-geo-handler.desktop";
        "x-scheme-handler/proton-inbox" = "proton-mail.desktop";
        "x-scheme-handler/discord" = "legcord.desktop";
        "x-scheme-handler/x-github-client" = "github-desktop.desktop";
        "x-scheme-handler/x-github-desktop-dev-auth" = "github-desktop.desktop";
        "x-scheme-handler/http" = "brave-browser.desktop";
        "x-scheme-handler/https" = "brave-browser.desktop";
      };

      mimeAppsIni =
        "[Default Applications]\n"
        + builtins.concatStringsSep "\n" (
          builtins.attrValues (builtins.mapAttrs (mime: app: "${mime}=${app}") defaultApplications)
        )
        + "\n";
    in
    {
      environment.etc."xdg/mimeapps.list".text = mimeAppsIni;
    };
}
