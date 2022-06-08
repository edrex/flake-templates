{
  description = "My flake templates for starting new projects";

  outputs = { self, nixpkgs }: {

      templates = {
        python = {
          # First run `nix run "nixpkgs#poetry" new` to prepare directory!
          path = ./python;
          description = "A Python project flake with current best practices."; 
        };
      };

  };
}
