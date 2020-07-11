# Part 2: Basic Inferential Data Analysis Instructions


# 1. Load the ToothGrowth data and perform some basic exploratory data analyses
# 2. Provide a basic summary of the data.
# 3. Use confidence intervals and/or hypothesis tests to compare tooth growth by 
#    supp and dose. (Only use the techniques from class, even if there's other approaches worth considering)
# 4. State your conclusions and the assumptions needed for your conclusions.

data("ToothGrowth")

library(dplyr)
library(datasets)
data(ToothGrowth)
library(ggplot2)
library(ggplot)
install.packages("cowplot")
library(cowplot)


# Load the ToothGrowth data and perform some basic exploratory data analyses
ToothGrowth %>% group_by(supp, dose) %>%
                summarise(meanLength = mean(len), medianLength = median(len), sdLength = sd(len))


summary(ToothGrowth)
head(ToothGrowth)

ggplot(data = ToothGrowth, aes(x = supp, y = len, fill = supp)) +
        geom_boxplot() +
        geom_point() +
        facet_grid(. ~ dose) +
        xlab('Supplement type') +
        ylab('Tooth length') +
        ggtitle('Tooth growth of varying doses and supplement type in guinea pigs') +
        scale_fill_brewer(palette = 'Pastel1',
                          labels = c('Orange juice', 'Vitamin C'),
                          name = 'Supplement type')

# the Tooth Growth in guinea pigs treated, there is a does-dependent effect in that the higher the dose is, the longer the tooth length is. Whether this relationship is linear requires further exploration.
