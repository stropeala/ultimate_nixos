#========  HOWDY (FACE UNLOCK)
{ ... }:
{
  flake.nixosModules.howdy =
    { ... }:
    {
      services.howdy = {
        enable = true;
        settings = {
          video = {
            device_path = "/dev/video2";
            device_format = "GREY";
            frame_width = 640;
            frame_height = 360;
            frame_type = -1;
            crop_top = -1;
            crop_bottom = -1;
            crop_left = -1;
            crop_right = -1;
            rotate = 0;
            recording_plugin = "opencv";
            device_fps = -1;
            use_cnn = false;
            timeout = 5;
            dark_threshold = 60;
            video_certainty = 3.5;
            end_report = false;
            model_selection = 0;
            force_mjpeg = false;
          };
          core.use_landmark_detector = true;
        };
      };

      #========  PAM
      security.pam.services = {
        sudo.howdy = {
          enable = true;
          control = "sufficient";
        };
        login.howdy = {
          enable = true;
          control = "sufficient";
        };

        # disable if bugs appear
        kde.howdy = {
          enable = true;
          control = "sufficient";
        };

        sddm.howdy = {
          enable = true;
          control = "sufficient";
        };

        # howdy misbehaves when polkit prompts go through it
        polkit-1.howdy.enable = false;
      };
    };
}
