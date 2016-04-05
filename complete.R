complete <- function (dir, id = 1:332) {
  # Read file names from dir
  fns = list.files(dir,full.names = TRUE, include.dirs = FALSE)

  # Prepare empty data frame  
  v_cc_id <- c()
  v_cc_sum <- c()
  
  # Loop to get file names
  for(f in id) {
    # Read file into data frame
    df <- read.csv(fns[f])
    
    # Compute complete cases 
    cc <- complete.cases(df)
    
    # Get count of complete cases 
    sum_cc <- sum(cc)
    
    # Append to vectors 
    v_cc_id <- c(v_cc_id,f)
    v_cc_sum <- c(v_cc_sum,sum_cc)
  }
  
  # Prepare data frame with header "id", "nobs"
  data.frame(id = v_cc_id, nobs = v_cc_sum)
}
