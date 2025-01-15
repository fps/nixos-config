{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-plugins.lv2";
    rev = "d41374aeaacf07628990ca466ce4e5e74f870f49";
    sha256 = "sha256-opKzB2K9hTu+nRWcc5lRiHw0cpfcdxm1dhhlouMk2Kc=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake lv2 fftwFloat libsndfile pkg-config ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

