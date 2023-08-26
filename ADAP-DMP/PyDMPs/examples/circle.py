import math
import matplotlib.pyplot as plt

def calculate_circle_edge(obstacles):
    circle_points = []
    
    for obstacle in obstacles:
        x, y, radius = obstacle
        obstacle_points = []
        
        for angle in range(361):
            # Convert angle to radians
            angle_rad = math.radians(angle)
            
            # Calculate point coordinates on the edge of the circle
            point_x = x + radius * math.cos(angle_rad)
            point_y = y + radius * math.sin(angle_rad)
            
            # Add the point to the obstacle points list
            obstacle_points.append((point_x, point_y, radius))
        
        # Add the obstacle points to the circle points list
        circle_points.extend(obstacle_points)
    
    return circle_points

obstacles = [[0.52176149, -0.65379153, 0.01]]
circle_points = calculate_circle_edge(obstacles)

# Extract x and y coordinates from circle_points
x_values = [point[0] for point in circle_points]
y_values = [point[1] for point in circle_points]

# Plot the circle points
plt.scatter(x_values, y_values)
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Circle Points')
plt.grid(True)
plt.show()
