# validate that this all sells are matched.
validate.equal(
  sell %>% group_by(year = year(created.at)) %>% summarize(val=sum(total), valunits=sum(size)),
  gtx %>% group_by(year) %>% summarize(val=sum(sell), valunits=sum(sell_units)),
  acceptable.pct.vals.diff = 1,
  verbose = FALSE
)

validate.equal(
  buy %>% group_by(year = year(created.at)) %>% summarize(val=sum(total), valunits=sum(size)),
  gtx %>% group_by(year) %>% summarize(val=sum(buy), valunits=sum(buy_units)),
  acceptable.pct.vals.diff = 1,
  verbose = FALSE
)
