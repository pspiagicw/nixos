{
  config,
  pkgs,
  ...
}: {
  home.username = "pratham";
  home.homeDirectory = "/home/pratham";

  home.packages = with pkgs; [
    alejandra
    google-chrome
    pika-backup
    gnome.nautilus
    gnome.gnome-tweaks
    mpc-cli
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      PS1=' \[\e[92m\]\\$\[\e[0m\] '
    '';
  };

  xdg.userDirs.createDirectories = false;

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
      };
      "org/gnome/desktop/wm/keybindings" = {
        minimize = [];
        switch-applications = [];
        switch-applications-backwards = [];
        close = ["<Shift><Super>c"];
        toggle-maximized = ["<Super>t"];
        toggle-fullscreen = ["<Shift><Super>t"];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        switch-windows = ["<Alt><Tab>"];
        switch-windows-backward = ["<Shift><Alt><Tab>"];
      };
      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
      };
      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 4;
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        volume-up = ["<Ctrl><Alt>k"];
        volume-down = ["<Ctrl><Alt>j"];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "Open WezTerm";
        command = "wezterm";
        binding = "<Super>Return";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "MPC Toggle";
        command = "mpc toggle";
        binding = "<Ctrl><Alt>m";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        name = "MPC Next";
        command = "mpc next";
        binding = "<Ctrl><Alt>n";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        name = "MPC Prev";
        command = "mpc prev";
        binding = "<Ctrl><Alt>p";
      };
    };
  };

  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")

      local config = {}

      if wezterm.config_builder then config = wezterm.config_builder() end

      config.color_scheme = "tokyonight_night"

      config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

      config.font_size = 11

      config.enable_tab_bar = false

      return config
    '';
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = ".password-store";
    };
  };

  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/pratham/Music";
    extraConfig = ''
      audio_output {
      	type "pipewire"
      name "Pipewire Output"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    bindings = [
      {
        key = "j";
        command = "scroll_down";
      }
      {
        key = "k";
        command = "scroll_up";
      }
      {
        key = "n";
        command = "next_found_item";
      }
      {
        key = "N";
        command = "previous_found_item";
      }
      {
        key = "g";
        command = "move_home";
      }
      {
        key = "G";
        command = "move_end";
      }
      {
        key = "h";
        command = "previous_column";
      }
      {
        key = "l";
        command = "next_column";
      }
    ];
    settings = {
      header_visibility = "no";
      browser_display_mode = "classic";
      display_bitrate = "yes";
      progressbar_look = "━━━";
      message_delay_time = 1;
      user_interface = "alternative";
      regular_expressions = "extended";
    };
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
