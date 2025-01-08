{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-faust-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-faust-plugins.lv2";
    rev = "555d01a4095641fc4654237d167cbe48d1ff3fdd";
    sha256 = "sha256-BOSYJq1DaSGXpyy4j581CyilpGAsuh3I1zUpx86fF8Y=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

