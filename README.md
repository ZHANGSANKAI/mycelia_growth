# mycelia_growth
This is a code for fitting a skewed normal curve to a small number of observations

The first is a python file and the second is an r-language file, which are two separate files but solve the same problem of fitting a standard three-parameter skewed normal distribution density function using quasi-Newton and least squares with six points

The original text of the reproduction is：Consistent trade-offs in fungal trait expression across broad spatial scales（Daniel S. Maynard , Mark A. Bradford，etc）,2019

where their approach in the supplementary material is described as:Motivated by the approach of Lennon et al. 11, we used nonlinear least squares to estimate the growth curves from the experimental data. Due to the shapes of the raw curves, we chose to use a standard 3-parameter skew normal distribution to fit the data. For each fungus, we used quasi-Newton optimization in the optim function in R to find the set of parameters that minimized the sum of squares between the observed growth rates and the best-fitting skew normal distribution (using the dsn function in R). This process was conducted separately using the temperature and moisture growth data. The niche width was calculated using the result growth curves, and estimated as the range of temperature and moisture values for which growth is at least one-half their maximum growth rates


Original link:https://www.nature.com/articles/s41564-019-0361-5
