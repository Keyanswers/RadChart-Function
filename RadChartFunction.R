RadChart = function(df,Ftext,col1,col2,Vec,MV){
  
  pck = c("fmsb","extrafont","extrafontdb","scales","caret")
  if (length(pck[pck %in% installed.packages()])>0){
    lapply(pck,require,character.only=TRUE)
  } else {
    install.packages(c(pck))
    lapply(pck,require,character.only=TRUE)
  }
  
  ifelse(dim(subset(installed.packages(),
                    installed.packages()[,1] == "Rttf2pt1" & installed.packages()[,3] == "1.3.8"))[1]>0,
         require("Rttf2pt1"),remotes::install_version("Rttf2pt1", version="1.3.8"))
  ifelse(length(fonts())>0, print("Let's work and select your favorite font"),font_import())
  loadfonts(device = "win",quiet = TRUE)
  
  col1 = ifelse(missing(col1),"black", col1)
  
  if (is.null(dim(df))){
    
    Max = rep(max(df),length(df))
    Min = rep(min(df),length(df))
    df1 = data.frame(rbind(Max,Min,df))
    
    cls1 = round(seq(round(min(df),digits = 2),round(max(df),digits = 2),length.out = 5),digits = 2)
    
    fn=par(family = Ftext)
    col2 = ifelse(missing(col2), "firebrick", col2)
    radarchart(df1,
               title = Vec,
               axislabcol = "black",
               cglcol = col1,
               pcol = col2 ,pfcol = scales::alpha(col2,0.4),
               cglty = 7, cglwd = 1,vlabels = colnames(df1), vlcex = 1.5,plwd = 1.3,calcex = 1.5,axistype = 1,
               caxislabels = cls1, cex.main = 2.3)
    par(fn)
    
  }  else if (missing(MV) && missing(Vec)){
    Max = c();Min = c()
    for(i in colnames(df)){
      Max[i] = max(df[,i])
      Min[i] = min(df[,i])
    }
    Max
    Min
    
    DF=list()
    for(i in seq_along(colnames(df))){
      DF[[i]] = data.frame(rbind(rep(Max[i],dim(df)[1]),rep(Min[i],dim(df)[1]),df[1:(dim(df)[1]),i]))
      colnames(DF[[i]]) = rownames(df)
      rownames(DF[[i]]) = c("Max","Min",colnames(df)[i])
      
    }
    DF 
    
    cls=list()
    for(i in colnames(df)){
      cls[[i]] = round(seq(round(min(df[,i]),digits = 2),round(max(df[,i]),digits = 2),length.out = 5),digits = 2)
    }
    
    # device .... there are multiple options 
    
    #ifelse(missing(col2),2:dim(DD)[1],col2)
    
    par(mar=c(1.5,0,2.5,0))
    col2 = ifelse(missing(col2), "dodgerblue", col2)
    for(i in seq_along(DF)){
      fn = par(family = Ftext)
      radarchart(DF[[i]],
                 title = rownames(DF[[i]])[3],
                 axislabcol = "black",
                 cglcol = col1,
                 pcol = col2, pfcol = scales::alpha(col2, 0.5),
                 cglty = 7, cglwd = 1, vlcex=1.5,plwd = 1.3,calcex = 1.5,axistype = 1,
                 caxislabels = cls[[i]],cex.main = 2.3)
      par(fn) 
    }
    
  } else {
    R = preProcess(df, method = "range")
    df = predict(R,df)
    df = as.data.frame(df)
    Max = c();Min = c()
    
    for(i in colnames(df)){
      Max[i] = max(df[,i])
      Min[i] = min(df[,i])
      DD = rbind(Max,Min,df)
      rownames(DD)[1:2] = c("Max","Min")
      cls = round(seq(min(DD),max(DD),length.out = 5), digits = 2)
    }
    
    fn=par(family = Ftext)
    radarchart(DD,
               title = MV,
               axislabcol = "black",
               pcol = 2:dim(DD)[1],
               cglcol = col1,
               pfcol = scales::alpha(2:dim(DD)[1],0.4),
               cglty = 7,cglwd = 2,vlcex = 2,plty = 1,
               plwd = 3,calcex = 1.5, axistype = 1,
               caxislabels = cls,cex.main = 2.3)
    
    legend("topright",
           legend = paste(rownames(DD)[-(1:2)]),
           bty = "n",
           col = 2:dim(DD)[1],
           pch = 19,
           cex = 2,
           pt.cex = 2)
    par(fn)
  }
}

save(RadChart,file = "RadChart.Rdata")
load("RadChart.Rdata")    
