{ lib, stdenv, pkgs }:

stdenv.mkDerivation rec {
  pname = "fps-faust-plugins-lv2";
  version = "1";

  src = pkgs.fetchFromGitHub {
    owner = "fps";
    repo = "fps-faust-plugins.lv2";
    rev = "a23357cde10582bb2738a0c7448e77d88b0aba89";
    sha256 = "sha256-1OXjGrZ2HmMEuz1liT5vj6AxOt5Xmy8Rk1RXFR+uGDo=";
  };

  doCheck = false;

  buildInputs =  with pkgs; [ gnumake faust faust2lv2 which ];

  dontWrapQtApps = true;

  meta = with lib; {
    platforms = platforms.all;
  };

  PREFIX = placeholder "out";
}

