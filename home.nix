{
  config,
  pkgs,
  ...
}: {
  home.username = "pspiagicw";
  home.homeDirectory = "/home/pspiagicw";

  home.packages = with pkgs; [
    ripgrep
    tmux
    alejandra # Nix formatter
    gcc
    gopls
    universal-ctags
  ];

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

  home.stateVersion = "24.05";

  programs.neovim = {
    viAlias = true;
    vimAlias = true;
  };

  programs.home-manager.enable = true;
}
