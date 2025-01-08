{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-faust-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-faust-plugins.lv2";
    rev = "52d94128ccb85b8251eb889a4302cdce53603c94";
    sha256 = "sha256-xsZcQks5NmjwGHhJdJlWKnTnJSPMEkfmOrwonekKDSY=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

