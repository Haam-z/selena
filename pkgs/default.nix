{ pkgs ? import <nixpkgs> { } }: {
  haamfonts = pkgs.callPackage ./haam-fonts { };
}
