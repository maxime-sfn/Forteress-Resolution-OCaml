import matplotlib.pyplot as plt
import csv
from collections import defaultdict

def plot_from_csv_with_tuples(file_name):
    x_coords = []
    y_coords = []

    # Read the x tuples and y coordinates from the CSV file
    with open(file_name, 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        for row in csvreader:
            x_tuple = (int(row[0]), int(row[1]))
            y_value = float(row[2])
            x_coords.append(x_tuple)
            y_coords.append(y_value)

    # Calculate the mean y_value for each unique x_tuple
    y_values_by_x = defaultdict(list)
    for x, y in zip(x_coords, y_coords):
        y_values_by_x[x].append(y)
    
    mean_y_values = {x: sum(y_values) / len(y_values) for x, y_values in y_values_by_x.items()}

    # Sort the x_coords to ensure the line plot is correct
    sorted_x_coords = sorted(mean_y_values.keys())
    sorted_y_coords = [mean_y_values[x] for x in sorted_x_coords]

    # Convert tuples to strings for better display on x-axis
    x_labels = [f"({x[0]}, {x[1]})" for x in x_coords]
    sorted_x_labels = [f"({x[0]}, {x[1]})" for x in sorted_x_coords]

    # Create a scatter plot for original points
    plt.figure(figsize=(10, 6))
    plt.scatter(x_labels, y_coords, marker='o', color='blue', label='TEMPS MESURÉ POUR DES GRILLES DIFFÉRENTES')

    # Create a line plot for mean points
    plt.plot(sorted_x_labels, sorted_y_coords, color='red', linestyle='-', linewidth=1, label='MOYENNE DES TEMPS POUR CHAQUE DIMENSION DE GRILLE')

    plt.title('TEMPS DE RÉSOLUTION D\'UNE GRILLE (AVEC 4 SOLDATS ROUGES ET 4 SOLDATS BLEUS) AVEC L\'ALGORITHME D\'OPTIMISATION 2 : AVEC UNE LIMITE DE LONGUEUR/2')
    plt.xlabel('Dimension de la grille n×p')
    plt.ylabel('Temps en secondes (s)')
    plt.xticks(rotation=45, ha='right')
    plt.grid(True)
    plt.tight_layout()
    plt.legend()
    plt.show()

# Example usage
plot_from_csv_with_tuples('stat_astar_1.csv')
