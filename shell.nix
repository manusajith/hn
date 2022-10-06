{ sources ? import ./nix/sources.nix }:
with sources;

let
  project_name = "hn";
  pkgs = import sources.nixpkgs { overlays = [ (import ./nix/elixir.nix) ]; config = { }; };
  inherit (pkgs.lib) optional optionals;
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    elixir
  ];
}
