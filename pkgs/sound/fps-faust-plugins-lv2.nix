{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-faust-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-faust-plugins.lv2";
    rev = "master";
    sha256 = "sha256-lR98NVtvLVb9mYmwp50UkdzGtkK+MQWwgECMuWpq51Y=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

