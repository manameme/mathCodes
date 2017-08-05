library(ggplot2)


line1 <- function(x)
{
   y = (12/5) - (2/5)*x
   return(y)
}

line2 <- function(x)
{
  y = (3/10) * x + (17/10)
  return(y)
}


#test : line1 x = 0 ke liye y = 2.4
line1(0)


x    = seq(from = -10,to = 10, by = 0.5)
y_1 =   line1(x)
plot(x,y_1, type = "l")

y_2 =   line2(x)
plot(x,y_2, type = "l")

datTab1 <- data.frame("x" = x, "y" = y_1, "type" = "line1")
datTab2 <- data.frame("x" = x, "y" = y_2, "type" = "line2")
dataTab <- rbind(datTab1, datTab2)
# Basic line graph with points
ggplot(data=dataTab, aes(x=x, y=y, group=type, color = type)) +
  geom_line() +
  geom_point()

