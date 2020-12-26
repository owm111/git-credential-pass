{
  description = "A git credential helper for pass";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "git-credential-pass";
      overlay = final: prev: {
        git-credential-pass = {
          git-credential-pass = final.stdenv.mkDerivation {
            pname = "git-credential-pass";
            version = "0.0.1";
            src = self;
            installFlags = [ "PREFIX=$(out)" ];
          };
        };
      };
    };
}
