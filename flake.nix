{
  description = "A git credential helper for pass";

  outputs = { self, nixpkgs }: {
    overlay = import ./overlay.nix;
    nixosModule = { ... }: {
      nixpkgs.overlays = [ self.overlay ];
    };
    defaultPackage.x86_64-linux =
      let pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ self.overlay ];
          };
      in pkgs.git-credential-pass;
  };
}
