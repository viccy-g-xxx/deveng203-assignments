library(readxl)
library(tidyverse)
library(lubridate)

excel_path = "HM1210201800_0000002.xlsx"

# q1
parse_metadata <- function(excel_path) {
  
  excel_df = read_xlsx(
    path='HM1210201800_0000002.xlsx')
  
  metadata <- c(
  "serial_number" = excel_df[[5,2]],
  "device_model" = excel_df[[4,2]],
  "probe_type" = excel_df[[4, 5]],
  "firmware_version" = excel_df[[5,5]],
  "trip_number" = excel_df[[7,2]],
  "trip_description" = excel_df[[8,2]],
  "start_mode" = excel_df[[10,2]],
  "start_delay" = excel_df[[11,2]],
  "time_zone" = excel_df[[12,2]],
  "logging_interval" = excel_df[[10,5]],
  "repeat_start" = excel_df[[11,5]],
  "stop_mode" = excel_df[[12,5]]
  )
  return(data.frame(t(metadata)))
}

#q2
parse_timeseries <- function(excel_path){
  
  excel_df = read_xlsx(
    path=excel_path, skip = 23)
  
  timeseries_df <- excel_df[2:4]
  colnames(timeseries_df) <- c("time", "temperature", "humidity")
  
  return(timeseries_df)
}

metadata = parse_metadata(excel_path)
timeseries = parse_timeseries(excel_path)

# q3

merged_data = cross_join(timeseries, metadata)

print(head(metadata))
print(head(timeseries))
print(head(merged_data))

# bonus 1
timeseries$hour <- sapply(timeseries$time, function(x) hour(ymd_hms(x)))

max_humidity_by_hour <- timeseries %>%
  group_by(hour) %>%
  summarise("humidity" = max(humidity))

print(max_humidity_by_hour)

# bonus 2
long_data <- gather(timeseries, "variable", "value", -time)

print(head(long_data))
