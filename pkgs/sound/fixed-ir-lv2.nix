{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fixed-ir-lv2";
  version = "1";

  src = builtins.fetchGit {
    url = https://github.com/fps/fixed-ir.lv2;
    rev = "b05365b37f7f44476dc09255ff3be1b5bab5cce6";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake lv2 lilv libsamplerate shellcheck libsndfile];

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

