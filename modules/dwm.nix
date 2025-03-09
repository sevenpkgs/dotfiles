{pkgs, ...}: {
  services.xserver.windowManager.dwm.enable = true;
  services.xserver.enable = true;
  services.xserver.resolutions = [
    {
      x = 1920;
      y = 1080;
    }
  ];

  services.picom.vSync = true;

  programs.slock = {
    enable = true;
    package = pkgs.slock.override {
      conf = ''        static const char *user  = "nobody";
                       static const char *group = "nogroup";
                       static const char *colorname[NUMCOLS] = {
        	[INIT] =   "black",     /* after initialization */
        	[INPUT] =  "#458588",   /* during input */
        	[FAILED] = "#cc241d",   /* wrong password */
              };
                       static const int failonclear = 1;
      '';
    };
  };

  services.xserver.windowManager.dwm.package = pkgs.dwm.override {
    conf = ./dwm/config.h;
    patches = [
      ./dwm/patches/dwm-noborder-6.2.diff
      ./dwm/patches/dwm-fullgaps-6.4.diff
      ./dwm/patches/dwm-swallow-6.3.diff
    ];
  };
}
