#========  DEFAULT APPLICATIONS
{ ... }:
{
  flake.nixosModules.mime_apps =
    { ... }:
    let
      zed = "dev.zed.Zed.desktop";
      vlc = "vlc.desktop";
      haruna = "org.kde.haruna.desktop";
      brave = "brave-browser.desktop";

      forEach = apps: mimes: builtins.listToAttrs (map (m: {
        name = m;
        value = apps;
      }) mimes);
    in
    {
      xdg.mime.defaultApplications =
        {
          "application/pdf" = "onlyoffice-desktopeditors.desktop";

          "x-scheme-handler/geo" = "google-maps-geo-handler.desktop";
          "x-scheme-handler/proton-inbox" = "proton-mail.desktop";
          "x-scheme-handler/discord" = "legcord.desktop";
          "x-scheme-handler/x-github-client" = "github-desktop.desktop";
          "x-scheme-handler/x-github-desktop-dev-auth" = "github-desktop.desktop";
          "x-scheme-handler/http" = brave;
          "x-scheme-handler/https" = brave;
        }
        // forEach zed [
          "application/json"
          "application/x-docbook+xml"
          "application/x-yaml"
          "text/markdown"
          "text/plain"
          "text/x-cmake"
        ]
        // forEach vlc [
          "audio/aac"
          "audio/mp4"
          "audio/mpeg"
          "audio/mpegurl"
          "audio/ogg"
          "audio/opus"
          "audio/vnd.rn-realaudio"
          "audio/vorbis"
          "audio/webm"
          "audio/x-aiff"
          "audio/x-ape"
          "audio/x-flac"
          "audio/x-m4a"
          "audio/x-matroska"
          "audio/x-mp3"
          "audio/x-mpegurl"
          "audio/x-ms-asx"
          "audio/x-ms-wma"
          "audio/x-musepack"
          "audio/x-oggflac"
          "audio/x-pls"
          "audio/x-pn-realaudio"
          "audio/x-scpls"
          "audio/x-speex"
          "audio/x-vorbis"
          "audio/x-vorbis+ogg"
          "audio/x-wav"
          "audio/x-wavpack"
        ]
        // forEach haruna [
          "video/3gpp"
          "video/3gpp2"
          "video/mp2t"
          "video/mp4"
          "video/mpeg"
          "video/ogg"
          "video/quicktime"
          "video/vnd.rn-realvideo"
          "video/webm"
          "video/x-flv"
          "video/x-matroska"
          "video/x-msvideo"
          "video/x-ms-wmv"
          "video/x-ogm+ogg"
          "video/x-theora+ogg"
        ];
    };
}
