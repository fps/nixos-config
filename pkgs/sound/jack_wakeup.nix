{ lib, stdenv, pkgs, jack2 }:

stdenv.mkDerivation rec {
  pname = "jack_wakeup";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "jack_wakeup";
    rev = "5b4e8d63ea4c6fb7cc0af4f8c74ab3313a08faae";
    sha256 = "sha256-0UTPAGlQhjaR/oYB4/pSqtJYFz2LdAoAfMHYkVT8ctk=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake boost jack2 ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

