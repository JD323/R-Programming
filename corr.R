corr <- function(directory, threshold = 0) {
      ## 'directory' is a character vector of lenth 1 indicating
      ## the location of the CSV files
      
      ## 'threshold' is a numeric vector of length 1 indicating the
      ## number of completely observed observations (on all
      ## variables) required to compute the correlation between
      ## nitrate and sulfate; the default is 0
      
      ## Return a numeric vector of correlations
      
      # create empty vector of correlations
      corrs <- vector()
      
      # create empty data frame
      data <- data.frame()    
      
      # create list of files from directory
      filelist <- list.files(directory, full.names = TRUE)
      
      # loop through all monitors to be tested
      for (i in 1:length(filelist)) {
            file_to_test <- read.csv(filelist[i]) # read monitor to test
            ok <- complete.cases(file_to_test) # create vector of complete             cases for monitor being tested
      
            # if number of complete cases is at or above threshold, add data to data frame
            if (sum(ok) >= threshold) {
                  corrs <- append(corrs, cor(file_to_test$nitrate, file_to_test$sulfate, use = "na.or.complete"))
            }
      }

      corrs # return vector of correlations
}