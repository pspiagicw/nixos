{pkgs}:
pkgs.buildGoModule rec {
  name = "groom";
  src = pkgs.fetchFromGitHub {
    owner = "pspiagicw";
    repo = "groom";
    rev = "3fd54797db3a614cbc3fa43f3e29a152aa01ffde";
    sha256 = "29JW1yi8tcjxnv68Bg2TRllk6rujgkC6i8P72nti/I0=";
  };

  vendorHash = "sha256-r0ttcRQscZFrY69+EBFRLAlWgmKUXBFanQtX1OWvm48=";
}
