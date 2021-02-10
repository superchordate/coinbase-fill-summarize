require(easyr)
begin()

require(magrittr)
require(purrr)
require(lubridate)
require(data.table)
require(glue)
library(dplyr)

runfolder( 'scripts' )

# write the output file.
if(!dir.exists('output')) dir.create('output')
w( gtx, 'output/summary')

# view current year.
foryear = 2020
gtx %>% ungroup() %>% mutate(buy.at = as.Date(buy.at)) %>% filter(year(sell.at)==foryear)
