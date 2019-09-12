{ pkgs ? import ./pinned-nixpkgs.nix {} }:

{
  env = pkgs.texlive.combine {
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
      pygmentex
      python
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
}
