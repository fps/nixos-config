{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
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
