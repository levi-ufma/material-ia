{ pkgs ? import ./pinned-nixpkgs.nix {} }:

let
  gitignoreSource = import ./gitignore.nix {};

  texliveEnv = pkgs.texlive.combine {
    inherit (pkgs.texlive)
      beamer
      beamertheme-metropolis
      scheme-medium
      enumitem
      ifetex
      ifxetex
      latexmk
      minted
      pgf
      textcase
      collection-basic
      collection-fontsextra
      collection-fontsrecommended
      collection-langenglish
      collection-langportuguese
      collection-latex
      collection-latexextra
      collection-mathscience
      hyphen-portuguese
      ;
  };
in
pkgs.stdenv.mkDerivation rec {
  name = "ai-slides";

  src = gitignoreSource ./.;

  buildInputs = [ texliveEnv ];

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
