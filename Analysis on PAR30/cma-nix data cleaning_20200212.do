

/* 
PROJECT TITLE: FINANCIAL INCLUSION IN CAMBODIA
PROJECT LEADER: Dr. Aiba Daiju
RESEARCH ASSISTANT: Hailegabriel Abebe Fenta

*/

****** DATA 2011

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2011q4.dta", clear
br district_code district_name B name
tostring district_code, replace


replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2011
br district_code district_name year
tab amount_loan,m
gen am_loan=amount_loan if amount_loan<1000000
drop amount_loan
rename am_loan amount_loan

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2011q4_n.dta", replace

********* DATA 2012

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2012q4.dta", clear
br district_code district_name
tostring district_code, replace

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2012
br district_code district_name year
tab amount_loan,m
gen am_loan=amount_loan if amount_loan<1000000
drop amount_loan
rename am_loan amount_loan

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2012q4_n.dta", replace

****** DATA 2013

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2013q4.dta", clear
br district_code district_name
tostring district_code, replace

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2013
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2013q4_n.dta", replace

****** DATA 2014

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2014q4.dta", clear
br district_code district_name
tostring district_code, replace


drop if district_name==""

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2014
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2014q4_n.dta", replace



****** DATA 2015

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2015q4.dta", clear
br district_code district_name
tostring district_code, replace

drop if district_name==""

gen year=2015
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2015q4_n.dta", replace


****** DATA 2016

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2016q4.dta", clear
br district_code district_name
tostring district_code, replace


drop if district_name==""
gen year=2016
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2016q4_n.dta", replace

****** DATA 2017

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2017q4.dta", clear
br district_code district_name
distinct district_code district_name N
tostring district_code, replace


drop if district_name==""
gen year=2017
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2017q4_n.dta", replace

****** DATA 2018

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2018q4.dta", clear
br district_code district_name amount_loan
tostring district_code, replace

drop if district_name==""

gen year=2018
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2018q4_n.dta", replace


****** DATA 2019

cd "C:\Users\phd14102\Google Drive\cma_nix"
use "2019q4.dta", clear
br district_name district_code amount_loan
browse if missing(real(amount_loan))
replace amount_loan="" if amount_loan=="-"
destring amount_loan, replace 

browse if missing(real(par_30))
replace par_30="" if par_30=="-"
destring par_30, replace 

replace ratio_par_30="" if ratio_par_30=="-"
/*  Deleting two outlier observations for ratio of par 30, far below 0.0001 */
/*
replace ratio_par_30="0.000003833196038" if ratio_par_30=="3.83319603773e-06"
replace ratio_par_30="0.000004107990864" if ratio_par_30=="4.10799086383e-06"
*/
tab ratio_par_30,m
destring ratio_par_30, replace force

replace reschedule_loan="" if reschedule_loan=="-"
replace ratio_reschedule_loan="" if ratio_reschedule_loan=="-"

destring reschedule_loan ratio_reschedule_loan, replace force
*destring amount_loan, replace dpcomma ignore(", ")
distinct district_code district_name N 

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

replace district_code="103" if district_code=="Kampong Leaeng" & district_name=="Phnum Srok"

tostring district_code, replace
drop if district_code=="1213" | district_code=="1214" /* Only in 2019 */
gen year=2019

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2019q4_n.dta", replace


* APPENDING


cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
clear
append using "2011q4_n" "2012q4_n" "2013q4_n" "2014q4_n" "2015q4_n" "2016q4_n" "2017q4_n" "2018q4_n" "2019q4_n", force

distinct district_code  // 197 distinct district codes
br district_name district_code year N
br district_code
destring district_code, gen(dist)
replace district_code="0"+district_code if dist<1000
drop dist
br district_code

destring num_male_loan, replace

gen loan_size=amount_loan/total_num_borrowers


keep num_commune num_village num_office amount_loan par_30 ratio_par_30 write_off ratio_write_off reschedule_loan ratio_reschedule_loan num_male_loan num_female_loan total_num_borrowers amount_deposit num_male_deposits num_female_deposits total_num_depositors num_staff_male num_staff_female total_staff loan_size district_code year name


save "cma2011_19.dta", replace

******************************************************************************************************************************************************************************************************************************************