{ stdenv }:

stdenv.mkDerivation {
  pname = "git-credential-pass";
  version = "0.1.0";
  src = ./.;
  installFlags = [ "PREFIX=$(out)" ];
}
