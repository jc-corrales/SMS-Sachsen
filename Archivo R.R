library(markovchain)
library(expm)

lambda<- 1
mu <- 2
rho<- 3
gamma<- 4

estadosCarga<-c(0,10,20,30,40,50,60,70,80,90,100)
estadosBooleano<-c(0:1)
estados=as.vector(outer(estadosBooleano, estadosCarga, paste, sep=","))
estados
matrizQ<-matrix(0,nrow=length(estados),ncol=length(estados))
colnames(matrizQ)=estados
rownames(matrizQ)=estados

for (i in estadosCarga)
{
  for(j in estadosBooleano)
  {
    tempY = outer(j, i, paste, sep=",")
    if(i>0 & j == 0)
    {#Caso 1
      tempX =outer(0, i-10, paste, sep=",")
      
      matrizQ[tempY,tempX]=lambda
    }
    if(i<100 & j == 1)
    {#Caso 2
      tempX = outer(1, i+10, paste, sep=",")
      
      matrizQ[tempY,tempX]=mu
    }
    if(j == 0)
    {#Caso 3
      tempX = outer(1, i, paste, sep=",")
      matrizQ[tempY,tempX]=rho
    }
    if(i>=70 & j == 1)
    {#Caso 4
      tempX = outer(0, i, paste, sep=",")
      matrizQ[tempY,tempX]=gamma
    }
  }
}

for (i in 1: length(estados)){
  #Diagonal
  matrizQ[i,i]=-sum(matrizQ[i, ])
}

CMTC <- new(Class="ctmc", states = as.character(estados), byrow = TRUE, generator = matrizQ)

plot(CMTC, edge.arrow.size=0.5)

