#' ---
#' title: "Climate change dataset"
#' author: "Prasham Bhuta"
#' date: "June 4, 2020"
#' ---

#' # Climate change excercises
#' ## Loading the dataframe
library(tidyverse)
library(dslabs)
data("temp_carbon")
data("greenhouse_gases")
data("historic_co2")
options(digits = 3)

#' ## Getting summary of temp_carbon data
str(temp_carbon)
summary(temp_carbon)

#' ## Getting summary of greenhouse_gases data
str(greenhouse_gases)
summary(greenhouse_gases)

#' ## Getting summary of historic_co2 data
str(historic_co2)
summary(historic_co2)

#' ## When the latest year when data was recorded in temp_carbon? 
#' ### * 2014
latest_year <- temp_carbon %>% filter(!is.na(carbon_emissions)) %>% 
                                          select(year) %>% max()
print(latest_year)
#' ## What is the value of co2 emission, first time recorded and last time recorded.
#' |Year | Emission |
#' |---- | ------   |
#' |1751 | 3 |
#' | 2014 | 9855 | 
first_year <- temp_carbon %>% 
    filter(!is.na(carbon_emissions) & year == min(.$year)) 
sprintf("First Year: %d" ,first_year$year)
last_year <- temp_carbon %>%
    filter(!is.na(carbon_emissions)) %>% filter(year == max(.$year))
sprintf("Last Year: %d" ,last_year$year)
co2_increased <- last_year$carbon_emissions/first_year$carbon_emissions 
sprintf("The co2 emissions has increasesd %d times", co2_increased)

#' ## Compare first and last entries for temp anomaly
#' |Year |temp_anamoly |
#' |---- |------- |
#' |1880| -0.11 |
#' |2018 | 0.82 |
#' 
first_year <- temp_carbon %>%
    filter(!is.na(temp_anomaly)) %>% arrange(year)
sprintf("The first year the data is available: %s with %s temp anomaly", 
        first_year[1,]$year, first_year[1,]$temp_anomaly)
sprintf("The last year the data is available: %s with %s temp anomaly", 
        tail(first_year,1)$year, tail(first_year,1)$temp_anomaly)

#' ## Timeseries plot for temp anomaly
p <- temp_carbon %>% filter(!is.na(temp_anomaly)) %>% 
    ggplot(aes(year, temp_anomaly)) + geom_line()
p <- p + geom_hline(aes(yintercept = 0), color = 'blue')

#' ## Adding labels
p <- p + ylab("Temperature anomaly (degrees C)") +
    ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
    geom_text(aes(x = 2000, y = 0.05, 
                  label = "20th century mean"), col = "blue")
#' ## Adding land & ocean anomaly
q <- temp_carbon %>% 
    filter(!is.na(temp_anomaly) & !is.na(land_anomaly) & 
               !is.na(ocean_anomaly)) %>%
    ggplot(aes(x =year)) +
    geom_line(aes(y=temp_anomaly), color='blue') +
    geom_line(aes(y=ocean_anomaly), color='red') +
    geom_line(aes(y=land_anomaly), color='green') +
    ylab("Anomalies") +
    ggtitle("Time series plot of temp, ocean and land anomaly.") +
    geom_text(aes(x=2000, y = 1.2, label='land anomaly'), col = 'green') +
    geom_text(aes(1940, 0.5, label='temp anomaly'), col = 'blue') +
    geom_text(aes(2010, 0.3, label='ocean anomaly'), col = 'red')
q

#' ## Line plot for greenhouses gases such as co2, ch4, and n2o.
p <- greenhouse_gases %>%
    ggplot(aes(year, concentration)) +
    geom_line() +
    facet_grid(gas ~ ., scales = 'free') +
    geom_vline(aes(xintercept = 1850)) +
    ylab("Concentration (ch4/n2o ppb, co2 ppm)") +
    ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")
p

#' ## Carbon emissions time series plot
p <- temp_carbon %>%
    ggplot(aes(year, carbon_emissions)) +
    geom_line() +
    ylab("Carbon emissions in metric ton.") + 
    ggtitle("Time series plot of carbon emissions.") +
    geom_vline(aes(xintercept = 1850))
p

#' ## Plotting historic co2, dating back 800000 years, data from measurement of ice cores.
historic_co2 = as.data.frame(historic_co2)
co2_time <- historic_co2 %>%
    ggplot(aes(year,co2)) +
    geom_line() +
    ylab("CO2 level") + 
    ggtitle("CO2 levels over the history.")
co2_time 

#' ## playing with x-axis limits
co2_time1 <- co2_time +
    scale_x_continuous(limits = c(-800000, -775000))
co2_time1
#' * It took ~10,000 years for co2 level to rise from 200 pppmv to 275 ppmv

co2_time2 <- co2_time +
    scale_x_continuous(limits = c(-375000, -330000))
co2_time2
#' * It took ~25,000 years for co2 level to rise from 180 pppmv to 300 ppmv

co2_time3 <- co2_time +
    scale_x_continuous(limits = c(-140000, -120000))
co2_time3
#' * It took ~9,000 years for co2 level to rise from 200 pppmv to 280 ppmv

co2_time4 <- co2_time +
    scale_x_continuous(limits = c(-3000, 2018))
co2_time4
#' * **It only took 250 years for co2 level to rise from 275 ppmv to 400 ppmv.**