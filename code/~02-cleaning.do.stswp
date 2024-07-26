/*********************************************/
/* This file loads and cleans the SWISS file */
/*********************************************/

* Clear 
clear

* Load the data
import delimited "C:\Users\Fernando\Documents\GitHub\rm-example\data\raw\swiss_lfs.csv", clear 

* Label Data
* It may have required to name the variables before Labeling

* Label variables

label variable lnwage "Log hourly wages"
label variable educ "Yrs of education"
label variable exper "Yrs of experience"
label variable tenure "Yrs of job tenure"
label variable isco "Occupation (ISCO)"
label variable female "Sex of respondent"
label variable lfp "Labor force participation"
label variable age "Age in yrs"
label variable kids6 "No of children <6"
label variable kids714 "No of children 7-14"
label variable wt "sampling weights"
label variable mstat "Marital status"

* Create age squared variable
generate agesq = age^2
label variable agesq "age squared"

generate exper2 = exper^2
label variable exper2 "Experience^2^"

* Label values for categorical variables
label define female_lbl 0 "Male" 1 "Female"
label values female female_lbl

label define mstat_lbl 1 "Single" 2 "Married" 3 "Divorced"
label values mstat mstat_lbl

* Save the cleaned data
save "$processed/cleaned_data.dta", replace

