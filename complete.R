complete <- function(directory, id = 1:332) {

	files_list <- list.files(directory,full.name = TRUE)

	dat <- data.frame()
	df  <- data.frame()
	for (i in id){
		df <- data.frame(ID = i, COUNT = sum(complete.cases(read.csv(files_list[i]))))
		dat <- rbind(dat,df)
	}

	print(dat)
}
