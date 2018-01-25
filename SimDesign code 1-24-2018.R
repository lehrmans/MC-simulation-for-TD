#SimDesign code
#Define the functions Design, Generate, Analyse, and Summarise
#Pass these functions into runSimulation to perform the Monte Carlo


#~~~~~Design function~~~~~

#This just creates two data frames with two groups of three sample sizes
Design <- data.frame(sample_sizes1 = c(4, 15, 30), sample_sizes2 = c(4, 15, 30))


#~~~~~Generate function~~~~~~

#The two mygenerate functions below are attempting to generate two groups of data
#with each group having the number of data points in the Design data.frame abova
#but I keep getting an error code so idk

#This code uses the condition$ thingie
mygenerate <- function(condition, fixed_objects = NULL){
  N1 <- condition$sample_sizes1
  N2 <- condition$sample_sizes2
  
  group1 <- rnorm(N1)
  group2 <- rnorm(N2)
  dat <- data.frame(group = c(rep('g1', N1), rep('g2', N2)),
                    DV = c(group1, group2))
  
  list(dat=dat)
}


#This code uses the Attach() function
mygenerate <- function(condition, fixed_objects = NULL){
  Attach(condition)
  N1 <- sample_sizes1
  blob <- typeof(N1) #delete
  print(blob) #delete
  print(N1) #delete
  N2 <- sample_sizes2
  
  group1 <- rnorm(N1)
  print(group1)
  group2 <- rnorm(N2)
  
  Ni1 <- as.integer(N1)
  print(typeof(Ni1)) #delete
  Ni2 <- as.integer(N2)
  
  dat <- data.frame(group = c(rep('g1', Ni1), rep.int('g2', Ni2)),
                    DV = c(group1, group2))
  
  list(dat=dat)
}

#This generate function works lol
Generate <- function(condition, fixed_objects = NULL){
  dat <- rnorm(n = condition$sample_size, mean = 10, sd = 2)
}

#~~~~~Analyse function~~~~~

#This is the template code included in the tutorial
#It just analyzes the mean
Analyze <- function(condition, dat, fixed_objects = NULL){
  ret <- mean(dat)
  ret
}


#~~~~~Summarize~~~~

#Also template code
#Compiles analysis into table
Summarize <- function(condition, results, fixed_objects = NULL){
  c_mean <- mean(results)
  c_se <- sd(results)
  ret <- c(mu = c_mean, se = c_se)
  
  ret
}

#the actual simulation
results <- runSimulation(design = Design, replications = 1000, generate = Generate, analyse = analyze, summarise = Summarize, edit = 'none')
