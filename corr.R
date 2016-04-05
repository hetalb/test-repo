corr <- function(dir, threshold = 0) {
  # Read file names from dir
  fns = list.files(dir,full.names = TRUE, include.dirs = FALSE)

  total_crr <- c()
  
  # Loop to get file names
  for(f in 1:332) {
    # Read file into data frame
    df <- read.csv(fns[f])
    
    # Compute complete cases 
    cc <- complete.cases(df)
    
    # Get count of complete cases 
    sum_cc <- sum(cc)
   
    if(sum_cc > threshold) {
      crr <- cor(df$sulfate,df$nitrate, use ="complete.obs")
      total_crr <- c(total_crr, round(crr,4))
    }
  }
  return(total_crr)
}
