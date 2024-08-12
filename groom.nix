{pkgs}:
pkgs.buildGoModule rec {
  name = "groom";
  src = pkgs.fetchFromGitHub {
    owner = "pspiagicw";
    repo = "groom";
    rev = "3fd54797db3a614cbc3fa43f3e29a152aa01ffde";
    sha256 = "O37ciBvtbuZX3KNVSg7ZG02o+b0PCQ2K8hJoyo2hPsY=";
  };

  vendorHash = "sha256-r0ttcRQscZFrY69+EBFRLAlWgmKUXBFanQtX1OWvm48=";
}
