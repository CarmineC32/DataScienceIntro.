---
title: "Introduction to Graphing with ggplot2"
author: "Kim Roth"
date: "7/10/2017"
output: html_document
---

**Introduction**

This is an RMarkdown document. It allows you type text amid your r commands without having to comment. It can produce professional level documents in html, word, or pdf. 

This is an R chunk. It is like an embedded .R file. Hit the play button to evaluate.
```{r}
3+4
sample=c(1,2,3,4)
sample
```

Note the output is displayed in two places, in the markdown file and in the Console, althogh RStudio sometimes likes to hide the console.

Two things to remember about programming in R.

1. The computer will do exactly what you tell it to do. 
2. Copy, paste, and edit is your good friend.

Albert and Chester like to say instead
1. Computers are stupid.
2. Don't code from scratch.

Now like many programming environments we have to load in a few things to use them here. Technically you have to install the packages before you load them, but we've done that on the server already. Also I am loadng the datasets.
```{r}
library(tidyverse) #loads ggplot and the others
library(okcupiddata) #loads the data we will use later today from ok cupid, a dating site.
profiles <- okcupiddata::profiles #loads the okcupid data and names it profiles.
simple_ex <-
  data_frame(
    A = c(1980, 1990, 2000, 2010),
    B = c(1, 2, 3, 4),
    C = c(3, 2, 1, 2),
    D = c("low", "low", "high", "high")
  ) #the example from class
simple_ex
```

**Graphs from simple_ex**
Now let's make a graph starting with a set of axes, called the base layer
```{r fig.height=2, fig.width=5}
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) #base layer, there is no graph here yet, just an x and y axis
```

Let's pick that commmand apart a bit.

ggplot-calls ggplot
data= tells what data set
mapping= what variables we will graph 
aes is short for aesthetic

Now let's make a scatterplot. A graph is a mapping of data variables to aestheic attributes to geometric object. The graph type is a geometric object. Scatter plots are geom_point. To add things to a graph use +. For formatting reasons it is best to end lines with +.
```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) +geom_point()
```
And there is our first graph.

Now to color by D.

```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) +geom_point(mapping = aes(color = D))
```

Now to do size by C.
```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B, size = C)) + 
  geom_point()
```

Now color and size.
```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B,size=C)) +geom_point(mapping = aes(color = D))
```

Line graphs use the geometry geom_line
```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) + 
  geom_line()
```

Now coloring the line according to D and points blue of size 4. What will it do to the middle.
```{r}
ggplot(data = simple_ex, mapping = aes(x = A, y = B)) + 
  geom_line(mapping = aes(color = D)) +
  geom_point(color = "blue", size = 4)
```

**Notes**

Common graph types

- Scatterplot: `geom_point()`
- Line graph: `geom_line()`
- Histogram: `geom_histogram()`
- Boxplot: `geom_boxplot()`
- Bar graph: `geom_bar()`
- Density plots: `geom_density()'


You can find more on the ggplots cheatsheet, which will be handed out now.

**Graphs from OkCupid data**

The data from OkCupid is specifically from the San Fransisco area in June 2012. Let's look at the data. Note you can double click to open large output in a new window.
```{r}
head(profiles) #the first six rows/cases
str(profiles) #variable names and info
```

Here are two complicated bar graphs for us to break down. 
```{r}
ggplot(data = profiles, mapping = aes(x=drinks,fill=sex)) + 
  geom_bar()+facet_wrap(~ orientation, ncol = 1)
ggplot(data = profiles, mapping = aes(x=drinks,fill=sex)) + 
  geom_bar(position = "fill")+facet_wrap(~ orientation, ncol = 1)
```

Now it is your turn
1) Make a scatterplot of age vs. height. 
```{r}

```
2) Add a regression (that is line of best fit) line to your scatterplot by using +geom_smooth(method="lm", se=0)

lm stands for linear model as in we want to graph a line not another type of curve
se=0 stands for standard error, it says to just graph the line without any kind of error region arround it
```{r}

```

3) Make a scatterplot of age vs. height. Color by sex.
```{r}

```

4) Make a scatterplot of age vs. height. Size by income.
```{r}

```

5) Make a bar chart of drinks
```{r}

```

6) Make a bar chart of drinks and color the bars by sex. Do not worry if the guide/legend does not quite work
```{r}

```

7) Make a histogram of income. Color the bars some color other than black
```{r}

```

8) Make a boxplot of income by sex.
```{r}

```

This document is based on documents created by Adam Loy, Chester Ismay, Adrianna Escobo-Land and Albert Kim.
In particular:

Ismay, C., Kim A. ModernDive: An Introduction to Statistical and Data Sciences via R
https://github.com/ismayc/moderndiver-book

Kim A., Escobo-Land, A. OkCupid Data for Introductory Statistics and Data Science Courses,Journal of Statistics Education, Volume 23, Number 2 (2015)

Loy A., Creating graphs with ggplot2, USCOTS 2017.
