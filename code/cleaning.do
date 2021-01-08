*pwd
*cd ..\
*cd CEU
*cd Semester4
*cd "Coding for economists"
*cd Final_project

import delimited "data\raw\master.csv", clear

*seperating year from string variable
gen Year = real(substr(countryyear,-4,.))

*encoding gender
encode sex, gen(gender)
tab gender

* encoding age group
encode age, gen(agegroup)
tab agegroup
tab agegroup, nol
replace agegroup=0 if agegroup==4
replace agegroup=4 if agegroup==5
replace agegroup=5 if agegroup==6
label define agegroup 1 "15-24 years" 2 "25-34 years" 3 "35-54 years" 0 "5-14 years" 4 "55-74 years" 5 "75+ years", replace

*correcting string numbers
destring gdp_for_year, gen(GDP) ignore(",")
rename ïcountry Country

*dropping irrelevant variables
drop year sex age countryyear gdp_for_year generation

save "data\derived\suicide.dta", replace
