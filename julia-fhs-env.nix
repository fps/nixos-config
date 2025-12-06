{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "julia-fhs-env";
  targetPkgs = pkgs: (with pkgs;
    [ udev
      curl
      nghttp2
      alsa-lib
      xdg-utils
      # cudaPackages.cudnn
      # qt5Full
      firefox
    ]) ++ (with pkgs.xorg;
    [ libX11
      libXcursor
      libXrandr
    ]);
  runScript = "bash";
}).env
