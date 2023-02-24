############################### README ###################################
#
# This script is part of the workshop: Reusable Research Data Made Shiny
# from February 21st to 24th, 2023
# GitHub Page: https://github.com/agrifooddatacanada/RRDMS_Workshop
# Adapted from: https://mastering-shiny.org
#
# Day 4, Session 1
# Instructor: Lucas Alcantara, PhD
# Contact: alcantal@uoguelph.ca
#
######################################################################## #

library(shiny)
library(readr)
library(dplyr)

animal_names <- c("Atlantic Walrus", "Bowhead Whale", "Giant Panda", "Monarch Butterfly", "North Atlantic Right Whale")
animal_values <- c("atlantic_walrus", "bowhead_whale", "giant_panda", "monarch_butterfly", "north_atlantic_right_whale")