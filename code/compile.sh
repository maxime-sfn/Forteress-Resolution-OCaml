ocamlc -c grille.mli
ocamlc -c grille.ml

ocamlc -c validite_grille.mli
ocamlc -c validite_grille.ml

ocamlc -c resolution_backtracking.mli
ocamlc -c resolution_backtracking.ml

ocamlc -c main.mli
ocamlc -c main.ml

ocamlc -o main grille.cmo validite_grille.cmo resolution_backtracking.cmo main.cmo

echo "Compilation completed :)"