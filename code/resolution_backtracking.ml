open Grille

let construction_initiale () : int array array =
  let grille = creer_grille 4 5 in 
    suprime_case_initiale grille 0 0;
    suprime_case_initiale grille 0 1;
    suprime_case_initiale grille 1 0;
    suprime_case_initiale grille 1 1;

    suprime_case_initiale grille 7 0;
    suprime_case_initiale grille 7 1;
    suprime_case_initiale grille 8 0;
    suprime_case_initiale grille 8 1;

    suprime_case_initiale grille 0 9;
    suprime_case_initiale grille 1 9;
    suprime_case_initiale grille 0 10;
    suprime_case_initiale grille 1 10;

    suprime_case_initiale grille 7 9;
    suprime_case_initiale grille 8 9;
    suprime_case_initiale grille 7 10;
    suprime_case_initiale grille 8 10;

    for i = 2 to 6 do 
      for j = 0 to 10 do 
        if i mod 2 = 0 then
          ajoute_rempart_initiale grille i j;
        if j mod 2 = 0 then
          ajoute_rempart_initiale grille i j
      done;
    done;

    for i = 0 to 8 do
      for j = 2 to 8 do
        if i = 0 || i = 8 then
          ajoute_rempart_initiale grille i j;
        if (i = 1 || i = 7) && j mod 2 = 0 then
          ajoute_rempart_initiale grille i j
      done;
    done;

    ajoute_soldat_bleu grille 1 5;
    ajoute_soldat_bleu grille 7 7;

    ajoute_soldat_rouge grille 1 3;
    ajoute_soldat_rouge grille 1 7;
    ajoute_soldat_rouge grille 5 9;

    ajoute_forteresse grille (5,7) (5,5);

  affiche_grille_2 grille;
  grille

(* let est_valide (construction : int array array) : bool = *) 