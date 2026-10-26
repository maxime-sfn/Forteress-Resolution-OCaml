# Fortress Puzzle Solver — OCaml

## Overview

This project investigates the computational resolution of **Forteress**, a logic puzzle, through algorithmic problem-solving and graphical visualization.

Developed as part of a French *TIPE* (*Travail d'Initiative Personnelle Encadré*) in 2023-2024 during my MPI* year, the project combines:

- **OCaml** for grid representation, validity checking, and backtracking-based resolution.
- **Python and Pygame** for graphical visualization of the puzzle.
- **Python and Matplotlib** for analyzing and comparing algorithm execution times.

The repository also includes the final oral presentation, documenting the mathematical and algorithmic approach.

## Repository Structure

| File / Directory | Description |
|---|---|
| [`code/`](code/) | OCaml implementation of the puzzle |
| [`module_graphique/`](module_graphique/) | Python visualization and performance analysis |
| [`presentation_tipe.pdf`](presentation_tipe.pdf) | Final oral presentation (in French) |

### OCaml Implementation — `code/`

| File | Description |
|---|---|
| `grille.ml` | Grid representation and manipulation |
| `validite_grille.ml` | Grid validity checks |
| `resolution_backtracking.ml` | Backtracking-based resolution |
| `main.ml` | Main program with a predefined puzzle configuration |
| `compile.sh` | Script for compiling the OCaml program |
| `clean.sh` | Script for removing generated compilation files |
| `*.mli` | OCaml module interfaces |

### Graphical Interface — `module_graphique/`

| File | Description |
|---|---|
| `affichage.py` | Pygame visualization of the Fortress board |
| `game_board.csv` | Board configuration used by the visualization |
| `graphique.py` | Execution-time visualization |
| `graphe2.py` | Comparison of algorithm performance |
| `stat_*.csv` | Recorded algorithm performance measurements |
| `.jpg` / `.png` files | Graphical assets for the puzzle |

## Getting Started

## Running the OCaml Implementation

### 1. Compile the Program

Navigate to the OCaml source directory:

```bash
cd code
```

Compile using the provided script:

```bash
bash compile.sh
```

The script compiles the OCaml modules in dependency order and links them into an executable named `main`.

### 2. Run the Program

After compilation:

```bash
./main
```

The program constructs a predefined Fortress grid, displays it, and checks whether the configuration satisfies the puzzle's validity conditions.

Depending on the configuration, the output includes:

```text
GRILLE VALIDE
```

or

```text
GRILLE NON VALIDE
```

followed by:

```text
Fini!
```

**Note:** The current `main.ml` demonstrates grid construction and validity checking. The backtracking algorithm is implemented separately in `resolution_backtracking.ml` and is not automatically invoked by the current main program.

### 3. Modify the Puzzle

The initial puzzle configuration is defined in `main.ml`.

You can modify the grid dimensions and the placement of pieces or walls using the functions implemented in `grille.ml`.

After making changes, recompile and execute:

```bash
bash compile.sh
./main
```

## Running the Graphical Interface

The graphical component is implemented in Python using Pygame and can be run independently of the OCaml program.

### Requirements

- Python 3
- Pygame
- Matplotlib (for performance analysis)

Install the required libraries:

```bash
python3 -m pip install pygame matplotlib
```

### 1. Launch the Fortress Visualization

From the repository's root directory:

```bash
cd module_graphique
python3 affichage.py
```

This launches a Pygame window displaying the Fortress board and its graphical elements.

The board configuration is loaded from `game_board.csv`, while the image assets are stored in the same directory.

**Important:** Run the script from within `module_graphique/` because it loads files using relative paths. The script also writes to `game_board.csv`, so back up the file if you need to preserve its original contents.

### 2. Visualize Algorithm Execution Times

The repository includes scripts for visualizing performance measurements obtained from algorithm experiments.

To display an execution-time graph:

```bash
python3 graphique.py
```

This uses recorded data from `stat_astar_1.csv`.

To compare algorithm execution times:

```bash
python3 graphe2.py
```

This uses the experimental datasets configured in the script, including backtracking performance measurements.

### 3. Experimental Data

The `module_graphique/` directory contains CSV files storing experimental measurements, including:

- `stat_astar_1.csv`
- `stat_backtrack_4_4.csv`
- `stat_backtrack_5_5.csv`
- `stat_opti1_4_4.csv`

These files allow the performance analysis to be explored independently of the OCaml executable.

## Suggested Navigation

For someone exploring this project for the first time, the recommended order is:

1. **Read [`presentation_tipe.pdf`](presentation_tipe.pdf)** to understand the puzzle, project objectives, algorithms, and experimental conclusions.
2. **Explore [`code/`](code/)** to examine the OCaml implementation, including grid representation, validity checking, and backtracking.
3. **Run [`module_graphique/affichage.py`](module_graphique/affichage.py)** to visualize a Fortress board.
4. **Explore the performance scripts** to understand the execution-time measurements and algorithm comparisons.

## Technologies and Concepts

**Programming languages**
- OCaml
- Python

**Libraries and tools**
- Pygame
- Matplotlib
- CSV data files
- Shell scripts

**Concepts**
- Combinatorial problem-solving
- Backtracking algorithms
- Constraint validation
- Algorithmic complexity and performance analysis
- Graphical visualization

## Documentation

The final oral presentation is available in French:

**[`presentation_tipe.pdf`](presentation_tipe.pdf)**

It provides the broader context, methodology, and experimental results of the project.

## Notes

- The OCaml and Python components can be explored independently.
- The graphical interface does not automatically execute the OCaml solver.
- The performance plots use previously recorded CSV measurements.
