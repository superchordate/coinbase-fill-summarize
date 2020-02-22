tx = NULL

buy$left = buy$size
sell$left = sell$size

for( buyrow in 1:nrow(buy) ){

  for( sellrow in which( sell$left > 0 & sell$size.unit == buy$size.unit[ buyrow ] ) ){
    
    ibuy = buy[ buyrow, ]
    isel = sell[ sellrow, ]
    
    match.amount = round( min( ibuy$left, isel$left ), 8 )
    
    itx = data.frame(
      
      buy.at = ibuy$created.at,
      sell.at = isel$created.at,
      
      buy.sym = ibuy$size.unit,
      sell.sym = isel$size.unit,
      
      buy.size = ibuy$size,
      sell.size = isel$size,
      
      match.amount = match.amount,
      
      buy = round( ibuy$total * match.amount / ibuy$size, 8 ),
      sell = round( isel$total * match.amount / isel$size, 8 ),
      
      buy.id = ibuy$trade.id,
      sell.id = isel$trade.id
      
    )
    
    sell$left[ sellrow ] <- round( sell$left[ sellrow ] - match.amount, 8 )
    buy$left[ buyrow ] <- round( buy$left[ buyrow ] - match.amount, 8 )
    
    itx$sell.left = sell$left[ sellrow ] 
    itx$buy.left = buy$left[ buyrow ]

    itx %<>% fac2char()
    
    tx = bind_rows( tx, itx )
    
    rm( itx, sellrow, isel, ibuy )
    
    # if we are done, break.
    if( buy$left[ buyrow] <= 0 ) break
    
  }
  
  rm(buyrow)
  
}

if( any( tx$buy.sym != tx$sell.sym ) ) stop( 'symbol error E341' )
