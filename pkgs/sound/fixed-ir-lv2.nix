{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fixed-ir-lv2";
  version = "1";

  src = builtins.fetchGit {
    url = https://github.com/fps/fixed-ir.lv2;
    ref = "master";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake lv2 lilv libsamplerate shellcheck libsndfile];

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

