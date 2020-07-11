# Consider influenza epidemics for two parent heterosexual families. 
# Suppose that the probability is 17% that at least one of the parents has contracted
# the disease. The probability that the father has contracted influenza is 12% 
# while the probability that both the mother and father have contracted 
# the disease is 6%. What is the probability that the mother has contracted influenza?
#     
# (Hints look at lecture 2 around 5:30 and chapter 4 problem 4).

# P(A???B) = P(A) + P(B) ??? P(A???B), 
# therefore P(B) = P(A???B) + P(A???B) - P(A)

P_AuB_ <- 0.17 
P_A_ <- 0.12
P_AnB_ <- 0.06

P_B_ <- P_AuB_ + P_AnB_ - P_A_
P_B_



# A random variable, X, is uniform, a box from 0 to 1 of height 1. 
# (So that its density is f(x)=1 for 0???x???1.) 
# What is its median expressed to two decimal places?
# What is its 75th percentile?
# HINT: The median is the point so that 50% of the density lies below it
# (Hints, look at lecture 2 around 21:30 and Chapter 5 Problem 5. Also, look up the help function for the qunif command in R.)


qunif(p=0.50, min = 0, max = 1)
qunif(p=0.75, min = 0, max = 1)


# 
# You are playing a game with a friend where you flip a coin and if it comes up heads 
# you give her X dollars and if it comes up tails she gives you Y dollars. 
# The odds that the coin is heads is d. What is your expected earnings?
# HINTS: The odds that you lose on a given round is given by p/(1???p)=d 
# which implies that p=d/(1+d).
???X *(d/1+d) + Y*(1/(1+d))


# You are playing a game with a friend where you flip a coin and if it comes up heads 
# you give her XX dollars and if it comes up tails she gives you YY dollars. 
# The probability that the coin is heads is pp (some number between 00 and 11.) 
# What has to be true about XX and YY to make so that both of your expected total 
# earnings is 00. The game would then be called "fair".
# (Hints, look at Lecture 4 from 0 to 6:50 and Chapter 5 Problem 6. Also, 
# for further reading on fair games and gambling, start with the Dutch Book problem ).

# the game can be called fair, 
# p*X = Y*(1-p) 

p/(1-p)=Y/X #ANSWER



# A density that looks like a normal density (but may or may not be exactly normal)
# is exactly symmetric about zero. (Symmetric means if you flip it around zero it 
# looks the same.) What is its median?
#     
# (Hints, look at quantiles from Lecture 2 around 21:30 and Chapter 2 Problem 7.

# The median must be 0
# 50% of the probability is below 0 and 50% is above 0, 
# when the density is symmetric at zero.


x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp

fi <- temp["X",]
xi <- temp["Prob",] 

product <- fi*xi
sum(product)


# A web site (www.medicine.ox.ac.uk/bandolier/band64/b64-7.html) for home pregnancy
# tests cites the following: "When the subjects using the test were women who collected 
# and tested their own samples, the overall sensitivity was 75%. Specificity was also low,
# in the range 52% to 75%." Assume the lower value for the specificity. 
# Suppose a subject has a positive test and that 30% of women taking 
# pregnancy tests are actually pregnant. What number is closest to the probability 
# of pregnancy given the positive test?
# (Hints, watch Lecture 3 at around 7 minutes for a similar example. Also, there's a lot of Bayes' rule problems and descriptions out there, for example here's one for HIV testing. Note, discussions of Bayes' rule can get pretty heady. So if it's new to you, stick to basic treatments of the problem. Also see Chapter 3 Question 5.)

preg_positive <- 0.75 * 0.30 / (0.75 * 0.30 + 0.48 * 0.70)
preg_positive






# A random variable takes the value -4 with probability .2 and 1 with probability .8.
# What is the variance of this random variable?

# E[X] = 0
# Var(X) = E[X^2]=(-4)^2 * 0.2 + (1)^2 * 0.8

-4 * .2 + 1 * .8
(-4)^2 * .2 + (1)^2 * .8

# 
# If X?? and Y?? are comprised of n iid random variables arising from distributions 
# having means ??x and ??y, respectively and common variance ??2 what is the variance X?????Y???

# 2??^2/n
# What is the variance expressed to 1 decimal place?
p <- c(.1, .2, .3, .4)
x <- 2 : 5
