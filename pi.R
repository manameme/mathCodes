#finding

# Number of points 
N = 1000000

#square dimensions
y_bound_sq_up = 1
y_bound_sq_down = 0
x_bound_sq_r = 1
x_bound_sq_l = 0

#circle dimensions
centre_x = 0.5
centre_y = 0.5
radius = 0.5

genPointsSquare <- function(x_from, x_to, y_from, y_to)
{
  x = runif(1, min = x_from, max = x_to)
  y = runif(1, min = y_from, max = y_to)
  return(c(x, y))
}

genPointsSquare(x_bound_sq_l, x_bound_sq_r, y_bound_sq_down, y_bound_sq_up)

#incircle?
isItInTheCircle <- function(centre, rad, point)
{
  c_x = centre[1]
  c_y = centre[2]
  point_x = point[1]
  point_y = point[2]
  dis = sqrt((c_x - point_x)^2 + (c_y - point_y)^2)
  return(ifelse(dis <= rad, TRUE, FALSE))
}

isItInTheCircle( centre = c(5, 5), rad = 3, point = c( 7, 5)) 

inside = 0
for(i in 1:N)
{
  #1. Gnerate a point
  point <- genPointsSquare(x_bound_sq_l, x_bound_sq_r, y_bound_sq_down, y_bound_sq_up)
  
  #2. Chek if in the circle
  tOrf = isItInTheCircle( c(centre_x, centre_y), radius ,point)
  
  if(tOrf == TRUE)
  {
    inside = inside + 1
  }
  
}

ratio = inside/N

pivalue = ratio/(radius^2)

round(pivalue, 10)




