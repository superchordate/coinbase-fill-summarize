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
w( gtx, 'output/summary')

# view current year.
foryear = 2019
gtx %>% ungroup() %>% mutate(buy.at = as.Date(buy.at)) %>% filter(year(sell.at)==foryear)
