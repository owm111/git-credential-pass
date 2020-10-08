{
  description = "A git credential helper as a pass extension";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";

  outputs = { self, nixpkgs }:
    let
      overlay = final: prev: {
        pass = prev.pass.overrideAttrs (old: {
          passthru = old.passthru //
            (let
              newExtensions = old.passthru.extensions // {
                pass-git-helper = final.stdenv.mkDerivation {
                  name = "pass-extension-git-helper";
                  src = self;
                  installFlags = [ "PREFIX=$(out)" ];
                };
              };
              newWith = func:
                old.passthru.withExtensions (p: func newExtensions);
            in {
              extensions = newExtensions;
              withExtensions = newWith;
            });
        });
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlay ];
      };

      pkg = pkgs.pass.extensions.pass-git-helper;
    in {
      inherit overlay;
      packages.x86_64-linux.pass-extension-git-helper = pkg;
      defaultPackage.x86_64-linux = pkg;
    };
}
