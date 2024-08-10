{
  config,
  pkgs,
  ...
}: {
  home.username = "pspiagicw";
  home.homeDirectory = "/home/pspiagicw";

  home.packages = with pkgs; [
    neofetch
  ];

  programs.git = {
    enable = true;
    userName = "pspiagicw";
    userEmail = "pspiagicw@gmail.com";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
