{
  config,
  pkgs,
  pkgs-unstable,
  lib,
  ...
}: {
  imports = [
    ./programs/nvf
    ./programs/stylix.nix
    ./programs/fish.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "seven";
  home.homeDirectory = "/home/seven";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nh
    microfetch
    btop
    eza
    obsidian
    feh
    #    (pkgs.callPackage ./programs/harsh.nix {})
    (pkgs.callPackage ./programs/sent.nix {})
    flameshot
    dust
    keepassxc
    (ncmpcpp.override {visualizerSupport = true;})
    mpd
    bat
    librewolf
    lazygit
    ffmpeg
    brightnessctl
    libnotify
    dunst
    sxiv
    pkgs-unstable.gowall
    jq
    neomutt
    lynx
    redshift
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/mpd/mpd.conf".source = ./configs/mpd/mpd.conf;
    ".config/ncmpcpp/bindings".source = ./configs/ncmpcpp/bindings;
    ".config/ncmpcpp/config".source = ./configs/ncmpcpp/config;
    ".config/dunst/dunstrc".source = ./configs/dunst/dunstrc;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/seven/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    SSH_ASKPASS = "ssh-askpass-fullscreen";
    SUDO_ASKPASS = "/run/current-system/sw/bin/ssh-askpass-fullscreen";
  };

  # mpv
  programs.mpv = {
    enable = true;
    config = {
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      save-position-on-quit = "yes";
      sub-scale = 0.5;
    };
    bindings = {
      LEFT = "no-osd seek -5";
      RIGHT = "no-osd seek +5";
      UP = "no-osd seek +30";
      DOWN = "no-osd seek -30";
      "=" = "add volume 2";
      "-" = "add volume -2";
    };
  };

  # yazi
  programs.yazi = {
    enable = true;
    theme = lib.mkDefault {
      manager = {
        cwd = {fg = "#83a598";};
        hovered = {
          reversed = true;
          bold = true;
        };
        preview_hovered = {underline = true;};
        find_keyword = {
          fg = "#b8bb26";
          italic = true;
        };
        find_position = {
          fg = "#fe8019";
          bg = "reset";
          italic = true;
        };

        marker_copied = {
          fg = "#8ec07c";
          bg = "#8ec07c";
        };
        marker_cut = {
          fg = "#d3869b";
          bg = "#d3869b";
        };
        marker_marked = {
          fg = "#83a598";
          bg = "#83a598";
        };
        marker_selected = {
          fg = "#fbf1c7";
          bg = "#fbf1c7";
        };

        tab_active = {
          fg = "#282828";
          bg = "#a89984";
        };
        tab_inactive = {
          fg = "#a89984";
          bg = "#504945";
        };
        tab_width = 1;

        count_copied = {
          fg = "#282828";
          bg = "#8ec07c";
        };
        count_cut = {
          fg = "#282828";
          bg = "#d3869b";
        };
        count_selected = {
          fg = "#282828";
          bg = "#fbf1c7";
        };

        border_symbol = "│";
        border_style = {fg = "#665c54";};
      };

      mode = {
        normal_main = {
          fg = "#282828";
          bg = "#a89984";
          bold = true;
        };
        normal_alt = {
          fg = "#a89984";
          bg = "#504945";
        };
        select_main = {
          fg = "#282828";
          bg = "#fe8019";
          bold = true;
        };
        select_alt = {
          fg = "#a89984";
          bg = "#504945";
        };
        unset_main = {
          fg = "#282828";
          bg = "#b8bb26";
          bold = true;
        };
        unset_alt = {
          fg = "#a89984";
          bg = "#504945";
        };
      };

      status = {
        sep_left = {
          open = "\ue0be";
          close = "\ue0b8";
        };
        sep_right = {
          open = "\ue0be";
          close = "\ue0b8";
        };
        overall = {};

        progress_label = {
          fg = "#ebdbb2";
          bold = true;
        };
        progress_normal = {
          fg = "#504945";
          bg = "#3c3836";
        };
        progress_error = {
          fg = "#fb4934";
          bg = "#3c3836";
        };

        perm_type = {fg = "#504945";};
        perm_read = {fg = "#b8bb26";};
        perm_write = {fg = "#fb4934";};
        perm_exec = {fg = "#b8bb26";};
        perm_sep = {fg = "#665c54";};
      };

      pick = {
        border = {fg = "#458588";};
        active = {
          fg = "#d3869b";
          bold = true;
        };
        inactive = {};
      };

      input = {
        border = {fg = "#ebdbb2";};
        title = {};
        value = {};
        selected = {reversed = true;};
      };

      tasks = {
        border = {fg = "#504945";};
        title = {};
        hovered = {underline = true;};
      };

      which = {
        mask = {bg = "#3c3836";};
        cand = {fg = "#83a598";};
        rest = {fg = "#928374";};
        desc = {fg = "#fe8019";};
        separator = "  ";
        separator_style = {fg = "#504945";};
      };

      help = {
        on = {fg = "#83a598";};
        run = {fg = "#d3869b";};
        hovered = {
          reversed = true;
          bold = true;
        };
        footer = {
          fg = "#3c3836";
          bg = "#a89984";
        };
      };

      notify = {
        title_info = {fg = "#8ec07c";};
        title_warn = {fg = "#fbf1c7";};
        title_error = {fg = "#d3869b";};
      };

      filetype = {
        rules = [
          {
            mime = "image/*";
            fg = "#d3869b";
          }
          {
            mime = "{audio,video}/*";
            fg = "#fabd2f";
          }
          {
            mime = "application/*zip";
            fg = "#fb4934";
          }
          {
            mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
            fg = "#fb4934";
          }
          {
            mime = "application/{pdf,doc,rtf,vnd.*}";
            fg = "#689d6a";
          }
          {
            name = "*";
            fg = "#ebdbb2";
          }
          {
            name = "*/";
            fg = "#83a598";
          }
        ];
      };
    };
    keymap = {
      manager.prepend_keymap = [
        {
          run = "cd ~/Documents";
          on = ["g" "D"];
          desc = "Go to the documents directory";
        }
        {
          run = "cd ~/Documents/books";
          on = ["g" "b"];
          desc = "Go to the books directory";
        }
      ];
    };
  };

  # fzf
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  # zathura
  programs.zathura = {
    package = pkgs-unstable.zathura;
    enable = true;
    extraConfig = "include gruvbox";
  };
  home.file.".config/zathura/gruvbox".source = ./configs/zathura/gruvbox;

  # kitty
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
  };

  # startup
  xsession.enable = true;
  xsession.initExtra = "/home/seven/.dotfiles/scripts/startup.sh";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
