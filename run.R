require(easyr)
begin()

require(magrittr)
require(purrr)
require(lubridate)
require(data.table)

library(dplyr)

runfolder( 'functions' )
runfolder( 'scripts' )

foryear = 2019

gtx %>% ungroup() %>% mutate(buy.at = as.Date(buy.at)) %>% filter(year(sell.at)==foryear)
