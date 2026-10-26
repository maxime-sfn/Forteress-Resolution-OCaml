import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

def plot_surface():
    fig = plt.figure()
    ax = fig.add_subplot(111, projection='3d')
    
    # Create the grid in x and y
    x = np.linspace(-5, 5, 400)
    y = np.linspace(-5, 5, 400)
    x, y = np.meshgrid(x, y)
    
    # Calculate z values based on the equation x^2 + y^2 = z^2
    z1 = np.sqrt(x**2 + y**2)
    z2 = -np.sqrt(x**2 + y**2)
    
    # Plot the surfaces
    ax.plot_surface(x, y, z1, alpha=0.5, rstride=100, cstride=100, color='b')
    ax.plot_surface(x, y, z2, alpha=0.5, rstride=100, cstride=100, color='r')
    
    # Set labels
    ax.set_xlabel('X')
    ax.set_ylabel('Y')
    ax.set_zlabel('Z')
    
    # Set the title
    ax.set_title('Surface plot of x^2 + y^2 = z^2')
    
    plt.show()

plot_surface()
