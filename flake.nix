{
  description = "My neovim config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, nixpkgs, nix-dir, systems }: let
      forAllSystems = fn:
        nixpkgs.lib.genAttrs (import systems) (system: fn nixpkgs.legacyPackages.${system} system);
    in {
      packages = forAllSystems (pkgs: system: {
        default = "${./.}"
      });
    };
}
