library(dplyr)
library(purrr)
library(stringr)
library(lubridate)

folder <- list.files("tweets-data", full.names = T, pattern = "csv")
datos <- map_df(folder, read.csv) %>% 
  mutate(
    fecha = str_sub(created_at, 5, 10) %>% 
      paste0(., " 2024") %>% 
      paste(str_sub(created_at, 12, 19)) %>% 
      mdy_hms(),
    fecha_corta = str_sub(fecha, 1, 10) %>% 
      ymd(),
    hora = hour(fecha)
  )

write.csv(datos, "./data/sheinbaum_100_dias.csv", row.names = F)
