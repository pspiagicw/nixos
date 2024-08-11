{pkgs}:
pkgs.buildGoModule rec {
  name = "groom";
  src = pkgs.fetchFromGitHub {
    owner = "pspiagicw";
    repo = "groom";
    rev = "ff74a2ad3fc27e89c77eeaaff2076393b67bd39e";
    sha256 = "29JW1yi8tcjxnv68Bg2TRllk6rujgkC6i8P72nti/I0=";
  };

  vendorHash = "sha256-r0ttcRQscZFrY69+EBFRLAlWgmKUXBFanQtX1OWvm48=";
}
