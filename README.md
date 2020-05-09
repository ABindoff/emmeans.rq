S3 methods enabling `emmeans` to handle `rq` objects from the `quantreg` package for quantile regression in R.  

Please note that these are *untested* but should work in most cases. Please use the issues tab to report bugs or make a pull request if you would like to contribute solutions and fixes.  

`quantreg` provides several methods for robust estimation, and as such doesn't provide a vcov matrix until you pass the object to summarise(), which takes an argument `se`. I've got around this by extracting the vcov matrix using summarise.rq  Code is compact, just copy and paste from methods.R to use.  

This is useful for estimating marginal means, trends and post-hoc contrasts for quantile regression models.  


#### Example

em1 <- emmeans(model1, ~ group, se = 'boot') # bootstrap standard errors
pairs(em1) # pairwise contrasts using Tukey method
