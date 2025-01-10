{ lib, stdenv, pkgs, fetchgit }:

stdenv.mkDerivation rec {
  pname = "neural-amp-modeler-lv2";
  version = "0.1";

  # src = /home/fps/ogfx/mod-utilities;

  src = fetchgit {
    url = "https://github.com/mikeoliphant/neural-amp-modeler-lv2.git";
    # rev = "main";
    fetchSubmodules = true;
    rev = "c4733d53bc25e939762e0b3472b370e480adb17c";
    sha256 = "sha256-05rZOLf7KkY6RwvnL6u0F1Hu+6X8b5N+dxqre6OWsuU=";
  };

  makeFlags = [ "PREFIX=$(out)" ];

  doCheck = false;

  buildInputs =  with pkgs; [ pkg-config lv2 cmake ]; 
  # propagatedBuildInputs = with pkgs; [ lilv lv2 serd sord sratom];

  # cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" "-DUSE_NATIVE_ARCH=ON" ];
  cmakeFlags = [ "-DCMAKE_BUILD_TYPE=Release" ];

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
