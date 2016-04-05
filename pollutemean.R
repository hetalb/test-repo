pollutemean <- function(dir, pollutant, id = 1:332) {
  # Read file names from dir
  fns = list.files(dir,full.names = TRUE, include.dirs = FALSE)

  # Prepare empty data frame  
  total_df <- data.frame()

  # Loop to get file names
  for(f in fns[id]) {
    # Read files 
    df <- read.csv(f)
    total_df <- rbind(total_df, df)
  }
  
  # find mean for all files, exclude NAs 
  mean_poll <- mean(total_df[[pollutant]], na.rm = TRUE)
  print (mean_poll)
}

