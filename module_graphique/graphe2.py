import matplotlib.pyplot as plt
import csv
from collections import defaultdict

def plot_means_from_multiple_csv(file_name_pairs):
    plt.figure(figsize=(10, 6))
    
    for file_name, curve_name in file_name_pairs:
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
        sorted_x_labels = [f"({x[0]}, {x[1]})" for x in sorted_x_coords]

        # Create a line plot for mean points with thicker lines
        plt.plot(sorted_x_labels, sorted_y_coords, linestyle='-', linewidth=2, label=curve_name)

    plt.title('COMPARAISON DES TEMPS DE RÉSOLUTION')
    plt.xlabel('Dimension de la grille n×p')
    plt.ylabel('Temps en secondes (s)')
    plt.xticks(rotation=45, ha='right')
    plt.grid(True)
    plt.tight_layout()
    plt.legend()
    plt.show()

# Example usage
plot_means_from_multiple_csv([
    ('stat_backtrack_4_4.csv', 'BACKTRACK 4x4'),
    ('stat_backtrack_5_5.csv', 'BACKTRACK 5x5')
    #('stat_opti1_4_4.csv', 'OPTIMISATION 1 4x4')
    #('stat_astar_1.csv', 'OPTIMISATION 2 (A*) 4X4')
])
