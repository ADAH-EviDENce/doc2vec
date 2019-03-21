prvec <- function(f) {
  df <- read.csv(f)
  retrieved_relevant <- df$EINDOORDEEL_janee == 'ja'
  cumsum(retrieved_relevant) / seq(1,length(retrieved_relevant))
}

prplot <- function(color,f) {
    lines(prvec(f),col=color)
}

mean_prvec <- function(fs) {
  v <- rep(0,183)
  for (f in fs) {
    v <- v + prvec(f)
  }
  v / 183
}

setwd('~/Research/EviDENce/ML/evaluation_data/single_pass_retrieval/')
plot(c(),xlim=c(0,182),ylim=c(0,1),ylab="Precision")
sapply(list.files('.')[-15], function(f){prplot(rgb(0,0,0,alpha=0.1),f)})
lines(mean_prvec(list.files('.')[-15])[1:182],type="l",lwd="2",col="black")

setwd('~/Research/EviDENce/ML/evaluation_data/goldstandard_relevance_feedback_pass/')
plot(c(),xlim=c(0,182),ylim=c(0,1),ylab="Precision")
sapply(list.files('.')[-15], function(f){prplot(rgb(0,0,0,alpha=0.1),f)})
lines(mean_prvec(list.files('.')[-15])[1:182],type="l",lwd="2",col="black")

setwd('~/Research/EviDENce/ML/evaluation_data/single_pass_retrieval/')
plot(c(),xlim=c(0,182),ylim=c(0,1),ylab="Precision")
sapply(list.files('.')[-15], function(f){prplot(rgb(1,0,0,alpha=0.1),f)})
lines(mean_prvec(list.files('.')[-15])[1:182],type="l",lwd="2",col="red")

setwd('~/Research/EviDENce/ML/evaluation_data/goldstandard_relevance_feedback_pass/')
sapply(list.files('.')[-15], function(f){prplot(rgb(0,0,1,alpha=0.1),f)})
lines(mean_prvec(list.files('.')[-15])[1:182],type="l",lwd="2",col="blue")

