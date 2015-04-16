pollutantmean <- function(directory, pollutant, id = 1:332) {
      ## 'directory' is a character vector of lenth 1 indicating
      ## the location of the CSV files
      
      ## 'pollutant' is a character vector of length 1 indicating 
      ## the name of the pollutant for which we will calculate the 
      ## mean; either "sulfate" or "nitrate"
      
      ## 'id' is an integer vector indicating the monitor ID numbers
      ## to be used
      
      ## Return the mean of the pollutant across all monitors listed
      ## in the 'id' vector (ignoring NA values)
      
      
      filelist <- list.files(directory, full.names = T)     # generate list of files in directory
      data <- data.frame()    # create empty data frame
      for (i in 1:length(id)) {
            # loop through all user-defined files, rbind them together
            data <- rbind(data, read.csv(filelist[id[i]]))
      }
      mean(data[,pollutant], na.rm = T)   # return mean, ignoring NA values
}