library(tidyverse)
library(gtsummary)
library(easystats)
library(gt)

# read data
data <- readxl::read_xlsx("raw_data/AMR_KAP_Data.xlsx", sheet=2)

# Demographic characteristics of study participants 
data |> 
  select(1:11) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("tables/Table1_Demographics.docx")

# Rename variable
data <- data |> 
  rename(Others = Others...49)

# Major sources of information about antibiotic parents 
data |> 
  select(41:49) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("tables/Table2_Sources.docx")


# Level of KAP towards antibiotic resistance among parents

data |> 
  select(46:48) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("tables/Table3_KAPLevel.docx")

# Factors associated with the level of knowledge among parents  
data |> 
  select(1:9) |> 
  tbl_summary(
    type = c(1:9) ~ "categorical",
  by = 46)


  as_gt() |> 
  gtsave("tables/Table4_FactorsKnowledge.docx")

