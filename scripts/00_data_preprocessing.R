#load packages
library(tidyverse)
library(easystats)
library(gtsummary)
library(gt)
library(naniar)

#read data
data <- readxl::read_xlsx("raw_data/AMR_KAP_Data.xlsx", sheet=2)


#check missing data
sum(is.na(data))
miss_var_summary(data)
gg_miss_var(data)




# knowledge level grouping

data <- data |> 
  mutate(Knowledge_Level = case_when (
    KnowledgePCT < 35 ~ "Poor",
    KnowledgePCT >= 35 & KnowledgePCT < 60 ~ "Moderate",
    KnowledgePCT >= 60 ~ "Good"
  ))


# Attitude level grouping
data <- data |> 
  mutate(Attitude_Level = case_when (
    AttitudePCT >= 80 ~ "Positive",
    AttitudePCT >= 50 & AttitudePCT < 80 ~ "Uncertain",
    AttitudePCT < 50 ~ "Negative"
  ))


# Practice level grouping
data <- data |> 
  mutate(Practice_Level = case_when (
    PracticePCT < 80 ~ "Misuse",
    PracticePCT >= 80 ~ "Good"
  ))


