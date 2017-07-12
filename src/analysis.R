library(tidyverse)

raw_data <- read.csv("data/raw_data/Heart.csv")

clean_data <- select(raw_data, -X)

clean_data <- drop_na(clean_data)

write.csv(clean_data, "data/clean_data/heart.clean.csv")
