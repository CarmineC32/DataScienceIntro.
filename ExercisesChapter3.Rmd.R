---
title: "Chapter 3 Exercises 3.1,3.4,  and 3.5"
author: "Kim Roth"
date: "8/31/2017"
output: html_document
---

This is the template file for Exercises 3.1 and 3.5 in chapter 3. You are welcome to make your own file if you prefer. Upload the markdown file to moodle. You are welcome to upload the knitted html file if desired as well.

This chunk loads all needed packages including the data. Load this first. Or just load all the chunks before you start.
```{r}
library(mosaicData)
library(tidyverse)
library("mdsr")
```

Exercise 3.1 
__
This uses the Galton data set. To see a description of the variables, type Galton in the help tab in the lower right window.
```{r}
head(Galton)
```

1. Create a scatterplot of each person's height again their father's height.
```{r}
ggplot(Galton, aes(x=father, y=height)) + geom_point() + labs(title = "Scatterplot of Height by Father's Height", x = "Father's Height (inches)", y = "Height (inches)")
```
2. Seperate your plot into facets by sex.
```{r}
ggplot(Galton, aes(x=father, y=height, colour = sex)) + geom_point() + labs(title = "Scatterplot of Height by Father's Height", x = "Father's Height (inches)", y = "Height (inches)")
```
3. Add regression lines to all of your facets.
```{r}
ggplot(Galton, aes(x=father, y=height, colour = sex)) + geom_point() + geom_smooth(method="lm", se=0) + labs(title = "Scatterplot of Height by Father's Height", x = "Father's Height (inches)", y = "Height (inches)")
```

Exercise 3.4
___

1. Create an informative and meaningful data graphic.
```{r}
ggplot(Marriage, aes(x=age, y=race)) + geom_point() + labs(title = "Age's Correlation with Race during Marriage", x = "Age (Years)", y= "Race")
```

2. Indentify each of the visual cues that you are using. 
```{r}
Position: X-Y graph
Mark: Dark Circular Glyphs
Contex: Labels, Title of Graph
```
3. Create a data graphic for at least five variables. Do not worry about meaning here, just get five variables into the plot.
```{r}
ggplot(Marriage, aes(x=age, y=race, z=sign)) + geom_tile() + labs(title = "Age's Correlation with Race during Marriage", x = "Age (Years)", y= "Race")
```

Exercise 3.5
___

This uses data MLB_teams. To see variable descriptions, type MLB_teams into the help tab in the lower right corner window.
```{r}
head(MLB_teams, 4)
```

See how many variables you can illustrate on a single plot in R. The current reecord is 7.  (note as the book notes this is not always a good idea)
```{r}
ggplot(MLB_teams, aes(x=W, y=L, z=WPct)) + geom_tile() + labs(title = "MLB", x = "Wins", y= "Losses", z = "Winning Percentage")
```

