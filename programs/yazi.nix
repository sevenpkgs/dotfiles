{
  config,
  pkgs,
  lib,
  ...
}: {
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
}
