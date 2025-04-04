## code to prepare `DATASET` dataset goes here

####################################################################################
##
## Script name: example data
##
## Purpose of script: to make example data to be used for reference by package users
##
## Author: Natasha Besseling
##
## Date Created: 2024-10-32
##
#####################################################################################
###libraries
library(tidyverse)
library(readxl)

### load data


## bar graph
NBA_example_bar_plot <- read_excel(
  dir("data",
      "Fig1a_graph.xlsx",
      full.names = T,
      recursive = T))%>%
  slice_head(n =8) %>%
  mutate(across(2:6, as.numeric))

##RLI graph
NBA_example_RLI_plot <- read_excel(
  dir("data",
      "Fig6_graph_part.xlsx",
      full.names = T,
      recursive = T))%>%
  select(-c(5:6))


## donut
NBA_example_donut_plot <- Fig61mapinset <- read_excel(
  dir("data-raw",
      "Fig61mapinset_graph.xlsx",
      full.names = T,
      recursive = T))%>%
  slice_head(n =8)%>%
  mutate(across(2:5, as.numeric)) %>%
  dplyr::select(1:5)


##threat status/ protection level categories

NBA_categories <- c("Natural",
                    "Natural/near-natural",
                    "Near-natural",
                    "Moderately modified",
                    "Heavily modified",
                    "Severely/critically modified",
                    "Well Protected",
                    "Moderately Protected",
                    "Poorly Protected",
                    "No Protection",
                    "Not Protected",
                    "Extinct",
                    "Critically Endangered",
                    "Endangered",
                    "Vulnerable",
                    "Near Threatened",
                    "Data Deficient",
                    "Rare",
                    "Least Concern",
                    "Cropland",
                    "Plantation",
                    "Built up",
                    "Mine",
                    "Artificial waterbody")

### turn into correct format
usethis::use_data(NBA_example_bar_plot)
usethis::use_data(NBA_example_RLI_plot)
usethis::use_data(NBA_example_donut_plot)
usethis::use_data(NBA_categories)

##create a folder for this script
#usethis::use_data_raw()

#####################################################################################
### unload packages

# detach("package:xxx", unload=TRUE)

