dt = bind_rows(lapply(
  list.files('input', pattern='[.]csv', full.names=TRUE), 
  function(filename) fread( filename, check.names = TRUE ) %>%
    select( -product, -price.fee.total.unit, -fee, -price ) %>% 
    mutate( created.at = ymd_hms( created.at ), file=filename ) %>%
    arrange( created.at )
))

buy = dt %>% filter( side == 'BUY' ) %>% select( -side )
sell = dt %>% filter( side == 'SELL') %>% select( -side )

