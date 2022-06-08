{
  description = "Template Python project flake";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        projectDir = ./.;

      in
      {
        apps.default = pkgs.poetry2nix.mkPoetryApplication {
          inherit projectDir;
        };
        devShells = {
          default = pkgs.mkShell {
            buildInputs = [ 
              (pkgs.poetry2nix.mkPoetryEnv {
                inherit projectDir;
              })
              pkgs.poetry
            ];
          };
        };
      });
}
