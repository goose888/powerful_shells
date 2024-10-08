library(pacman)
p_load('tidyquant')
tq_index("SP500") -> a
view(a)

library(tidyquant)
aapl_prices  <- tq_get("AAPL", get = "stock.prices", from = " 1990-01-01")
aapl_prices
aapl_divs <- tq_get("AAPL", get = "dividends", from = "1990-01-01")
aapl_splits <- tq_get("AAPL", get = "splits", from = "1990-01-01")
aapl_divs
aapl_splits
fb_returns <- tq_get("FB", get  = "stock.prices", from = "2016-01-01", to   = "2016-12-31") %>%
  tq_transmute(select = adjusted, 
               mutate_fun = periodReturn, 
               period = "weekly", 
               col_rename = "fb.returns")
xlk_returns <- tq_get("XLK", from = "2016-01-01", to = "2016-12-31") %>%
  tq_transmute(select = adjusted, 
               mutate_fun = periodReturn, 
               period = "weekly", 
               col_rename = "xlk.returns")
fb_returns
xlk_returns
returns_combined <- left_join(fb_returns, xlk_returns, by = "date")
returns_combined
regr_fun <- function(data) {
  coef(lm(fb.returns ~ xlk.returns, data = data))
}
returns_combined %>%
  tq_mutate(mutate_fun = rollapply,
            width      = 12,
            FUN        = regr_fun,
            by.column  = FALSE,
            col_rename = c("coef.0", "coef.1"))
?tq_mutate
tq_mutate_fun_options()
FANG %>%
    group_by(symbol) %>%
    tq_mutate_xy(x = close, y = volume, 
                 mutate_fun = EVWMA, col_rename = "EVWMA")
