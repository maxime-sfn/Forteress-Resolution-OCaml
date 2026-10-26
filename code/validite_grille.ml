open Grille

(*il est plus simple de savoir si un pion est enferme lorsqu'il se situe sur l'une des cases du bors de la grille, ces pions seront donc "les cas de base"*)
(*pion appartient à [|0;lignes-1|]x[|0; colonnes-1|] avec les parametres "lignes" et "colonnes" dans la fonction creer_grille*)


(* -----------------------  1re idee (qui ne marche finalement pas) :  ----------------------- *)

(* let rec remplir_cases_a_l_ext (cases_a_l_ext : int array array) (pion : (int*int)) (g : int array array) : unit =
  if (g.(fst pion).(snd pion) = 0) then 
    let n = ((Array.length g)-1)/2 in
    let p = ((Array.length g)-1)/2 in
    match pion with 
    (* BORD HAUT : *)
    | (0,1) -> 
        if g.(1).(2) = 1 || g.(0).(3) = 1 then cases_a_l_ext.(0).(1) <- 1
        else 
          begin
            let (bas, droite) = (ref false, ref false) in
            if (g.(2).(3) = 1) then 
              begin
                g.(2).(3) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (1,1) g;
                if (cases_a_l_ext.(1).(1) = 1) then bas := true;
              end;
            if (g.(1).(4) = 1) then
              begin
                g.(1).(4) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (0,2) g;
                if (cases_a_l_ext.(0).(2) = 1) then droite := true;
              end;
            if (!bas || !droite) then cases_a_l_ext.(0).(1) <- 1
            else cases_a_l_ext.(0).(1) <- -1
          end
    | (0,b) when b = p-2 -> 
        if (g.(1).(2*p-2) = 1 || g.(0).(2*p-3) = 1) then cases_a_l_ext.(0).(p-2) <- 1
        else 
          begin
            let (bas, gauche) = (ref false, ref false) in
            if (g.(2).(2*p-3) = 1) then 
              begin
                g.(2).(2*p-3) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (1,p-2) g;
                if (cases_a_l_ext.(1).(p-2) = 1) then bas := true;
              end;
            if (g.(1).(2*p-4) = 1) then 
              begin
                g.(1).(2*p-4) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (0, p-3) g;
                if (cases_a_l_ext.(0).(p-3) = 1) then gauche := true; 
              end;
            if (!bas || !gauche) then cases_a_l_ext.(0).(p-2) <- 1
            else cases_a_l_ext.(0).(p-2) <- -1
          end
    | (0,b) -> 
        if (g.(0).(2*b+1) = 1) then cases_a_l_ext.(0).(b) <- 1
        else 
          begin
            let (bas, gauche, droite) = (ref false, ref false, ref false) in
            if (g.(2).(2*b+1) = 1) then
              begin
                g.(2).(2*b+1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (1,b) g;
                if (cases_a_l_ext.(1).(b) = 1) then bas := true;
              end;
            if (g.(1).(2*b) = 1) then 
              begin
                g.(1).(2*b) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (0, b-1) g;
                if (cases_a_l_ext.(0).(b-1) = 1) then gauche := true;
              end;
            if (g.(1).(2*b+2) = 1) then
              begin
                g.(1).(2*b+2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (0, b+1) g;
                if (cases_a_l_ext.(0).(b+1) = 1) then droite := true;
              end;
            if (!bas || !gauche || !droite) then cases_a_l_ext.(0).(b) <- 1
            else cases_a_l_ext.(0).(b) <- -1
          end 
    (* BORD BAS : *)
    | (a,1) when a = n-1 -> 
        if (g.(2*n-1).(2) = 1 || g.(2*n).(3) = 1) then cases_a_l_ext.(n-1).(1) <- 1
        else 
          begin
            let (haut, droite) = (ref false, ref false) in
            if (g.(2*n-2).(3) = 1) then 
              begin 
                g.(2*n-2).(3) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-2,1) g;
                if (cases_a_l_ext.(n-2).(1) = 1) then haut := true;
              end;
            if (g.(2*n-1).(4) = 1) then 
              begin
                g.(2*n-1).(4) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-1,2) g;
                if (cases_a_l_ext.(n-1).(2) = 1) then droite := true;
              end;
            if (!haut || !droite) then cases_a_l_ext.(n-1).(1) <- 1
            else cases_a_l_ext.(n-1).(1) <- -1
          end
    | (a,b) when (a,b) = (n-1,p-2) -> 
        if (g.(2*n-1).(2*p-2) = 1 || g.(2*n).(2*p-3) = 1) then cases_a_l_ext.(n-1).(p-2) <- 1
        else 
          begin
            let (haut, gauche) = (ref false, ref false) in
            if (g.(2*n-2).(2*p-3) = 1) then 
              begin
                g.(2*n-2).(2*p-3) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-2,p-2) g;
                if (cases_a_l_ext.(n-2).(p-2) = 1) then haut := true;
              end;
            if (g.(2*n-1).(2*p-4) = 1) then
              begin
                g.(2*n-1).(2*p-4) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-1, p-3) g;
                if (cases_a_l_ext.(n-1).(p-3) = 1) then gauche := true;
              end;
            if (!haut || !gauche) then cases_a_l_ext.(n-1).(p-2) <- 1
            else cases_a_l_ext.(n-1).(p-2) <- -1
          end
    | (a,b) when a = n-1 ->
        if (g.(2*n).(2*b+1) = 1) then cases_a_l_ext.(n-1).(b) <- 1
        else 
          begin
            let (haut, gauche, droite) = (ref false, ref false, ref false) in
            if (g.(2*n-2).(2*b+1) = 1) then 
              begin
                g.(2*n-2).(2*b+1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-2, b) g;
                if (cases_a_l_ext.(n-2).(b) = 1) then haut := true;
              end;
            if (g.(2*n-1).(2*b) = 1) then 
              begin
                g.(2*n-1).(2*b) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-1, b-1) g;
                if (cases_a_l_ext.(n-1).(b-1) = 1) then gauche := true;
              end;
            if (g.(2*n-1).(2*b+2) = 1) then 
              begin
                g.(2*n-1).(2*b+2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-1, b+1) g;
                if (cases_a_l_ext.(n-1).(b+1) = 1) then droite := true;
              end;
            if (!haut || !gauche || !droite) then cases_a_l_ext.(n-1).(b) <- 1
            else cases_a_l_ext.(n-1).(b) <- -1
          end
    (* BORD GAUCHE : *)
    | (1,0) ->
        if (g.(2).(1) = 1 || g.(3).(0) = 1) then cases_a_l_ext.(1).(0) <- 1
        else 
          begin
            let (droite, bas) = (ref false, ref false) in
            if (g.(3).(2) = 1) then 
              begin
                g.(3).(2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (1, 1) g;
                if (cases_a_l_ext.(1).(1) = 1) then droite := true;
              end;
            if (g.(4).(1) = 1) then 
              begin
                g.(4).(1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (2, 0) g;
                if (cases_a_l_ext.(2).(0) = 1) then bas := true;
              end;
            if (!droite || !bas) then cases_a_l_ext.(1).(0) <- 1
            else cases_a_l_ext.(1).(0) <- -1
          end
    | (a,0) when a = n-2 ->
        if (g.(2*n-2).(1) = 1 || g.(2*n-3).(0) = 1) then cases_a_l_ext.(n-2).(0) <- 1
        else 
          begin
            let (droite, haut) = (ref false, ref false) in
            if (g.(2*n-3).(2) = 1) then 
              begin
                g.(2*n-3).(2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-2, 1) g;
                if (cases_a_l_ext.(n-2).(1) = 1) then droite := true;
              end;
            if (g.(2*n-4).(1) = 1) then
              begin
                g.(2*n-4).(1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-3, 0) g;
                if (cases_a_l_ext.(n-3).(0) = 1) then haut := true;
              end;
            if (!droite || !haut) then cases_a_l_ext.(n-2).(0) <- 1
            else cases_a_l_ext.(n-2).(0) <- -1
          end
    | (a,0) ->
        if (g.(2*a+1).(0) = 1) then cases_a_l_ext.(a).(0) <- 1
        else 
          begin
            let (droite, haut, bas) = (ref false, ref false, ref false) in
            if (g.(2*a+1).(2) = 1) then 
              begin
                g.(2*a+1).(2) <- 2; 
                remplir_cases_a_l_ext cases_a_l_ext (a, 1) g;
                if (cases_a_l_ext.(a).(1) = 1) then droite := true;
              end;
            if (g.(2*a).(1) = 1) then 
              begin
                g.(2*a).(1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (a-1, 0) g;
                if (cases_a_l_ext.(a-1).(0) = 1) then haut := true;
              end;
            if (g.(2*a+2).(1) = 1) then
              begin
                g.(2*a+2).(1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (a+1, 0) g;
                if (cases_a_l_ext.(a+1).(0) = 1) then bas := true;
              end;
            if (!droite || !haut || !bas) then cases_a_l_ext.(a).(0) <- 1
            else cases_a_l_ext.(a).(0) <- -1
          end
    (* BORD DROITE : *)
    | (1,b) when b = p-1 -> 
        if (g.(2).(2*p-1) = 1 || g.(3).(2*p) = 1) then cases_a_l_ext.(1).(p-1) <- 1
        else 
          begin
            let (gauche, bas) = (ref false, ref false) in
            if (g.(3).(2*p-2) = 1) then
              begin
                g.(3).(2*p-2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (1, p-2) g; 
                if (cases_a_l_ext.(1).(p-2) = 1) then gauche := true;
              end;
            if (g.(4).(2*p-1) = 1) then 
              begin
                g.(4).(2*p-1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (2, p-1) g;
                if (cases_a_l_ext.(2).(p-1) = 1) then bas := true;
              end;
            if (!gauche || !bas) then cases_a_l_ext.(1).(p-1) <- 1
            else cases_a_l_ext.(1).(p-1) <- -1
          end
    | (a,b) when (a,b) = (n-2,p-1) ->
        if (g.(2*n-2).(2*p-1) = 1 || g.(2*n-3).(2*p) = 1) then cases_a_l_ext.(n-2).(p-1) <- 1
        else 
          begin
            let (gauche, haut) = (ref false, ref false) in
            if ( g.(2*n-3).(2*p-2) = 1) then 
              begin
                g.(2*n-3).(2*p-2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-2, p-2) g;
                if (cases_a_l_ext.(n-2).(p-2) = 1) then gauche := true;
              end;
            if (g.(2*n-4).(2*p-1) = 1) then
              begin 
                g.(2*n-4).(2*p-1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (n-3, p-1) g;
                if (cases_a_l_ext.(n-3).(p-1) = 1) then haut := true;
              end;
            if (!gauche || !haut) then cases_a_l_ext.(n-2).(p-1) <- 1
            else cases_a_l_ext.(n-2).(p-1) <- -1
          end
    | (a,b) when b = p-1 ->
        if (g.(2*a+1).(2*p) = 1) then cases_a_l_ext.(a).(p-1) <- 1
        else 
          begin
            let (gauche, haut, bas) = (ref false, ref false, ref false) in
            if (g.(2*a+1).(2*p-2) = 1) then
              begin
                g.(2*a+1).(2*p-2) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (a, p-2) g;
                if (cases_a_l_ext.(a).(p-2) = 1) then gauche := true;
              end;
            if (g.(2*a).(2*p-1) = 1) then 
              begin
                g.(2*a).(2*p-1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (a-1, p-1) g;
                if (cases_a_l_ext.(a-1).(p-1) = 1) then haut := true;
              end;
            if (g.(2*a+2).(2*p-1) = 1) then
              begin 
                g.(2*a+2).(2*p-1) <- 2;
                remplir_cases_a_l_ext cases_a_l_ext (a+1, p-1) g;
                if (cases_a_l_ext.(a+1).(p-1) = 1) then bas := true;
              end;
            if (!gauche || !haut || !bas) then cases_a_l_ext.(a).(p-1) <- 1
            else cases_a_l_ext.(a).(p-1) <- -1
          end
    (* DANS LE MILIEU : *)
    | (a,b) -> 
        let (haut, bas, gauche, droite) = (ref false, ref false, ref false, ref false) in
        if (g.(2*a).(2*b+1) = 1) then 
          begin
            g.(2*a).(2*b+1) <- 2;
            remplir_cases_a_l_ext cases_a_l_ext (a-1, b) g;
            if (cases_a_l_ext.(a-1).(b) = 1) then haut := true; 
          end;
        if (g.(2*a+2).(2*b+1) = 1) then 
          begin
            g.(2*a+2).(2*b+1) <- 2;
            remplir_cases_a_l_ext cases_a_l_ext (a+1, b) g;
            if (cases_a_l_ext.(a+1).(b) = 1) then bas := true; 
          end;
        if (g.(2*a+1).(2*p) = 1) then 
          begin
            g.(2*a+1).(2*p) <- 2;
            remplir_cases_a_l_ext cases_a_l_ext (a, b-1) g;
            if (cases_a_l_ext.(a).(b-1) = 1) then gauche := true; 
          end;
        if (g.(2*a+1).(2*p+2) = 1) then 
          begin
            g.(2*a+1).(2*p+2) <- 2;
            remplir_cases_a_l_ext cases_a_l_ext (a, b+1) g;
            if (cases_a_l_ext.(a).(b+1) = 1) then droite := true; 
          end;
        if (!haut || !bas || !gauche || !droite) then cases_a_l_ext.(a).(b) <- 1
        else cases_a_l_ext.(a).(b) <- -1
  else ()


let hd l = 
  match l with
  | [] -> failwith "erreur : liste vide"
  | x :: xs -> x

  
let tl l = 
  match l with
  | [] -> failwith "erreur : liste vide"
  | x :: xs -> xs



let est_solution (g : int array array) : bool =
  let n = ((Array.length g)-1)/2 in
  let p = ((Array.length g)-1)/2 in

  let pions_a_traiter = ref [] in
  for i = 0 to n-1 do
    for j = 0 to p-1 do
      if (g.(2*i+1).(2*j+1) = 3 || g.(2*i+1).(2*j+1) = 4) then
        pions_a_traiter := (2*i+1,2*j+1,g.(2*i+1).(2*j+1)) :: !pions_a_traiter;
    done;
  done; (*stocke un triplet (ligne,colonne,couleur) de chaque chevalier present sur la grille*)

  let cases_sans_rempart = ref [] in
  for i = 0 to n do
    for j = 0 to p do
      if (g.(2*i).(2*j) = 1) then 
        cases_sans_rempart := (2*i,2*j) :: !cases_sans_rempart
    done;
  done; (*pour enlever par la suite les remparts que l'on va rajouter*)

  let cases_a_l_ext = Array.make_matrix n p 0 in
  (*dans cases_a_l_ext, une case d'indice (i,j) vaut : 1 si la case est a l'ext, -1 sinon, 0 si elle n'a pas encore ete traitee*)
  let b = ref true in
  
  while (!pions_a_traiter <> []) do
    let (i,j,c) = hd !pions_a_traiter in
    remplir_cases_a_l_ext cases_a_l_ext (i,j) g;
    if ((c = 3 && cases_a_l_ext.(i).(j) = -1) || (c = 4 && cases_a_l_ext.(i).(j) = 1)) then b := false;
    pions_a_traiter := tl !pions_a_traiter
  done;
    
  while (!cases_sans_rempart <> []) do
    let (k,l) = hd !cases_sans_rempart in
    g.(k).(l) <- 1;
    cases_sans_rempart := tl !cases_sans_rempart
  done; 
  !b *)

(*let rec taille l = 
  match l with
  | [] -> 0
  | x :: xs -> 1 + (taille xs)

let rec afficher l =
  match l with
  | [] -> ()
  | x :: xs -> print_string ("("); print_int (fst x); print_string (",");print_int(snd x); print_string(") ; "); afficher xs*)


  let rec remplir_voisins (cases_a_l_ext : bool array array) (pion : (int*int)) (g : int array array) : unit =
    let n = ((Array.length g)-1)/2 in
    let p = ((Array.length g.(0))-1)/2 in
    let (i,j) = pion in
    if (i <> 0 && g.(2*i).(2*j+1) = 1 && cases_a_l_ext.(i-1).(j) = false) then 
      begin
        cases_a_l_ext.(i-1).(j) <- true;
        remplir_voisins cases_a_l_ext (i-1,j) g
      end;
    if (i <> n-1 && g.(2*i+2).(2*j+1) = 1 && cases_a_l_ext.(i+1).(j) = false) then 
      begin
        cases_a_l_ext.(i+1).(j) <- true;
        remplir_voisins cases_a_l_ext (i+1,j) g
      end;
    if (j <> 0 && g.(2*i+1).(2*j) = 1 && cases_a_l_ext.(i).(j-1) = false) then 
      begin
        cases_a_l_ext.(i).(j-1) <- true;
        remplir_voisins cases_a_l_ext (i,j-1) g
      end;
    if (j <> p-1 && g.(2*i+1).(2*j+2) = 1 && cases_a_l_ext.(i).(j+1) = false) then 
      begin
        cases_a_l_ext.(i).(j+1) <- true;
        remplir_voisins cases_a_l_ext (i,j+1) g
      end
    else ()
  
  
  
  let est_solution (g : int array array) : (int*int) list =
    let n = ((Array.length g)-1)/2 in
    let p = ((Array.length g.(0))-1)/2 in
    (*print_string ("(n,p) = ("); print_int (n); print_string (","); print_int (p); print_string (")"); print_newline();*)
    let cases_a_l_ext = Array.make_matrix n p false in
    let cases_a_utiliser_bord = ref [] in
    for i = 1 to n-2 do
      cases_a_utiliser_bord := (i,0) :: !cases_a_utiliser_bord;
      cases_a_utiliser_bord := (i,p-1) :: !cases_a_utiliser_bord;
    done;
    for j = 1 to p-2 do
      cases_a_utiliser_bord := (0,j) :: !cases_a_utiliser_bord;
      cases_a_utiliser_bord := (n-1,j) :: !cases_a_utiliser_bord;
    done;
    let pions_a_traiter = ref [] in
    for i = 0 to n-1 do
      for j = 0 to p-1 do
        if (g.(2*i+1).(2*j+1) = 3 || g.(2*i+1).(2*j+1) = 4) then
          pions_a_traiter := (i,j,g.(2*i+1).(2*j+1)) :: !pions_a_traiter;
      done;
    done; (*stocke un triplet (ligne,colonne,couleur) de chaque chevalier present sur la grille*)
    let mauvais_pions = ref [] in (*stocke les couples (i,j) pour lesquels le pion (i,j) est mal place par rapport aux remparts*)
    (*let taille_1 = taille !cases_a_utiliser_bord in
    print_string ("TAILLE (cases_a_utiliser_bord) AU DEBUT : ");
    print_int (taille_1);
    print_newline ();
    afficher (!cases_a_utiliser_bord);
    print_newline ();*)
    while (!cases_a_utiliser_bord <> []) do
      let (i,j) = List.hd (!cases_a_utiliser_bord) in
      if (cases_a_l_ext.(i).(j) = false) then
        begin
          (*print_string ("TAILLE (cases_a_utiliser_bord) = ");
          let taille = taille !cases_a_utiliser_bord in
          print_int (taille);
          print_string (" --- (i,j) = ("); print_int (i); print_string (","); print_int (j); print_string (")");*)
          match (i,j) with
          | (0,1) when (g.(1).(2) = 1 || g.(0).(3) = 1) -> 
              cases_a_l_ext.(0).(1) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (0,b) when b = p-2 && (g.(1).(2*p-2) = 1 || g.(0).(2*p-3) = 1) -> 
              cases_a_l_ext.(0).(p-2) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (0,b) when (g.(0).(2*b+1) = 1) -> 
              cases_a_l_ext.(0).(b) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,1) when a = n-1 && (g.(2*n-1).(2) = 1 || g.(2*n).(3) = 1) -> 
              cases_a_l_ext.(n-1).(1) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,b) when (a,b) = (n-1,p-2) && (g.(2*n-1).(2*p-2) = 1 || g.(2*n).(2*p-3) = 1) -> 
              cases_a_l_ext.(n-1).(p-2) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,b) when a = n-1 && (g.(2*n).(2*b+1) = 1) -> 
              cases_a_l_ext.(n-1).(b) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (1,0) when (g.(2).(1) = 1 || g.(3).(0) = 1) -> 
              cases_a_l_ext.(1).(0) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,0) when a = n-2 && (g.(2*n-2).(1) = 1 || g.(2*n-3).(0) = 1) -> 
              cases_a_l_ext.(n-2).(0) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,0) when (g.(2*a+1).(0) = 1) ->
              cases_a_l_ext.(a).(0) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (1,b) when b = p-1 && (g.(2).(2*p-1) = 1 || g.(3).(2*p) = 1) -> 
              cases_a_l_ext.(1).(p-1) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,b) when (a,b) = (n-2,p-1) && (g.(2*n-2).(2*p-1) = 1 || g.(2*n-3).(2*p) = 1) -> 
              cases_a_l_ext.(n-2).(p-1) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | (a,b) when b = p-1 && (g.(2*a+1).(2*p) = 1) -> 
              cases_a_l_ext.(a).(p-1) <- true;
              remplir_voisins cases_a_l_ext (i,j) g
          | _ -> () (*print_string(" --- aucun cas"); print_newline()*) (*fin du 'if...then match with...'*)
        end;
      cases_a_utiliser_bord := List.tl (!cases_a_utiliser_bord)
    done; (*normalement : "cases_a_l_ext.(i).(j) = true" <=> "la case d'indice (i,j) est à l'ext des remparts"*)
    (*print_string ("TEST FIN DU 1er WHILE");
    print_newline ();
    let taille_2 = taille !pions_a_traiter in
    print_string ("TAILLE (pions_a_traiter) = ");
    print_int (taille_2);
    print_newline ();*)
    while (!pions_a_traiter <> []) do
      let (i,j,c) = List.hd (!pions_a_traiter) in
      if ((c = 3 && cases_a_l_ext.(i).(j) = false) || (c = 4 && cases_a_l_ext.(i).(j) = true)) then 
        mauvais_pions := (i,j) :: !mauvais_pions;
      pions_a_traiter := List.tl (!pions_a_traiter)
    done;
    (*print_string ("TEST FIN DU 2nd WHILE");
    print_newline ();
    let taille_3 = taille !mauvais_pions in
    print_string ("TAILLE (mauvais_pions) = ");
    print_int(taille_3);
    print_newline ();
    afficher (!mauvais_pions);
    print_newline ();*)
    !mauvais_pions (*si la liste est vide, c'est que la grille est correcte, sinon non*)
  