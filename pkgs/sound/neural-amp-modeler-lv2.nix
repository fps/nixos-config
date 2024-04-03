{ lib, stdenv, pkgs, fetchgit }:

stdenv.mkDerivation rec {
  pname = "neural-amp-modeler-lv2";
  version = "0.1";

  # src = /home/fps/ogfx/mod-utilities;

  src = fetchgit {
    url = "https://github.com/mikeoliphant/neural-amp-modeler-lv2.git";
    # rev = "main";
    fetchSubmodules = true;
    rev = "0aad7c32b6806c826848b21bb1d2699eb79de29b";
    sha256 = "sha256-I30uLL0CFzdIT5OYYcogPeQ6dnmPVIJTYSHYsjMZfPE=";
  };

  makeFlags = [ "PREFIX=$(out)" ];

  doCheck = false;

  buildInputs =  with pkgs; [ pkg-config lv2 cmake ]; 
  # propagatedBuildInputs = with pkgs; [ lilv lv2 serd sord sratom];

  installPhase = ''
    mkdir -p "$out"/lib/lv2
    cp -r neural_amp_modeler.lv2 "$out"/lib/lv2
  '';

  meta = with lib; {
    description = "";
    longDescription = ''
    '';
    homepage = "https://github.com/ogfx/ogfx-tools";
    license = licenses.gpl3Plus;
    # maintainers = [ maintainers.eelco ];
    platforms = platforms.all;
  };

  prefix = placeholder "out";
}
