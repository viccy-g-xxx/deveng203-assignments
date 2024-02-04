library(tidyverse)
library(data.table)

darfur_data <- read.csv("../datasets/time_series_data.csv")

# q1
unique(darfur_data$filename)

#q2
max_temperature_by_household <- darfur_data %>% 
  filter(variable=="temperature") %>%
  group_by(household_id) %>%
  summarise(max_temperature = max(value))
  
#q3
high_temperature_households <- darfur_data %>% 
  filter(variable=="temperature", value > 130) %>% 
  distinct(camp, filename, household_id) 

#q4
dafur_data_hot_house_subset <- darfur_data %>% 
  filter(household_id %in% high_temperature_households$household_id) 


print(head(darfur_data))
print(head(max_temperature_by_household))
print(head(high_temperature_households))
print(head(dafur_data_hot_house_subset))


## BONUS: data.table performance comparison
darfur_dt <- setDT(darfur_data)

## question 2 comparison
start_time <- Sys.time()
max_temp_household_dt <- 
  darfur_dt[variable=="temperature", .(max(value)), by = .(household_id)]
end_time <- Sys.time()

dt_time = end_time - start_time

start_time <- Sys.time()
max_temperature_by_household <- darfur_data %>% 
  filter(variable=="temperature") %>%
  group_by(household_id) %>%
  summarise(max_temperature = max(value))
end_time <- Sys.time()

df_time = end_time - start_time

## question 3 comparison

start_time <- Sys.time()
high_temp_hh_dt <- 
  darfur_dt[variable=="temperature" & value > 130, .(camp, filename, household_id)]
end_time <- Sys.time()

dt_time = end_time - start_time

start_time <- Sys.time()
high_temperature_households <- darfur_data %>% 
  filter(variable=="temperature", value > 130) %>% 
  distinct(camp, filename, household_id) 
end_time <- Sys.time()

df_time = end_time - start_time


## question 4 comparison
start_time <- Sys.time()
hot_hh_subset <- 
  darfur_dt[
    household_id %in% high_temp_hh_dt$household_id]
end_time <- Sys.time()
dt_time = end_time - start_time


start_time <- Sys.time()
dafur_data_hot_house_subset <- darfur_data %>% 
  filter(household_id %in% high_temperature_households$household_id) 
end_time <- Sys.time()

df_time = end_time - start_time


