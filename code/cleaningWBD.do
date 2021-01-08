import delimited "data\raw\literacy.csv", clear bindquote("strict") varnames(1) encoding("utf-8")
*Removing irrelevant variables
drop countrycode seriesname seriescode
drop in 218/222

*Saving literacy rate for each country seperately as .dta file
forvalues t = 1985/2016 {
	preserve
	keep countryname  yr`t'
	rename yr`t' literacy 
	save "data/derived/lit`t'.dta", replace
	restore
}

* Appending all country literacy rates in one .dta file
use "data/derived/lit1985.dta", clear

generate Year=1985

 forvalues year=1986/2016 {
 append using "data/derived/lit`year'.dta"
 replace Year=`year' if missing(Year)
 }
 save "data/derived/literacy.dta", replace

 *Correcting string variable 
 
replace literacy="."  if literacy==".."
destring literacy, replace

*Prepapre to merge 
rename countryname Country
label variable literacy "Literacy rate"

save "data/derived/literacy.dta", replace
