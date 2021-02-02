
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
/*
local dir "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"       
local data: dir "`dir'"files"*.dta"                                                
foreach file of local data {
append using `"`dir'/`file'"', force                  
}
*/

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


collapse num_commune num_village num_office amount_loan par_30 ratio_par_30 write_off ratio_write_off reschedule_loan ratio_reschedule_loan num_male_loan num_female_loan total_num_borrowers amount_deposit num_male_deposits num_female_deposits total_num_depositors num_staff_male num_staff_female total_staff loan_size, by(district_code year name)


******************************************************************************************************************************************************************************************************************************************

tabstat amount_loan, by(year)  nototal long col(stat)
tab amount_loan if year==2011,m
tab amount_loan if year==2012,m

tabstat par_30, by(year) nototal long col(stat) // missing for 2012 and 2019
tabstat write_off, by(year) nototal long col(stat) // missing for 2012
tabstat reschedule_loan, by(year) nototal long col(stat) 
/* 0 for 2011 and 2013 and missing for 2012 and 2019 */
tabstat num_male_loan, by(year) nototal long col(stat) /* missing from 2012 to 2019 */
tabstat num_female_loan, by(year) nototal long col(stat) 
tabstat total_num_borrowers, by(year) nototal long col(stat) 
tabstat amount_deposit, by(year) nototal long col(stat) 
tabstat num_male_deposits, by(year) nototal long col(stat) 
tabstat num_female_deposits, by(year) nototal long col(stat) 
tabstat total_num_depositors, by(year) nototal long col(stat) 
tabstat num_staff_male, by(year) nototal long col(stat) 
tabstat total_staff, by(year) nototal long col(stat) 

gen outlier=(amount_loan>1000000) if amount_loan!=.
br district_code name year amount_loan if year<=2012 & outlier==1
tabstat amount_loan if outlier==1 & year<=2012, by(district_code) nototal long col(stat)
tabstat amount_loan if outlier==1 & year<=2012, by(name) nototal long col(stat)

gen outlier2=(par_30>5000) if par_30!=.
sum outlier2
br district_code name year par_30 if outlier2==1

/*

* DECLARING PANEL DATA
destring district_code, replace
xtset district_code year

isid district_code year

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "2011-19q4_panel.dta", replace
*/

sum amount_loan
gen amount_loan_usd=amount_loan/4000
sum amount_loan_usd
gen loan_size_usd=loan_size/4000

* Calculate
* (1) number of loan outstanding/borrowers from 2012Q4 to 2019Q4 

tabstat total_num_borrowers if year>=2012, by(year) stat(mean sd n) long col(stat)
tabstat amount_loan if year>=2012 & amount_loan<10000, by(year) stat(mean sd n) long col(stat)
tabstat amount_loan_usd if year>=2012 & amount_loan<10000, by(year) stat(mean sd n) long col(stat)

*(2) the ratio of loans in rural areas  from 2012Q4 to 2019Q4, 
* Districts are called Khan for PHNOM PENH province. The capital is PHNOM PENH(Capital) and the district codes for the capital include 1201-1212.
gen urban=(district_code>="1201" & district_code<="1212")
egen amount_loan_rural=mean(amount_loan) if urban==0
tab amount_loan_rural,m 
gen ratio_rural_loan=amount_loan_rural/amount_loan
tabstat ratio_rural_loan if year>=2012, by(year) stat(mean sd n) long col(stat)

*(3) average amounts of loans from 2012Q4 to 2019Q4, for Maxima Microfinance?
tabstat amount_loan if name=="MAXIMA" & year>=2012  & amount_loan<10000, by(year) stat(mean sd n) long col(stat)
tabstat amount_loan_usd if name=="MAXIMA" & year>=2012  & amount_loan<10000, by(year) stat(mean sd n) long col(stat)

tabstat total_num_borrowers if name=="MAXIMA" & year>=2012, by(year) stat(mean sd n) long col(stat)
tabstat total_num_borrowers if name=="MAXIMA" & total_num_borrowers!=0 & year>=2012, by(year) stat(mean sd n) long col(stat)


***********************************************************************************************************************************************************


/* Preparing a table of amount of loans, number of borrowers, average loan size per borrower, the ratio of PAR30 for Maxima from 2017-2019. (For each district) */

keep if district_code=="0706" | district_code=="0705" | district_code=="0702" | district_code=="0801" | district_code=="0808" | district_code=="0503" | district_code=="1214" | district_code=="1211" | district_code=="1205" | district_code=="1209" | district_code=="1206" | district_code=="1208" | district_code=="0307" | district_code=="0313" | district_code=="0314" | district_code=="0803" | district_code=="0802" | district_code=="0809" | district_code=="0807" | district_code=="0808" | district_code=="0505" | district_code=="1209" | district_code=="1212" | district_code=="1207" 

tabstat amount_loan total_num_borrowers loan_size ratio_par_30 if  name=="MAXIMA" & year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)

tabstat amount_loan total_num_borrowers loan_size ratio_par_30 if year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)


tabstat amount_loan_usd total_num_borrowers loan_size_usd ratio_par_30 if  name=="MAXIMA" & year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)

tabstat amount_loan_usd total_num_borrowers loan_size_usd ratio_par_30 if year>=2017, by(district_code) stat(mean sd n) long col(stat) varwidth(20)




cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
clear
append using "2015q4_n" "2016q4_n" "2017q4_n" "2018q4_n" "2019q4_n", force
gen urban=(strpos(district_name, "(Krong)"))
br urban district_name if strpos(district_name, "(Krong)")
bys year: egen m_par_30=mean(par_30)
bys year: egen m_reschedule_loan=mean(reschedule_loan)
bys year: egen m_write_off=mean(write_off)


cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"
line m_par_30 m_reschedule_loan m_write_off year, xtitle("Year", size(small)) ytitle("Recent Trend in PAR 30 and Ratio of PAR 30", size(small)) ///
legend(pos(5) ring(0) col(1) lab(1 "PAR-30") lab(2 "Reschedule loan") lab(3 "Write-off")) scheme(s2mono)
graph save "PAR30_resch_writeoff.gph", replace
graph export PAR30_resch_writeoff.png, replace







