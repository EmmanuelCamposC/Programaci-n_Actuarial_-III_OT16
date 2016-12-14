
install.packages("xlsx")
install.packages("rJava")
library(rJava)
library(xlsxjars)
library(xlsx)

setwd("E:/")
AutoClaim <- read.xlsx("datosP.xlsx",header = T,sheetName = "Hoja1")
AutoClaimIn <- subset(AutoClaim, YEAR < 1998)

plot(AC ~ YEAR, data = AutoClaimIn, ylab="Average Claim", xlab="Year")
 for (i in AutoClaimIn$TOWNCODE) {
  lines(AC ~ YEAR, data = subset(AutoClaimIn, TOWNCODE == i)) }

AutoClaimIn$lnPCI <- log(AutoClaimIn$PCI)
AutoClaimIn$lnPPSM <- log(AutoClaimIn$PPSM)

plot(AC ~ lnPCI, data = AutoClaimIn, ylab="Average Claim", xlab="PCI")
for (i in AutoClaimIn$TOWNCODE) {
lines(AC ~ lnPCI, data = subset(AutoClaimIn, TOWNCODE == i)) }


plot(AC ~ lnPPSM, data = AutoClaimIn, ylab="Average Claim", xlab="PPSM")
 for (i in AutoClaimIn$TOWNCODE) {
  lines(AC ~ lnPPSM, data = subset(AutoClaimIn, TOWNCODE == i)) }

AutoClaimIn$YEAR <- AutoClaimIn$YEAR-1992
Pool.fit <- lm(AC ~ lnPCI+lnPPSM+YEAR, data=AutoClaimIn)
summary(Pool.fit)
anova(Pool.fit)

#Modelo numero 2

FE.fit <- lm(AC ~ factor(TOWNCODE)+lnPCI+lnPPSM+YEAR-1, data=AutoClaimIn)
summary(FE.fit)

anova(FE.fit)
anova(Pool.fit,FE.fit)


#PREDICTION
# BLUP

Pmatrix =
  function(th) {
    P = matrix(nrow=6,ncol=6,data=0)
    P[1,1]=P[2,1]=P[3,2]=P[4,3]=P[5,4]=P[6,5]= exp(-th)
    P[,6] = 1-exp(-th)
    return(P)}

lim.distr =
  function(matrix) {
    et = matrix(nrow=1, ncol=dim(matrix)[2], data=1)
    E = matrix(nrow=dim(matrix)[1], ncol=dim(matrix)[2], data=1)
    mat = diag(dim(matrix)[1]) - matrix + E
    inverse.mat = solve(mat)
    p = et %*% inverse.mat
    return(p)}
P=Pmatrix(0.1)
P
pi=lim.distr(P)
pi


#Relativities
#1
a.hat = 0.8888
lambda.hat = 0.1474
int1 =
  function(theta, s, a, lambda) {
    a = a.hat
    lambda = lambda.hat
    f.dist = gamma(a)^(-1) * a^a * theta^(a-1) * exp(-a*theta)
    p = lim.distr(Pmatrix((lambda*theta)))
    return(theta*p[1,s+1]*f.dist)}
P1 = matrix(nrow=1, ncol=6, data=0)
for (i in 0:5) P1[1,i+1] = integrate(Vectorize(int1),lower=0,upper=Inf,s=i)$value
int2 =
  function(theta, s, a, lambda) {
    a = a.hat
    lambda = lambda.hat
    f.dist = gamma(a)^(-1) * a^a * theta^(a-1) * exp(-a*theta)
    p = lim.distr(Pmatrix((lambda*theta)))
    return(p[1,s+1]*f.dist)}
P2 = matrix(nrow=1, ncol=6, data=0)
for (i in 0:5) P2[1,i+1] = integrate(Vectorize(int2),lower=0,upper=Inf,s=i)$value
R = P1 / P2
R

#2
lambda = c(0.1176,0.1408,0.1897,0.2272,0.1457,0.1746,0.2351,0.2816,
           0.1761,0.2109,0.2840,0.3402,0.2182,0.2614,0.3520,0.0928,
           0.1112,0.1498,0.1794,0.1151,0.1378,0.1856,0.2223)
weights = c(0.1049,0.1396,0.0398,0.0705,0.0076,0.0122,0.0013,0.0014,
            0.0293,0.0299,0.0152,0.0242,0.0007,0.0009,0.0002,0.1338,
            0.1973,0.0294,0.0661,0.0372,0.0517,0.0025,0.0044)
a = 1.065
n=length(weights)
int3 =
  function(theta, lambda, a, l) {
    p = lim.distr(Pmatrix(lambda*theta))
    f.dist = gamma(a)^(-1) * a^a * theta^(a-1) * exp(-a*theta)
    return(theta*p[1,l+1]*f.dist)}
int4 =
  function(theta, lambda, a, l) {
    p = lim.distr(Pmatrix(lambda*theta))
    f.dist = gamma(a)^(-1) * a^a * theta^(a-1) * exp(-a*theta)
    return(p[1,l+1]*f.dist)}
teller1 = teller2 = noemer = array(dim=6, data=0)
result1 = result2 = array(dim=6, data=0)
for (i in 0:5) {
  b = c = array(dim=n,data=0)
  for (j in 1:n) {
    b[j] = integrate(Vectorize(int3),lower=0, upper=Inf,lambda=lambda[j],a=a,l=i)$value
    c[j] = integrate(Vectorize(int4),lower=0, upper=Inf,lambda=lambda[j],a=a,l=i)$value}
  teller1[i+1] = b %*% weights
  noemer[i+1] = c %*% weights
  R = teller1/noemer
}
R


install.packages("raneftest")
library(raneftest)
tttalpha.BLUP <- ranef(EC.fit)
beta.GLS <- fixef(EC.fit)
resid.BLUP <- residuals(EC.fit, type="response")
rstandard.BLUP <- residuals(EC.fit, type="normalized")
alpha.BLUP

glm.nb
install.packages("glmmADMB")














































































































































































































































































































































































