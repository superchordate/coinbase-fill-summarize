dt = bind_rows(lapply(
  list.files('input', pattern='[.]csv', full.names=TRUE), 
  function(filename) fread( filename, check.names = TRUE ) %>%
    select( -product, -price.fee.total.unit, -fee, -price ) %>% 
    mutate( created.at = ymd_hms( created.at ), file=filename ) %>%
    arrange( created.at )
))

# it's possible overlapping files may have 
dtuniq = dt %>% distinct()
if(nrow(dtuniq) != nrow(dt)) warning(glue('
  Dropped {nrow(dt)-nrow(dtuniq)} duplicated rows. Your files may use overlapping dates.
'))
dt = dtuniq
rm(dtuniq)


buy = dt %>% filter( side == 'BUY' ) %>% select( -side )
sell = dt %>% filter( side == 'SELL') %>% select( -side )

