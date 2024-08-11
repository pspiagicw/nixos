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
  ];

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  programs.tmux = {
    enable = true;
  };

  programs.go = {
    enable = true;
    goPath = ".local/go";
    goBin = ".local/go/bin";
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
