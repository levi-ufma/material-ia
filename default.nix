{ pkgs ? import ./pinned-nixpkgs.nix {} }:

let
  gitignoreSource = import ./gitignore.nix {};

  texliveEnv = (import ./texlive.nix {}).env;

  systemDeps = with pkgs; [
	pygmentex
    python37Packages.pygments
  ];
in
pkgs.stdenv.mkDerivation rec {
  name = "ai-slides";

  src = gitignoreSource ./.;

  buildInputs = [ texliveEnv ] ++ systemDeps;

  buildPhase = ''
    mkdir $out

    latexmk -verbose -pdf \
      -pdflatex="pdflatex -interaction=nonstopmode -halt-on-error -shell-escape"\
      slide.tex
  '';

  installPhase = ''
    cp slide.pdf $out/slide.pdf
  '';
}
