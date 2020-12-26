{
  description = "A git credential helper for pass";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = { self, nixpkgs }:
    let
      overlay = final: prev: {
        gitAndTools = prev.gitAndTools // {
          git-credential-pass = final.stdenv.mkDerivation {
            pname = "git-credential-pass";
            version = "0.0.1";
            src = self;
            installFlags = [ "PREFIX=$(out)" ];
          };
        }; 
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlay ];
      };

      pkg = pkgs.gitAndTools.git-credential-pass;
    in {
      inherit overlay;
      packages.x86_64-linux.git-credential-pass = pkg;
      defaultPackage.x86_64-linux = pkg;
    };
}
