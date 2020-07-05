library(ggplot2)
str(mpg)

qplot(displ, hwy, data = mpg)

# add legend and colors
qplot(displ, hwy, data = mpg, color = drv)

# adding geopm
qplot(displ, hwy, data = mpg, geom = c('point', 'smooth'))

# Histogram by ggplot
qplot(hwy, data = mpg, fill = drv )
qplot(log(hwy), data = mpg)
qplot(log(hwy), data = mpg, fill = drv)

# Facets splits (seperate diagrams)
qplot(displ, hwy, data = mpg, facets = .~drv) # display by Rows  facets = .~drv 

qplot(hwy, data = mpg, facets = drv~., binwidth = 2) #display by Columns facets = drv~.



# Density Smooth
qplot(log(hwy), data = mpg, geom = 'density')
qplot(log(hwy), data = mpg, geom = 'density', color = drv)


# Scatterplots
