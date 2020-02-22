gtx = tx %>% 
  mutate(buy.at = as.Date(buy.at), sell.at = as.Date(sell.at)) %>%
  group_by(year = year(sell.at), sym = buy.sym, buy.at, sell.at) %>% 
  summarize_at( vars(buy, sell, buy_units, sell_units), list(sum) ) %>% ungroup() %>%
  mutate_at( vars(buy, sell), list(round), 0 ) %>%
  mutate(term=factor(ifelse(ydiff(buy.at,sell.at)==0, 'Less than a Year', 'Year or More'), levels=c('Less than a Year', 'Year or More'))) %>%
  arrange( buy.at ) %>%
  mutate( profit = sell + buy )

# rearrange columns to match form 8949.
colorder = c('year', 'term', 'sym', 'buy.at', 'sell.at', 'sell', 'buy', 'profit', 'buy_units', 'sell_units')
gtx = gtx[, c(colorder, setdiff(colnames(gtx),colorder))]
gtx %<>% arrange(year, term, sym, buy.at)
