{ lib, stdenv, pkgs, ladspa-sdk }:

stdenv.mkDerivation rec {
  pname = "blop-ladspa-plugins";
  version = "1";

  src = builtins.fetchTarball {
    url = "http://prdownloads.sourceforge.net/blop/blop-0.2.8.tar.gz?download";
    sha256 = "sha256:184gkrlksxn753f4b2mq5723ig3qcqw5j7y9y72888bxzi8slw2d";
  };

  configureFlags = [ 
    "--with-ladspa-prefix=${ladspa-sdk}" 
    "--with-ladspa-plugin-dir=$out"
  ];

  buildInputs =  with pkgs; [ gnumake ladspa-sdk ladspaH ];

  meta = with lib; {
    platforms = platforms.all;
  };
}

