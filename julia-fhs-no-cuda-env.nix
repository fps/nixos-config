{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "julia-fhs-env";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      alsa-lib
      xdg-utils
      # cudnn_cudatoolkit_10_2
      # qt4
      libpng12
      curl
      nghttp2
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
  runScript = "bash";
}).env
