{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs =
    { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      devShells.x86_64-linux.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          (python313.withPackages (
            ps: with ps; [
              numpy
              seaborn
	      scipy
	      matplotlib
              jupyterlab
              scikit-learn
              notebook
              networkx
              ipykernel
              nbconvert # Converting notebooks into other formats
              #nbdime # Managing large diffs with notebooks
              pandoc
              #texliveTeTeX
              sympy
              graphviz
              pandas
            ]
          ))
        ];
      };
    };
}

