# A pharmaceutical company is interested in testing a potential blood pressure 
# lowering medication. Their first examination considers only subjects that received 
# the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)
# Consider testing the hypothesis that there was a mean reduction in blood pressure? 
# Give the P-value for the associated two sided T test.

data <- data.frame('Subject' = c(1:5),
                   'Baseline' = c(140, 138, 150, 148, 135),
                   'Week2' = c(132, 135, 151, 146, 130))
data

P_Value<- t.test(data$Baseline, data$Week2, paired =T)
P_Value



# A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. What is the complete set of values 
# of ??0 that a test of H0: ?? = ??0
# would fail to reject the null hypothesis in a two sided 5% Students t-test?
n <- 9
mu <- 1100
sd <- 30
ci <- 0.95
qntl <- ci + (1-ci)/2
mu + c(-1, 1) * qt(qntl, df = n - 1) * sd/sqrt(n)


# Researchers conducted a blind taste test of Coke versus Pepsi. 
# Each of four people was asked which of two blinded drinks given in random order that they preferred. 
# The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, 
# report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.

# 1
choose(4, 3)*0.5^4 + choose(4, 4)*0.5^4


# 2
choice1 <- 4
choice2 <- 3
p <- 0.5
pbinom(choise2-1, size = n, prob = p, lower.tail = F)


# Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. 
# A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. 
# About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?

benchmark <- 1/100 #rate
infections <- 10
case <- 1787

ppois(infections, benchmark * case, lower.tail = T)
pvalue <- poisson.test(infections, T = case, r = benchmark, alt = 'less')

pvalue 


# Suppose that 18 obese subjects were randomized, 9 each, to a new diet pill and a placebo. Subjects' body mass indices (BMIs) 
# were measured at a baseline and again after having received the treatment or placebo for four weeks. 
# The average difference from follow-up to the baseline (followup - baseline) 
# was ???3 kg/m2 for the treated group and 1 kg/m2 for the placebo group. 
# The corresponding standard deviations of the differences was 1.5 kg/m2 for the treatment group and 1.8 kg/m2 for the placebo group. 
# Does the change in BMI appear to differ between the treated and placebo groups? 
# Assuming normality of the underlying data and a common population variance, give a p-value for a two sided t test.


# diet pills
obese_Subject <- 9
treated_Group <- -3
sd1 <- 1.5**2

# placebo
placebo_Subject <- 9
placebo_Group <- 1
sd2 <- 1.8**2

ci <- 0.95
a <- ci + (1 - ci) / 2
sp <- sqrt(((placebo_Subject-1) * sd2 + (obese_Subject-1) * sd1) / (placebo_Subject + obese_Subject - 2)) 
pt((treated_Group - placebo_Group) / (sp * sqrt(1 / obese_Subject + 1 / placebo_Subject)), df = placebo_Subject + obese_Subject - 2)



# Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc 
# to 1,123 cc. Would you reject in a two sided 5% hypothesis test of 
# `H0 : ?? = 1,078`?
# 95% would be wider than 90%, so I'd fail to reject. ?? = 1,078 in the 90% interval,
# thus 95% will be wider 



# Researchers would like to conduct a study of 100 healthy adults 
# to detect a four year mean brain volume loss of .01 mm3. 
# Assume that the standard deviation of four year volume loss in this population is .04 mm3. 
# About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?

healthy_Adults <- 100
power <- 0.05
ci <- 0.95
four_year_mean <- 0.01
sd <- 0.04

power.t.test(healthy_Adults, delta = four_year_mean, sd = sd, sig.level = power, type = 'one.sample', alternative = 'one.sided')$power


# About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?
v <- 0.9
power <- 0.05
four_year_mean <- 0.01
sd <- 0.04

ceiling((sd / four_year_mean * (qnorm(1- power) - qnorm(1- v)))^2)


# As you increase the type one error rate, \alpha ??, what happens to power?
# increase
