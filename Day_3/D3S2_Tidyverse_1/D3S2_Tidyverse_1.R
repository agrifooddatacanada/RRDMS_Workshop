############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
#
# Day 3, Session 2
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

# Install required packages ----
# install.packages("dplyr")
# install.packages("readr")
# install.packages("skimr")
# install.packages("tidyr")
# install.packages("lubridate")

# Load required packages ----
library(dplyr)
library(readr)
library(skimr)
library(tidyr)
library(lubridate)

# Toy data ----
## Load with readr ----
env_data <- read_csv("data/environmental_data.csv") 

## Take a look at the data with skimr ----
env_data
skim(env_data)

# filter() ----
## Example ----
### Filter for lactating barn temperatures only ----
filter(env_data, barn == "lactating")

## Your turn ----
### From inside the barn ----

### Above 30C ----

### Between 0 and 10C inside the replacement barn ----

### From June 3, 2022, or June 4, 2022 ----


# select() ----
## Example ----
### Select temp column ----
select(env_data, date, time, barn, location, temp)
### Select a range of columns (:) ----
select(env_data, date:location)
### Select every column but (-) ----
select(env_data, -rh)
### Select columns that start with … (starts_with()) ----
select(env_data, starts_with("t"))
### Select columns that end with … (ends_with()) ----
select(env_data, ends_with("e"))

## Your turn ----
### Relative humidity from inside the Special Needs barn ----

# arrange() ----
## Example ----
### Order by temp ----
arrange(env_data, temp)
### Order by temp descending ----
arrange(env_data, desc(temp))
### Order by temp and use rh as tie breaker ----
arrange(env_data, temp, rh)

# Pipe operator %>% ----
## Examples ----
# Relative humidity from inside the Special Needs barn, 
# ordered ascending by relative humidity
sp_needs <- filter(env_data, barn == "sp_needs", location == "inside")
sp_needs <- select(sp_needs , date, time, rh)
sp_needs <- arrange(sp_needs, rh)

sp_needs <- arrange(select(filter(env_data, barn == "sp_needs",
                                  location == "inside"), date, time, rh), rh)

filter(env_data, barn == "sp_needs", location == "inside")
env_data %>% filter(barn == "sp_needs", location == "inside")

## Your turn ----
# Use filter(), select(), arrange() and the pipe operator %>% to show only 
# relative humidity from inside the Special Needs barn, 
# ordered ascending by relative humidity

# summarise() ----
## Example ----
env_data %>% 
  summarize(avg_temp = mean(temp),
            max_temp = max(temp))

env_data %>% filter(is.na(temp))

env_data %>% 
  summarize(avg_temp = mean(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))

## Your turn ----

# group_by ----
## Example ----
# Without groups
env_data %>% 
  summarize(min_temp = min(temp, na.rm = TRUE),
            avg_temp = mean(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))
# With groups
env_data %>% 
  group_by(barn, location) %>% 
  summarize(min_temp = min(temp, na.rm = TRUE),
            avg_temp = mean(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))

# Sample 2 random observations from each group and save dataframe
set.seed(123)
sampled_env_data <- env_data %>% 
  group_by(barn, location) %>% 
  slice_sample(n = 2) %>% 
  select(-c(date,time)) %>%
  ungroup()

# Summarize sampled data
sampled_env_data %>% 
  summarize(min_temp = min(temp, na.rm = TRUE),
            avg_temp = mean(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))

# Summarize sampled data by barn and location
sampled_env_data %>% 
  group_by(barn, location) %>% 
  summarize(min_temp = min(temp, na.rm = TRUE),
            avg_temp = mean(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))

## Your turn ----

# mutate() ----
## Example ----
env_data %>% 
  mutate(year = lubridate::year(date),
         month = lubridate::month(date),
         day = lubridate::day(date),
         barn = dplyr::if_else(barn == "sp_needs", "special_needs", barn))

## Your turn ----
# Using the functions from today, create the following table to answer 
# our ultimate question: Are the temperatures inside the barns 
# milder than outside?
