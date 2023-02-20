############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
#
# Day 3, Session 3
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

# Install required packages ----
# install.packages("tidyverse")

# Load required packages ----
library(tidyverse)

# Toy data ----
## Load with readr ----
env_data_raw <- read_csv("data/environmental_data_raw.csv") 
env_data_raw

# pivot_longer() ----
## Example ----
### Pivot inside temperature from wide to long format ----
env_data_raw %>%
  pivot_longer(cols = starts_with("sensor_"),
               values_to = "temp",
               names_to = "sensor",
               names_prefix = "sensor_")

## Change sensor data type from character to integer ----
env_data_raw %>%
  pivot_longer(cols = starts_with("sensor_"),
               values_to = "temp",
               names_to = "sensor",
               names_prefix = "sensor_",
               names_transform = list(sensor = as.integer))

## Your turn ----
# Using the tidyverbs from last session, summarize env_data_raw to show 
# date, time, barn, rh, outside_rh, and avg_temp (the average temperature
# across all sensors per day, time and barn).
env_data_raw %>%
  pivot_longer(cols = starts_with("sensor_"),
               values_to = "temp",
               names_to = "sensor",
               names_prefix = "sensor_",
               names_transform = list(sensor = as.integer)) %>%
  group_by(date, time, barn, rh, outside_rh, outside_temp) %>% 
  summarize(avg_temp = mean(temp))

### Bonus round ----
# Using pivot_longer(), create a table that shows date, time, barn, location, 
# sensor_type, value, where:
# 1. date, time, and barn remains the same
# 2. location indicates if the sensor was inside or outside the barn
# 3. sensor indicates if the sensor was measuring either rh or temp,
# 4. value contains their respective measurements
env_data_raw %>%
  pivot_longer(cols = starts_with("sensor_"),
               values_to = "temp",
               names_to = "sensor",
               names_prefix = "sensor_",
               names_transform = list(sensor = as.integer)) %>%
  group_by(date, time, barn, rh, outside_rh, outside_temp) %>% 
  summarize(avg_temp = mean(temp)) %>%
  rename(inside_rh = rh,
         inside_temp = avg_temp) %>%
  pivot_longer(contains("side"), 
               names_to = c("location", "sensor_type"), 
               names_sep = "_", 
               values_to = "value")

## pivot_wider() ----
### Your turn ----
# Use pivot_wider() to continue reorganizing env_data_raw by transforming 
# sensor_type and value into two columns (rh and temp) with their respective values
env_data_raw %>%
  pivot_longer(cols = starts_with("sensor_"),
               values_to = "temp",
               names_to = "sensor",
               names_prefix = "sensor_",
               names_transform = list(sensor = as.integer)) %>%
  group_by(date, time, barn, rh, outside_rh, outside_temp) %>% 
  summarize(avg_temp = mean(temp)) %>%
  rename(inside_rh = rh,
         inside_temp = avg_temp) %>%
  pivot_longer(contains("side"), 
               names_to = c("location", "sensor_type"), 
               names_sep = "_", 
               values_to = "value") %>%
  pivot_wider(names_from = "sensor_type",
              values_from = "value")
