library(tidyverse)


# Load and tidy data ------------------------------------------------------

raw_data <- read.csv("data/raw_data/Heart.csv")

clean_data <- select(raw_data, -X)

clean_data <- drop_na(clean_data)

write.csv(clean_data, "data/clean_data/heart.clean.csv")


# Split data --------------------------------------------------------------

train <- sample(1:nrow(heart), nrow(heart) * 0.7)

test <- -train


# Analyze data ------------------------------------------------------------

fit <- randomForest(AHD ~ ., data = heart, subset = train, importance = TRUE,
                    xtest = heart[test, -ncol(heart)], ytest = heart[test, "AHD"])

print(fit)

plot(fit)

varImpPlot(fit)
