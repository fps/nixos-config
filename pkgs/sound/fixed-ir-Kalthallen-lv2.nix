{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fixed-ir-Kalthallen-lv2";
  version = "1";

  src = ./fixed-ir-Kalthallen.lv2;

  irs = builtins.fetchurl "https://shop.kalthallen.de/wp-content/uploads/2022/05/KalthallenCabsIR.rar";

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake lv2 lilv libsamplerate shellcheck libsndfile fixed-ir-lv2 unrar ];

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

