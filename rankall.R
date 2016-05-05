rankall <- function (outcome,num = "best") {
    outcome.data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings = "Not Available")
    
    sub_outcome = outcome.data[,c("Hospital Name" = 2,"State" = 7, "heart attack" = 11, "heart failure"=17, "pneumonia"=23)]
    names(sub_outcome) = c("Hospital Name","State", "heart attack", "heart failure", "pneumonia")             
    
    sub_outcome = sub_outcome[,c("State","Hospital Name",outcome)]
    sub_outcome [,outcome] = as.numeric(sub_outcome[,outcome])
    sub_outcome = sub_outcome[order(sub_outcome[,1],sub_outcome[,3],sub_outcome[,2]),]
    s = split(sub_outcome,sub_outcome$State)
    
    
    if (num == "best"){
        num = 1
    }
    else if (num == "worst"){
        num = nrow(sub_outcome)
    }
    lapply(s, function(x) x[num,c(2,1)])
          
}


