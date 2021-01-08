use "data/derived/final.dta", replace

*Transforming population, GDP and GDP per capita to log form
gen ln_Pop=log( population )
gen ln_GDP=log(GDP)
gen ln_gdp_per_capita =log( gdp_per_capita )

*There are many missing observation in Human development index and Literacy rate.
*Thus I decided to do regression analyses without them and further introduce them gradually. 

*OLS regression
reg suicides_no ln_Pop ln_GDP i.gender i.agegroup
outreg2 using "output\regression.rtf",  replace label
reg suicides100kpop ln_Pop ln_GDP i.gender i.agegroup
outreg2 using "output\regression.rtf",  append label
*OLS with Human development index (HDI)
reg suicides_no ln_Pop ln_GDP i.gender i.agegroup hdiforyear
outreg2 using "output\regression.rtf",  append label
reg suicides100kpop ln_Pop ln_GDP i.gender i.agegroup hdiforyear
outreg2 using "output\regression.rtf",  append label
*OLS with Human development index (HDI) and literacy rate
reg suicides_no ln_Pop ln_GDP i.gender i.agegroup hdiforyear literacy
outreg2 using "output\regression.rtf",  append label
reg suicides100kpop ln_Pop ln_GDP i.gender i.agegroup hdiforyear literacy
outreg2 using "output\regression.rtf",  append label

