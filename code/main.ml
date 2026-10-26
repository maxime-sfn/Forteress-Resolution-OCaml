open Grille
open Validite_grille
open Resolution_backtracking

let main () = 
  (*let grille = construction_initiale () in*)
  let (n,p) = (4,5) in
  let grille = creer_grille n p in
  
  (*for i = 0 to 2*n do
    for j = 0 to 2*p do
      grille.(i).(j) <- i + j
    done;
  done;*)
  (*creation de la grille n°48*)
  ajoute_soldat_bleu grille 3 3;
  ajoute_soldat_bleu grille 5 1;
  ajoute_soldat_bleu grille 5 3;
  ajoute_soldat_bleu grille 5 7; (*pions bleus places*)
  ajoute_soldat_rouge grille 1 3;
  ajoute_soldat_rouge grille 1 5;
  ajoute_soldat_rouge grille 7 5;
  ajoute_soldat_rouge grille 7 7; (*pions rouges places*)
  ajoute_rempart grille 0 5;
  ajoute_rempart grille 0 6;
  ajoute_rempart grille 1 6;
  ajoute_rempart grille 2 5;
  ajoute_rempart grille 2 7;
  ajoute_rempart grille 2 8;
  ajoute_rempart grille 2 3;
  ajoute_rempart grille 3 8;
  ajoute_rempart grille 4 9;
  ajoute_rempart grille 4 10;
  ajoute_rempart grille 5 10;
  ajoute_rempart grille 3 2;
  ajoute_rempart grille 4 1;
  ajoute_rempart grille 4 0;
  ajoute_rempart grille 5 0;
  ajoute_rempart grille 6 1;
  ajoute_rempart grille 6 3;
  ajoute_rempart grille 5 4;
  ajoute_rempart grille 4 5;
  ajoute_rempart grille 5 6;
  ajoute_rempart grille 6 7;
  ajoute_rempart grille 5 8; (*remparts places*)

  (*ajoute_rempart grille 1 2; ajoute_rempart grille 0 3;*)

  affiche_grille_2 grille;
  let liste = est_solution grille in
  if (liste = []) then print_string ("GRILLE VALIDE")
  else print_string ("GRILLE NON VALIDE");
  (*let rec afficher l =
    match l with
    | [] -> ()
    | x :: xs -> print_string ("("); print_int (fst x); print_string (",");print_int(snd x); print_string(") ; "); afficher xs
  in afficher liste;*)
  print_newline ();
  print_endline "Fini!"
  
let _ = main ()