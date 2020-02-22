# coinbase-fill-summarize

*This code is provided AS-IS and I make no guarantees as to its' accuracy or correctness.*

I use this R code to summarize my Coinbase transactions for tax purposes. It can be difficult to match purchases to sales so these scripts will do it for you.

This can also be used for other types of investment buy/sell matching, with some modifications.

1. Download your Coinbase transactions from Orders > Filled > download statements. 
2. Download "All Products" for one easy export.
3. Put the export file in the project folder in a folder called "inputs".
4. Run the R Code. Your summarized transactions will be saved in outputs/summary.csv with columns: year, symbol, buy at, sell at, buy cost, sell cost, profit.