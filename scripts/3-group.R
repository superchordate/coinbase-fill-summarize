gtx = tx %>% 
  mutate(buy.at = as.Date(buy.at), sell.at = as.Date(sell.at)) %>%
  group_by(year = year(sell.at), sym = buy.sym, buy.at, sell.at) %>% 
  summarize_at( vars(buy, sell, buy_units, sell_units), list(sum) ) %>% ungroup() %>%
  mutate_at( vars(buy, sell), list(round), 0 ) %>%
  mutate(term=ifelse(ydiff(buy.at,sell.at)>0, 'Year or More', 'Less than a Year')) %>%
  arrange( buy.at ) %>%
  mutate( profit = sell + buy )
