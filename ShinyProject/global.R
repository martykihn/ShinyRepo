library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)

joined = read.csv(file = "./Data/joined_data_1106.csv", header = T)

##random subsample for plots
idx = sample(1:nrow(joined), 10000)
smpl_joined = joined[idx, ]