{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-faust-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-faust-plugins.lv2";
    rev = "f02c049d1687edd177418c31c70db196753b8b68";
    sha256 = "sha256-d/ZWHJ6fWioChptNlIicxuOnTJ5UtBufmj6KBMOn2/U";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

