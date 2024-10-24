import numpy as np
from scipy.optimize import minimize
from scipy.stats import norm
import matplotlib.pyplot as plt

# Define the PDF function for the skewed normal distribution
def skew_normal_pdf_with_shift(x, xi, omega, alpha):
    t = (x - xi) / omega
    return (2 / omega) * norm.pdf(t) * norm.cdf(alpha * t)

# Define the objective function (minimise the squared error)
def objective_func(params, x_data, y_data):
    xi, omega, alpha= params
    y_pred = skew_normal_pdf_with_shift(x_data, xi, omega, alpha)
    return np.sum((y_data - y_pred)**2)

# Raw data
x_data = np.array([10, 16, 22, 28, 34, 40])
y_data = np.array([0.30, 0.36, 0.34, 0.38, 0.06, 0.00])

# Initial guess parameters [xi, omega, alpha]
initial_params = [25, 20, -10]

# Parameters fitted using quasi-Newton optimisation methods
result = minimize(objective_func, initial_params, args=(x_data, y_data), method='BFGS')

# Get the parameters of the fit
xi_est, omega_est, alpha_est= result.x
print(f'Estimated parameters: xi = {xi_est:.4f}, omega = {omega_est:.4f}, alpha = {alpha_est:.4f}')

# Generate a fitted curve using the fitted parameters
x_fit = np.linspace(0, 50, 5000)  
y_fit = skew_normal_pdf_with_shift(x_fit, xi_est, omega_est, alpha_est)

# Plotting raw data and fitting curves
plt.plot(x_data, y_data, 'ro', label='Original data')
plt.plot(x_fit, y_fit, 'k-', linewidth=5, label='Fitted skew normal distribution with shift')
plt.legend()
plt.xlabel('X')
plt.ylabel('Y')
plt.title('Skew Normal Distribution with Vertical Shift')
plt.show()