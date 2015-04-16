complete <- function(directory, id = 1:332) {
      ## 'directory' is a character vector of lenth 1 indicating
      ## the location of the CSV files
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return a data frame of the form:
      ## id nobs
      ## 1  117
      ## 2  1041
      ## ...
      ## where 'id' is the monitor ID number and 'nobs' is the
      ## number of complete cases
      
      # create empty vector 
      nobs <- vector()
      
      # create list of files from directory
      filelist <- list.files(directory, full.names = TRUE)
      
      # loop through all monitors to be tested
      for (i in 1:length(id)) {
            file_to_test <- read.csv(filelist[id[i]]) # read monitor to test
            ok <- complete.cases(file_to_test) # create vector of complete cases for monitor being tested
            nobs<- rbind(nobs, sum(ok)) # add sum of complete cases to nobs vector
      }
      
      nobs_data <- data.frame (id, nobs) # create data frame from ID and nobs vectors
      nobs_data # return nobs data frame
}