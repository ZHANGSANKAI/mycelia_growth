# 安装和加载sn包
if(!require(sn)) {
  install.packages("sn")
}
library(sn)

# 数据
x <- c(3.5, 4.5, 5.5, 6.5, 7.5, 8.5, 9.5, 10.5, 11.5)
y <- c(0.0000000, 0.3666667, 0.4336667, 0.4556667, 0.5676667, 0.6413333, 0.7153333, 0.3973333, 0.0000000)

# 定义目标函数 (最小化平方误差)
objective_function <- function(params, x, y) {
  xi <- params[1]
  omega <- params[2]
  alpha <- params[3]
  
  # 使用dsn函数计算偏正态分布的y值
  y_pred <- dsn(x, xi, omega, alpha)
  
  # 返回平方误差
  return(sum((y - y_pred)^2))
}

# 初始猜测参数 [xi, omega, alpha]
initial_params <- c(7, 1, 1)

# 使用optim进行拟合 (quasi-Newton method)
fit <- optim(initial_params, objective_function, x = x, y = y, method = "BFGS")

# 获取拟合的参数
xi_est <- fit$par[1]
omega_est <- fit$par[2]
alpha_est <- fit$par[3]

cat("拟合的参数: \n")
cat("xi =", xi_est, "\n")
cat("omega =", omega_est, "\n")
cat("alpha =", alpha_est, "\n")

# 使用拟合的参数生成拟合曲线
x_fit <- seq(min(x), max(x), length.out = 100)
y_fit <- dsn(x_fit, xi_est, omega_est, alpha_est)

# 绘制结果
plot(x, y, pch = 16, col = "red", xlab = "x", ylab = "y", main = "Skew Normal Distribution Fit")
lines(x_fit, y_fit, col = "blue", lwd = 2)
legend("topright", legend = c("Observed data", "Fitted curve"), col = c("red", "blue"), pch = c(16, NA), lty = c(NA, 1))