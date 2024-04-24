{ lib, stdenv, pkgs, fetchgit }:

stdenv.mkDerivation rec {
  pname = "aida-x-lv2";
  version = "0.1";

  src = fetchgit {
    url = "https://github.com/AidaDSP/AIDA-X.git";
    # rev = "main";
    # fetchSubmodules = true;
    rev = "1.1.0";
    sha256 = "sha256-qBoUojQDp7a5MrdIvbXmhcTuYIRPNwAaQ/ascTZ7NRI";
  };

  makeFlags = [ "PREFIX=$(out)" ];

  doCheck = false;

  buildInputs =  with pkgs; [ pkg-config lv2 cmake libGLU xorg.libX11 python3 ]; 
  # propagatedBuildInputs = with pkgs; [ lilv lv2 serd sord sratom];

  patchPhase = ''
    patchShebangs --build modules/dpf/utils/res2c.py
  '';

  installPhase = ''
    mkdir -p "$out"/lib/lv2
    cp -r ./bin/AIDA-X.lv2 "$out"/lib/lv2
    mkdir -p "$out"/bin
    cp bin/AIDA-X "$out"/bin
 '';

  meta = with lib; {
    platforms = platforms.all;
  };

  prefix = placeholder "out";
}
