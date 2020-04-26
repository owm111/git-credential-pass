{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  pname = "sh-pass-git-helper";
  version = "0.0.0";
  src = ./.;
  installPhase = "install -Dvm 755 pass-git-helper $out/bin/pass-git-helper";
}
