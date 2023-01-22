
# RadChart Function

RadChart offers three different ways to plot radar charts. First, the plot vector values option has a mandatory argument (Vec) that specifies the main title. The second option allows for the plotting of multiple radar charts using data frames, with the graphic function par and parameter mfrow (to set the rows and columns).
In the above options, col1 and col2 are required; however, in the third option, col2 must be absent, because the colors are automatically supplied. The last option presents a radar chart with a minimum of three variables, samples, or stations. For the multivariate option of RadChart, the argument "MV" is mandatory, which provides the main title.

### Function Arguments

* df: This argument is a data frame with stations in columns and variables in rows; it can also be a vector.
* Ftext: Font for labels, numbers, and titles.
* col1: Color of the grid.
* col2: This argument provides the color of polygons, but it does not hold in the multivariate version of RadChart.
* Vec: It is an exclusive and mandatory argument for plotting radar charts from vectors. It provides the main title for the chart.
* MV: For the multivariate RadChart version it is an exclusive and mandatory argument which provides the main title.

Note:When it runs empty, the RadChart function returns the error that the argument df is missing, with no default value; however, with this argument, the function works as expected. 

Below are examples of different radar charts generated from the data sets available as examples in the global environment of R.

### Loading data to plotting

#### Dataset OrchardSprays (it has data of Potency of Orchard Sprays)

In this example, a vector was created using six values from the column labeled "decrease."

```{r}
data(OrchardSprays)
```

```{r}
par(mfrow=c(1,1))
decrease=OrchardSprays$decrease[1:6]
decrease
```

```{r}
RadChart(decrease,"Perpetua Titling MT","black","dodgerblue",Vec="Decrease")
#dev.copy(device=jpeg,filename="OrchardSpraysUni.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(2,2))
RadChart(OrchardSprays[c(1:3,9:15),1:3],"Niagara Engraved","black","brown4")
#dev.copy(device=jpeg,filename="OrchardSpraysBi.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(1,1))
RadChart(OrchardSprays[c(1:2,9:11),1:3],"Malgun Gothic","black",MV="OrchardSprays Dataset")
#dev.copy(device=jpeg,filename="OrchardSpraysMulti.jpeg",width=800,height=800);
#dev.off()

```

#### Dataset Orange (It has data about the growth of orange trees)

As a simple example of the vector option, the first column from the Orange dataset has been converted from a factor to numeric.

```{r}
data(Orange)
Orange$NTree=as.numeric(as.character(Orange$Tree))
```

```{r}
par(mfrow=c(1,1))
nt=Orange$NTree[c(1:2,8:10,18:20,22:25,31:34)]
par(mfrow=c(1,1))

RadChart(nt,"Matura MT Script Capitals","black","firebrick",Vec="NTree")
#dev.copy(device=jpeg,filename="OrangeUni.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(1,1))
Age=Orange$circumference[1:7]
par(mfrow=c(1,1))
RadChart(Age,"Rockwell Extra Bold","black","red",Vec="Circumference")
#dev.copy(device=jpeg,filename="OrangeUni.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(2,2))
RadChart(Orange[1:8,2:4],"Eras Demi ITC","black","forestgreen")
#dev.copy(device=jpeg,filename="OrangeBi.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(1,1))
RadChart(Orange[c(1:2,5:7,9:11),2:4],"Jokerman","black",MV="Orange Dataset")
#dev.copy(device=jpeg,filename="OrangeMulti.jpeg",width=800,height=800);
#dev.off()
```

#### This is the Iris dataset (Edgar Anderson data). It contains data about four features of three species of the Iris genus dataset Iris.

The Iris dataset with calculated areas

```{r}
data(iris)
iris$ASepal=iris$Sepal.Length*iris$Sepal.Width
iris$APetal=iris$Petal.Length*iris$Petal.Width
```

A sample function was used to get a vector for this dataset using a set of 10 values from Sepal.Width

```{r}
width=sample(iris$Sepal.Width,10)
par(mfrow=c(1,1))
RadChart(width,"Garamond","deepskyblue3","darkgreen",Vec="width")
#dev.copy(device=jpeg,filename="IrisUni.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(2,2))
RadChart(iris[1:10,1:4],"Book Antiqua","blue4","darkgoldenrod")
#dev.copy(device=jpeg,filename="IrisBi.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(1,1))
colnames(iris)=c("LSepal","WSepal","LPetal","WPetal","Species","ASepal","APetal")
RadChart(iris[7:10,c(1:4,6:7)],"Pristina","blue4",MV="Iris Dataset")
#dev.copy(device=jpeg,filename="IrisMulti.jpeg",width=800,height=800);
#dev.off()
```

#### Dataset mtcars (it has information about Motor Trend Car Road Tests)

As the rownames in this dataset can be too long to represent axis labels, they were abbreviated with the function abbreviate.

```{r}
data(mtcars)
rownames(mtcars)=abbreviate(rownames(mtcars))

HorsePower=mtcars$hp[7:24]
```

```{r}
par(mfrow=c(1,1))
RadChart(HorsePower,"Javanese Text","black","indianred4",Vec="Horse Power")
#dev.copy(device=jpeg,filename="MtcarsUni.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(2,2))
RadChart(mtcars[1:8,1:4],"Tahoma","black","brown")
#dev.copy(device=jpeg,filename="MtcarsBi.jpeg",width=800,height=800);
#dev.off()
```

```{r}
par(mfrow=c(1,1))
RadChart(mtcars[c(1,8,15),1:6],"Old English Text MT","red",MV="Mtcars Dataset")
#dev.copy(device=jpeg,filename="MtcarsMulti.jpeg",width=800,height=800);
#dev.off()
```


