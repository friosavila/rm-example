* Load the data
use "$processed/cleaned_data.dta", clear

log using "$results/other/eda", replace text
* Exploratory data analysis

* Summary statistics
sum lnwage educ exper tenure isco female lfp age kids6 kids714 wt mstat agesq

* Cross-tabulations
tab female lfp, row
tab mstat lfp, row

* Visualizations
histogram lnwage, normal
graph export "$other/log_wage_histogram.png", replace
scatter lnwage educ, msize(small) 
graph export "$other/sct_lnw_educ.png", replace
scatter lnwage exper, msize(small)
graph export "$other/sct_lnw_exper.png", replace

log close
* Main data analysis

* summary Statistics
estpost sum lnwage educ exper tenure female lfp age kids6 kids714
est sto sum_stat
esttab sum_stat using "$tables/table1", cells("mean(fmt(%4.1f)) sd(fmt(%4.1f)) count(fmt(%4.0f))") noobs nonumber md label collabel(none) mtitles("Mean" \ "StdDev" "N") replace

* Regression model
regress lnwage educ exper exper2 female age kids6 kids714 i.mstat   [pw=wt], robust
est sto ols
* Quantile regression
qreg lnwage educ exper exper2 female age kids6 kids714 i.mstat   [pw=wt], q(25)
est sto qreg25
qreg lnwage educ exper exper2 female age kids6 kids714 i.mstat   [pw=wt], q(50)
est sto qreg50
qreg lnwage educ exper exper2 female age kids6 kids714 i.mstat   [pw=wt], q(75)
est sto qreg75
 
 
esttab ols qreg25 qreg50 qreg75 using "$tables\reg1", md label replace nonumber ///
  mtitle(OLS Qreg(25) Qreg(50) Qreg(75)) nobaselevels b(3) se r2 note("")
  
* Robustness checks

* Subgroup analysis by gender
regress lnwage educ exper exper2 age kids6 kids714   i.mstat [pw=wt] if female == 0, robust
est sto ols_men

regress lnwage educ exper exper2 age kids6 kids714    i.mstat [pw=wt] if female == 1, robust
est sto ols_women

esttab ols ols_men ols_women using "$tables\reg2", md label replace nonumber ///
  mtitle(OLS Men Women) nobaselevels b(3) se r2 note("")
 