#Some linear regression siumlation studies
#chi squared
#t-distrbution 2 df.
set.seed(1234)
beta <- c(3,1,1)
n <- 100
nsim <- 10000
pvals_t1 <- c()
beta_list1 <- list()
beta_list2 <- list()
beta_list3 <- list()
for (i in 1:nsim){print(i)
x1 <- rnorm(n)
x2 <- x1 + rnorm(n)
x3 <- x1 + x2 + rnorm(n)
eps <- rnorm(n)
# eps <- rep(NA, n)
# eps[1] <- rnorm(1)
# for (j in 2:n){
#   eps[j] <- 0.9*eps[j-1] + rnorm(1)
# }
#eps <- rexp(n,1) - 1

y <- beta[1] + beta[2]*x1 + beta[3]*x2 + eps

mod1 <- lm(y ~ x1 )
mod2 <- lm(y ~ x1 + x2)
mod3 <- lm(y ~ x1 + x2 + x3)

beta_list1[[i]] <- summary(mod1)$coef[,1]
beta_list2[[i]] <- summary(mod2)$coef[,1]
beta_list3[[i]] <- summary(mod3)$coef[,1]

}


beta_mat1 <- do.call(rbind,beta_list1)
apply(beta_mat1,2,mean)
apply(beta_mat1,2,var)

beta_mat2 <- do.call(rbind,beta_list2)
apply(beta_mat2,2,mean)
apply(beta_mat2,2,var)

beta_mat3 <- do.call(rbind,beta_list3)
apply(beta_mat3,2,mean)
apply(beta_mat3,2,var)



hist(beta_mat[,1])
abline(v = 3, col = "red")
mean(beta_mat[,1])
var(beta_mat[,1])

hist(beta_mat[,2])
abline(v = 1, col = "red")
mean(beta_mat[,2])
var(beta_mat[,2])

hist(beta_mat[,3])
abline(v = 0, col = "red")
mean(beta_mat[,3])
var(beta_mat[,3])







hist(pvals_t1)

mean(pvals_t1 < 0.05)


