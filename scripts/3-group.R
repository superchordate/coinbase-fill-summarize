gtx = tx %>% 
  mutate(buy.at = as.Date(buy.at), sell.at = as.Date(sell.at)) %>%
  group_by( year = year(sell.at), sym = buy.sym, buy.at, sell.at ) %>% 
  summarize_at( vars(buy, sell), list(sum) ) %>% ungroup() %>%
  mutate_at( vars(buy, sell), list(round), 0 ) %>%
  arrange( buy.at ) %>%
  mutate( profit = sell + buy ) 

w( gtx, 'output/summary')

