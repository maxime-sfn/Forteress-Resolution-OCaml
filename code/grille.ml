(* 
  - Cases inutilisable : -1
  - Case vide ou un joueur peu placer un soldat : 0
  - Case vide ou un joueur peu placer un rempart : 1
  - Case où se situe un rempart placé : 2
  - Case où se situe un soldat rouge : 3
  - Case où se situe un soldat bleu : 4
  - Cases où se situe la forteresse : 5
*)

let creer_grille (lignes : int) (colonnes : int) : int array array = 
  let grille = Array.make_matrix (lignes*2 + 1) (colonnes*2 + 1) 0 in
  for i = 0 to lignes*2 do
    for j = 0 to colonnes*2 do
      if (i mod 2 = 0 || j mod 2 = 0) then grille.(i).(j) <- 1
    done;
  done;
  grille

let suprime_case_initiale (grille : int array array) (ligne : int) (colonne : int) : unit =
  grille.(ligne).(colonne) <- -1

let ajoute_rempart_initiale (grille : int array array) (ligne : int) (colonne : int) : unit = 
  grille.(ligne).(colonne) <- 1
  
let ajoute_rempart (grille : int array array) (ligne : int) (colonne : int) : unit = 
  grille.(ligne).(colonne) <- 2

let ajoute_soldat_bleu (grille : int array array) (ligne : int) (colonne : int) : unit = 
  grille.(ligne).(colonne) <- 4

let ajoute_soldat_rouge (grille : int array array) (ligne : int) (colonne : int) : unit = 
  grille.(ligne).(colonne) <- 3

let ajoute_forteresse (grille : int array array) (ligne : int * int) (colonne : int * int) : unit =
  grille.(fst ligne).(fst colonne) <- 5;
  grille.(snd ligne).(snd colonne) <- 5

let affiche_grille (grille : int array array) : unit =
  for i = 0 to Array.length grille - 1 do
    if i > 1 && i < 7 then
      print_string "  ";
    for j = 0 to Array.length grille.(i) - 1 do
      print_int (grille.(i).(j));
      print_string "  "
    done;
  print_newline ();
  done

let affiche_grille_2 (g : int array array) : unit =
  let n = ((Array.length g)-1)/2 in
  let p = ((Array.length g.(0))-1)/2 in
  let ligne = "+---" in
  
  print_string ("        ");
  for j = 1 to 2*p-3 do
    print_string (ligne);
  done;
  print_string ("+");
  print_string ("      ");
  print_newline ();
  
  print_string ("        |");
  for j = 2 to 2*p-3 do
    print_string (" ");
    print_string (string_of_int g.(0).(j));
    print_string ("  "); 
  done;
  print_string (" "); 
  print_string (string_of_int g.(0).(2*p-2)); 
  print_string (" |");
  print_newline ();
  
  let double_ligne = "+   +---" in
  print_string ("        ");
  for j = 1 to (2*p-3)/2 do
    print_string (double_ligne);
  done;
  print_string ("+   +");
  print_newline (); 
  
  print_string ("        |");
  for j = 2 to 2*p-3 do
    print_string (" ");
    print_string (string_of_int g.(1).(j));
    print_string (" |"); 
  done;
  print_string (" "); 
  print_string (string_of_int g.(1).(2*p-2)); 
  print_string (" |");
  print_newline ();
  
  print_string ("+---+---");
  for j = 0 to (2*p-3)/2-1 do
    print_string (double_ligne);
  done;
  print_string ("+   +");
  print_string ("---+---+");
  print_newline (); 

  
  for i = 2 to 2*(n-2)+1 do
    if i mod 2 = 0 then 
      begin
        print_string ("|");
        for j = 0 to 2*p-1 do
          print_string (" ");
          print_string (string_of_int g.(i).(j));
          print_string ("  "); 
        done;
        print_string (" "); 
        print_string (string_of_int g.(i).(2*p)); 
        print_string (" |");
        print_newline ();
  
        let double_ligne = "+   +---" in
        for j = 0 to (2*p)/2-1 do
          print_string (double_ligne);
        done;
        print_string ("+   +");
        print_newline (); 
      end
      
    else 
      begin
        print_string ("|");
        for j = 0 to 2*p-1 do
          print_string (" ");
          print_string (string_of_int g.(i).(j));
          print_string (" |"); 
        done;
        print_string (" "); 
        print_string (string_of_int g.(i).(2*p)); 
        print_string (" |");
        print_newline ();
  
        for j = 0 to 2*p-1 do 
          if j mod 2 = 0 then 
            print_string ("+   ")
          else 
            print_string (ligne)
        done;
        print_string ("+   +");
        print_newline ();
      end
    
  done;
  
  print_string ("|");
  for j = 0 to 2*p-1 do
    print_string (" ");
    print_string (string_of_int g.(2*(n-2)+2).(j));
    print_string ("  "); 
  done;
  print_string (" "); 
  print_string (string_of_int g.(2*(n-2)+2).(2*p)); 
  print_string (" |");
  print_newline ();
  
  print_string ("+---+---");
  for j = 0 to (2*p-3)/2-1 do
    print_string (double_ligne);
  done;
  print_string ("+   +");
  print_string ("---+---+");
  print_newline (); 
  
  print_string ("        |");
  for j = 2 to 2*p-3 do
    print_string (" ");
    print_string (string_of_int g.(2*(n-2)+3).(j));
    print_string (" |"); 
  done;
  print_string (" "); 
  print_string (string_of_int g.(2*(n-2)+3).(2*p-2)); 
  print_string (" |");
  print_newline ();
  
  let double_ligne = "+   +---" in
  print_string ("        ");
  for j = 1 to (2*p-3)/2 do
    print_string (double_ligne);
  done;
  print_string ("+   +");
  print_newline (); 
  
  print_string ("        |");
  for j = 2 to 2*p-3 do
    print_string (" ");
    print_string (string_of_int g.(2*(n-2)+4).(j));
    print_string ("  "); 
  done;
  print_string (" "); 
  print_string (string_of_int g.(2*(n-2)+4).(2*p-2)); 
  print_string (" |");
  print_newline (); 
  
  print_string ("        ");
  for j = 1 to 2*p-3 do
    print_string (ligne);
  done;
  print_string ("+");
  print_string ("      ");
  print_newline ();