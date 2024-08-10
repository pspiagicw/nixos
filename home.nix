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
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
