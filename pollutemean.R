pollutemean <- function(dir, pollutant, id = 1:332) {
  # Read file names from dir
  fns = list.files(dir,full.names = TRUE, include.dirs = FALSE)
  
  # Get length of vector "id" to get number of files
  len <- length(id)
  
  total_df <- data.frame()
  # Loop to get file names
  for(f in fns[id]) {
    # Read files 
    df <- read.csv(f)
    total_df <- rbind(total_df, df)
  }
  mean_poll <- mean(total_df[[pollutant]], na.rm = TRUE)
  print (mean_poll)
}
