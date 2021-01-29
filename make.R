source("R/packages.R")  # loads packages
source("R/functions.R") # defines the create_plot() function
source("R/plan.R")      # creates the drake plan
source("R/data_plan.R") # creates a drake plan for pulling and checking Aureococcus data


make(
  plan
)

make(
  data_plan
)