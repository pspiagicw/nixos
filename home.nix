{
  config,
  pkgs,
  ...
}: let
  groom = import ./groom.nix {pkgs = pkgs;};
in {
  home.username = "pspiagicw";
  home.homeDirectory = "/home/pspiagicw";

  home.packages = with pkgs; [
    ripgrep
    alejandra # Nix formatter
    universal-ctags
    groom
    jetbrains-mono
  ];

  programs.gh = {
    enable = true;
  };

  fonts.fontconfig.enable = true;

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.tmux = {
    terminal = "xterm-256color";
    historyLimit = 10000;
    clock24 = false;
    baseIndex = 1;
    mouse = true;
    enable = true;
    extraConfig = ''
        set-option -g status-position top
        set-option -g focus-events on

        bind h select-pane -L
        bind k select-pane -U
        bind l select-pane -R
        bind j select-pane -D

       bind -n M-v split-window -h
       bind -n M-s split-window -v
       bind -n M-t split-window -v -l 10 -c "#{pane_current_path}"

       bind -n M-c new-window

       bind -n M-0 select-window -t 0
       bind -n M-1 select-window -t 1
       bind -n M-2 select-window -t 2
       bind -n M-3 select-window -t 3
       bind -n M-4 select-window -t 4
       bind -n M-5 select-window -t 5
       bind -n M-6 select-window -t 6
       bind -n M-7 select-window -t 7
       bind -n M-8 select-window -t 8
       bind -n M-9 select-window -t 9

      set -g status-justify absolute-centre
      set -g status-left "[#S] "
      set -g status-right ""
      set -g window-status-format "#W(#{window_index})"
      set -g window-status-current-format "*#W(#{window_index})"
      set -g window-status-separator " | "

      set -g automatic-rename on


    '';
  };

  programs.git = {
    enable = true;
    userName = "pspiagicw";
    userEmail = "pspiagicw@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      v = "nvim";
    };
    initExtra = ''

      export PS1='(\[\e[92;1;3m\]\h\[\e[0m\]) \[\e[96;1;3m\]\\$\[\e[0m\] '
      export PATH=$PATH:$HOME/.local/bin
      export DIRENV_LOG_FORMAT=
      export GOPATH=$HOME/.local/go
      export GOBIN=$HOME/.local/go/bin
    '';
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

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
