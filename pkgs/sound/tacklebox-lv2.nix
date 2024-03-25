{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "tacklebox-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "tacklebox.lv2";
    rev = "master";
    sha256 = "sha256-EuZ+Ztw80FeoV1IRw4GQm67jcerlPr+Oxjy1fgC1lPQ=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

