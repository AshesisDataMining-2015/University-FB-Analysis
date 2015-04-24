#Author: Phoebe Priscilla Amoako
#On 22nd April, 2015

#Read all the data sets, assigning them to different frames
#Set the working directory to the one with the csv files in it
setwd("~/SENIOR/Data Mining/Final Project/Wheaton College")
w_pcl = read.csv("Wheaton Posts' Comments and Likes.csv",header=TRUE)
w_p = read.csv("Wheaton Posts Only.csv", header=TRUE)
w_pl = read.csv("Wheaton Posts and Likes.csv", header=TRUE)

setwd("~/SENIOR/Data Mining/Final Project/Olin College of Engineering")
o_pcl = read.csv("Olin Posts' Comments and Likes.csv",header=TRUE)
o_p = read.csv("Olin Posts Only.csv", header=TRUE)
o_pl = read.csv("Olin Posts and Likes.csv", header=TRUE)

setwd("~/SENIOR/Data Mining/Final Project/Ashesi University College")
a_pcl = read.csv("Ashesi Posts' Comments and Likes.csv",header=TRUE)
a_p = read.csv("Ashesi Posts Only.csv", header=TRUE)
a_pl = read.csv("Ashesi Posts and Likes.csv", header=TRUE)

#Wheaton college

#clean data
test <- data.frame(matrix(nrow = 50, ncol = 3))
c <- 4
c1 <- 1
c2 <- 8
r <- 1
r1 <- 0
m <- 0
f <- 0
nrow(w_pl)

while (w_pl[r,3] != "weight INT"){
  if(w_pl[r,c] != "user"){
    r1 <- r1 + 1
    test[r1,c1] <- w_pl[r,c]
    r <- r + 1
    while (w_pl[r,c] == "user"){
      if (w_pl[r,c2] == "female")
        {f <- f + 1}
      if (w_pl[r,c2] == "male")
        {m <- m + 1}
      r <- r + 1
    }
    test[r1,2] <- f
    test[r1,3] <- m
  }
  f <- 0
  m <- 0
}
test
levels <- levels(w_pl$type_post.VARCHAR)
test <- aggregate(test, by=list(test[,1]), FUN=sum)
test$X1 <- NULL
values <- c()
x <- 1
while (x <= nrow(test)){
  values<- append(values, test[x,2])
  values<- append(values, test[x,3])
  x <- x + 1
}
x <- 1
post_type <- c()
while (x <= nrow(test)){
  post_type<- append(post_type, levels[test[x,1]])
  x <- x + 1
}

#plot graphs
sex <- c()
sex <- append (sex, "females")
sex <- append (sex, "males")

gender <- matrix(values,ncol=2,byrow=TRUE)
colnames(gender) <- sex
rownames(gender) <- post_type
barplot(gender, main="Gender Distribution Based on Post Type",
        ylab="frequency", xlab="Wheaton College", col=c("red","yellow", "green"),
        legend = rownames(gender), beside=TRUE)

#olin college of engineering

#clean data
test <- data.frame(matrix(nrow = 50, ncol = 3))
c <- 4
c1 <- 1
c2 <- 8
r <- 1
r1 <- 0
m <- 0
f <- 0
nrow(w_pl)

while (o_pl[r,3] != "weight INT"){
  if(o_pl[r,c] != "user"){
    r1 <- r1 + 1
    test[r1,c1] <- o_pl[r,c]
    r <- r + 1
    while (o_pl[r,c] == "user"){
      if (o_pl[r,c2] == "female")
      {f <- f + 1}
      if (o_pl[r,c2] == "male")
      {m <- m + 1}
      r <- r + 1
    }
    test[r1,2] <- f
    test[r1,3] <- m
  }
  f <- 0
  m <- 0
}
test
levels <- levels(w_pl$type_post.VARCHAR)
test <- aggregate(test, by=list(test[,1]), FUN=sum)
test$X1 <- NULL
test <- test[c(-3,-5),]
values <- c()
x <- 1
while (x <= nrow(test)){
  values<- append(values, test[x,2])
  values<- append(values, test[x,3])
  x <- x + 1
}
x <- 1
post_type <- c()
while (x <= nrow(test)){
  post_type<- append(post_type, levels[test[x,1]])
  x <- x + 1
}

#plot graphs
sex <- c()
sex <- append (sex, "females")
sex <- append (sex, "males")

gender <- matrix(values,ncol=2,byrow=TRUE)
colnames(gender) <- sex
rownames(gender) <- post_type
barplot(gender, main="Gender Distribution Based on Post Type",
        ylab="frequency", xlab="Olin College of Engineering", col=c("red","yellow", "green"),
        legend = rownames(gender), beside=TRUE)

#ashesi univesity college

#clean graphs
test <- data.frame(matrix(nrow = 50, ncol = 3))
c <- 4
c1 <- 1
c2 <- 8
r <- 1
r1 <- 0
m <- 0
f <- 0
nrow(a_pl)

while (a_pl[r,3] != "weight INT"){
  if(a_pl[r,c] != "user"){
    r1 <- r1 + 1
    test[r1,c1] <- a_pl[r,c]
    r <- r + 1
    while (a_pl[r,c] == "user"){
      if (a_pl[r,c2] == "female")
      {f <- f + 1}
      if (a_pl[r,c2] == "male")
      {m <- m + 1}
      r <- r + 1
    }
    test[r1,2] <- f
    test[r1,3] <- m
  }
  f <- 0
  m <- 0
}
test
levels <- levels(w_pl$type_post.VARCHAR)
test <- aggregate(test, by=list(test[,1]), FUN=sum)
test$X1 <- NULL
values <- c()
x <- 1
while (x <= nrow(test)){
  values<- append(values, test[x,2])
  values<- append(values, test[x,3])
  x <- x + 1
}
x <- 1
post_type <- c()
while (x <= nrow(test)){
  post_type<- append(post_type, levels[test[x,1]])
  x <- x + 1
}
 #plot graphs
sex <- c()
sex <- append (sex, "females")
sex <- append (sex, "males")

gender <- matrix(values,ncol=2,byrow=TRUE)
colnames(gender) <- sex
rownames(gender) <- post_type
barplot(gender, main="Gender Distribution Based on Post Type",
        ylab="frequency", xlab="Ashesi University College", col=c("red","yellow", "green"),
        legend = rownames(gender), beside=TRUE)
