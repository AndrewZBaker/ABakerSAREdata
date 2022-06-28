#### practice spatial ecology chpt 2
##### created by Andrew--practicing R studio basics in rasters and general spatial ecology ######

### load packages

library( raster  ) #gridlines
library(sp)

#creating first practice raster- a 6x6 plot with random frequencies inside the plots
set.seed(5)
toy <- raster(ncol=6, nrow=6, xmn=1, xmx=6, ymn=1, ymx=6)
values(toy) <- rpois(ncell(toy), lambda=3)
ncell(toy)
plot(toy)
text(toy, digits=2)
mean(toy)
###rmultinom #Uses K cover for habitats--what will be used for invasive weeds to shrubland ratios?
#next five steps are for populating a vector string into the raster layer
ncell(toy)
toy2 <- toy
values(toy2) <- 1:ncell(toy)
plot(toy2)
text(toy2, digits=2)
#this numbered the boxes 1-36 and colored the heatmap respectively to number order
#increasing grains using aggregate command using the mean approach. For majority approach, toy_maj would be used instead
toy_mean<-aggregate(toy, fact=2, fun=mean)
plot(toy_mean)
#using cellstats function to determine whether aggregating the rasters will affect stat outcomes
cellStats(toy, mean)
cellStats(toy, var)
cellStats(toy_mean, mean)
cellStats(toy_mean, var)
#mean is the same, however the variance shifted significantly from 2.7 down to 0.39
#making now a larger grain raster. Disaggregating gets plots even more specific
toy_dis2_bilinear <- disaggregate(toy, fact=2, method='bilinear')
plot(toy_dis2_bilinear)
text(toy_dis2_bilinear, digit=2)
##data can be cropped using the extent function.
#e <- extent(coordinates) creates an extent raster beforehand
#toy_crop <- crop(toy, e) #I assume in crop, that after the parenthesis the first input is the victim plot and the second is the size
#plot afterwards
#plots can get larger if the initial extent coords are larger than the original plot
#it didn't feel very necessary to actually view the cropped area, but I typed it under the # anyways

###this area of the book, 2.3.4.1 pg 33, has instructions on how to input real datasets into R and visualize
#Get satellite data from Leticia or Zoe to do this

