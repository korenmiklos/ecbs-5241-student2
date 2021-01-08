* Main dataset
use "data/derived/suicide.dta", replace

*Merging with data obtained on literacy rate from World Bank data 

merge m:1 Country Year using "data/derived/literacy.dta", keep(match) nogenerate

save "data/derived/final.dta", replace
