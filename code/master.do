/* In this project, I will study the assocation of some aggregate factors with suicide rate in the countries 
data obtained from https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016
I additionally included literacy rate from world bank dataset to see its assocation with suicide rate.
Human development index and literacy rate have many missing observations, thus I introduced them gradually 
to the model.
*/

*run from final project folder so that code can be called from code/..

*if there is no installed before
/*
do code/installing.do
*/

* Cleaning dataset obtained from Kaggle on suicide
do code/cleaning.do

* Cleaning dataset obtained from World Bank on literacy rate
do code/cleaningWBD.do

* Merging two clean datasets
do code/mergingdatasets.do

* Creating figures
do code/figures.do

*Creating summary statistics
do code/summary.do

*Creating OLS regression 
do code/regression.do


