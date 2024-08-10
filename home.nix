{
  config,
  pkgs,
  ...
}: {
  home.username = "pspiagicw";
  home.homeDirectory = "/home/pspiagicw";

  home.packages = with pkgs; [
    neofetch
    ripgrep
    tmux
    alejandra # Nix formatter
    pinentry-curses
  ];

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
    '';
  };

  programs.password-store = {
    enable = true;
    settings = {
      PASSWORD_STORE_DIR = "/home/pspiagicw/.password-store";
    };
  };
  programs.gpg.enable = true;
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
