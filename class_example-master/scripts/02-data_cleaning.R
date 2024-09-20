#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Mingxuan Liu
# Date: 19 September 2024
# Contact: mingxuan.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("Downloads/class_example-master/data/raw_data/raw_data.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
            into = c("year", "month"),
            sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
         )
  
#### Save data ####
write_csv(cleaned_data, "Downloads/class_example-master/data/analysis_data/analysis_data.csv")
