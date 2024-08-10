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


      export PS1='\[\e[92;1m\]\\$\[\e[0m\] '
    '';
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
