use "data/derived/final.dta", replace
tab agegroup
tab gender

** Summary statistics for suicide number and aggregate variables
eststo clear
estpost summarize suicides_no population suicides100kpop hdiforyear GDP gdp_per_capita literacy
esttab using "output\summary.rtf", cells("count mean sd min max") noobs label replace title("Descriptive statistics")

*Suicide rate by gender 

sort gender
eststo clear
by gender: eststo: estpost summarize suicides100kpop suicides_no
esttab  using "output\summary.rtf", cells("mean sd") label nodepvar append title("By gender suicide rate")
