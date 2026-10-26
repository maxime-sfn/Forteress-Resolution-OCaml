(*0 : cases vides, -10 : 4 coins inutilisables, -1 : remparts, 1 : pions bleus, 2 : pions rouges*)

let creer_grille (n : int) (p : int) : int array array =
  let grille = Array.make_matrix n p 0 in
  grille.(0).(0) <- -10;
  grille.(0).(p-1) <- -10;
  grille.(n-1).(0) <- -10;
  grille.(n-1).(p-1) <- -10;
  grille

let grille_depart (t1 : (int*int) array) (t2 : (int*int) array) (remparts : (int*int) array) (grille : int array array) : unit =
  for i = 0 to (Array.length t1)-1 do
    let (x, y) = t1.(i) in
    grille.(y).(x) <- 1
  done;
  for i = 0 to (Array.length t2)-1 do
    let (x, y) = t2.(i) in
    grille.(y).(x) <- 2
  done;
  for i = 0 to (Array.length remparts)-1 do
    let (x, y) = remparts.(i) in
    grille.(y).(x) <- -1
  done;