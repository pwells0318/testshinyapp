library(shiny)
library(shinyWidgets)

server <- function(input, output) {
  
  output$boxplot <- renderPlot({
    
    a=rnorm(50000 , mean=0 , sd=30)
    b=rnorm(50000 , mean=40 , sd=100)
    c=rnorm(50000 , mean=100 , sd=50)
    d=rnorm(50000 , mean=20 , sd=20)
    e=rnorm(50000 , mean=30 , sd=60)
    f=rnorm(50000 , mean=100 , sd=30)
    g=rnorm(50000 , mean=20 , sd=25)
    h=rnorm(50000 , mean=40 , sd=100)
    
    apoint = 25
    bpoint = 75
    cpoint = 60
    dpoint = 10
    epoint = 35
    fpoint = 175
    gpoint = 20
    hpoint = 20
    
    #margins around box plot
    par(mar=c(5,4,2,2))
    
    #Make the boxplot
    boxplot(a,b,c,d,e,f,g,h, 
            xlab="Risk Characteristic" , 
            ylab="Factor" ,
            ylim=c(-300,300),
            xlim=c(1,8),
            col=cm.colors(8),
            names = c("Char 1", "Char 2", "Char 3", "Char 4", "Char 5", "Char 6", "Char 7", "Char 8"),
            outline = FALSE
    )
    
    #add scatter plot of factors of the input risk to overlay the box plots
    par(new=TRUE)
    plot(1:8, 
         c(apoint,bpoint,cpoint,dpoint,epoint,fpoint,gpoint,hpoint), 
         axes=FALSE, 
         ylab="", 
         xlab="", 
         ylim=c(-300,300), 
         xlim = c(1,8), 
         lwd = 5,
         col="blue"
    )
    abline( h=seq(-300,300,50), 
            v=seq(1,8) , 
            col="grey80",
            lty="dotted",
            lwd = 0.4)
  })
  
}