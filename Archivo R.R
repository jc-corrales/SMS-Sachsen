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

for (i in c(0,10,20,30,40,50,60,70,80,90,100))
{
  for(j in c(0:1)
  {
    tempX = paste(i,",",j)
    tempY = paste(i,",",j)
    if(i>0 & j == 0)
    {#Caso 1
      tempX2 = paste(i-10,",",1)
      tempY2 = paste(i-10,",",1)
      matrizQ[tempX,tempY]=lambda
    }
    if(i<i & j == 1)
    {#Caso 2
      tempX2 = paste(+10,",",1)
      tempY2 = paste(i+10,",",1)
      matrizQ[tempX,tempY]=mu
    }
    if(j == 0)
    {#Caso 3
      tempX2 = paste(i,",",1)
      tempY2 = paste(i,",",1)
      matrizQ[tempX,tempY]=mu
    }
    if(i<1 & j == 1)
    {#Caso 4
      tempX2 = paste(i,",",0)
      tempY2 = paste(i,",",0)
      matrizQ[tempX,tempY]=mu
    }
    else
    {#Caso 6
      mat2[i,j] = 0
    }
  }
}

type(matrizQ)
