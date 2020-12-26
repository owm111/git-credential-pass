{
  description = "A git credential helper for pass";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "git-credential-pass";
      overlay = final: prev: {
        git-credential-pass = {
          defaultPackage = final.stdenv.mkDerivation {
            pname = "git-credential-pass";
            version = "0.1.0";
            src = self;
            installFlags = [ "PREFIX=$(out)" ];
          };
        };
      };
    };
}
