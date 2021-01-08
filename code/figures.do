** Creating figures
use "data/derived/final.dta", replace
*Average suicide by age group
graph bar suicides_no , over( agegroup )
graph export "output\suicide by age group.png", as(png) replace

graph bar suicides100kpop , over( agegroup )
graph export "output\suicide rate by age group.png", as(png) replace

*Average suicide by gender
graph bar suicides_no , over( gender )
graph export "output\suicide by gender.png", as(png) replace

graph bar suicides100kpop , over( gender )
graph export "output\suicide rate by gender.png", as(png) replace

*scatterplot GDP per capita and suicide

scatter suicides100kpop gdp_per_capita
graph export "output\GDP suicide.png", as(png) replace

*scatterplot Literacy and suicide

scatter suicides100kpop literacy
graph export "output\Literacy suicide.png", as(png) replace
