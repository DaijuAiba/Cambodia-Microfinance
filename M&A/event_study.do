
// Final Update August 5, 2021



clear matrix
clear mata
set emptycells drop 

cd 

global datafilepath Data

// do "Data preparation and merging.do"

use "Data\cleaned_merged2011_19.dta", clear

* Asset
rename m_asset1 total_asset
rename m_asset2 cash_bal

*Equity
rename m_liability11 paidup_cap
rename m_liability12 premium
rename m_liability13 hybrid_cap
rename m_liability14 reserves
rename m_liability15 retained

gen hybrid=hybrid_cap

// browse if missing(real(hybrid_cap))
destring hybrid_cap, replace force 

*LIABILITY
rename m_liability4 interest_payment
rename m_liability1 total_liabLiq
rename m_operation2 int_exp


gen cap_asset=paidup_cap/total_asset
gen cash_asset=cash_bal/total_asset
gen retained_asset=retained/total_asset
gen equity1 = paidup_cap + premium + hybrid_cap + reserves + retained
gen equity2 = paidup_cap + retained
gen equity1_asset=equity1/total_asset
gen equity2_asset=equity2/total_asset
gen liability=total_liabLiq-equity1
destring int_exp, replace force
gen fundingP=int_exp/liability


destring district_code, replace

gen loan=amount_loan
replace loan=0 if amount_loan==.
drop amount_loan
rename loan amount_loan
gen log_loan=log(amount_loan)
gen log_borr=log(total_num_borrowers)
gen log_loan_borr=log(loan_size)
gen borr_f=num_female_loan/total_num_borrowers
gen log_borr_f=log(borr_f)





gen MA0=0
replace MA0=1 if id_mfi==201 & year>=2011
replace MA0=1 if id_mfi==202 & year>=2016
replace MA0=1 if id_mfi==203 & year>=2015
replace MA0=1 if id_mfi==204 & year>=2010
replace MA0=1 if id_mfi==205 & year>=2018
replace MA0=1 if id_mfi==206 & year>=2012
replace MA0=1 if id_mfi==210 & year>=2018
replace MA0=1 if id_mfi==212 & year>=2019

replace MA0=1 if id_mfi==214 & year>=2017
replace MA0=1 if id_mfi==216 & year>=2009
replace MA0=1 if id_mfi==217 & year>=2016

replace MA0=1 if id_mfi==218 & year>=2016
replace MA0=1 if id_mfi==221 & year>=2018

replace MA0=1 if id_mfi==222 & year>=2014

replace MA0=1 if id_mfi==223 & year>=2014
replace MA0=1 if id_mfi==224 & year>=2017

replace MA0=1 if id_mfi==226 & year>=2018
replace MA0=1 if id_mfi==228 & year>=2015

replace MA0=1 if id_mfi==231 & year>=2017
replace MA0=1 if id_mfi==242 & year>=2019
replace MA0=1 if id_mfi==243 & year>=2013

replace MA0=1 if id_mfi==245 & year>=2017

replace MA0=1 if id_mfi==248 & year>=2013

replace MA0=1 if id_mfi==252 & year>=2015
replace MA0=1 if id_mfi==256 & year>=2017
replace MA0=1 if id_mfi==259 & year>=2017
replace MA0=1 if id_mfi==260 & year>=2016
replace MA0=1 if id_mfi==269 & year>=2011
replace MA0=1 if id_mfi==271 & year>=2015

replace MA0=1 if id_mfi==278 & year>=2016
replace MA0=1 if id_mfi==279 & year>=2016
replace MA0=1 if id_mfi==280 & year>=2015
replace MA0=1 if id_mfi==285 & year>=2016
replace MA0=1 if id_mfi==291 & year>=2015
replace MA0=1 if id_mfi==301 & year>=2017



gen year_ma=.


replace year_ma=2011 if id_mfi==201
replace year_ma=2016 if id_mfi==202 
replace year_ma=2015 if id_mfi==203 
replace year_ma=2010 if id_mfi==204 
replace year_ma=2018 if id_mfi==205 
replace year_ma=2012 if id_mfi==206 
replace year_ma=2018 if id_mfi==210 
replace year_ma=2019 if id_mfi==212 

replace year_ma=2017 if id_mfi==214 
replace year_ma=2009 if id_mfi==216 
replace year_ma=2016 if id_mfi==217 

replace year_ma=2016 if id_mfi==218 
replace year_ma=2018 if id_mfi==221 

replace year_ma=2014 if id_mfi==222 

replace year_ma=2014 if id_mfi==223 
replace year_ma=2017 if id_mfi==224 

replace year_ma=2018 if id_mfi==226 
replace year_ma=2015 if id_mfi==228

replace year_ma=2017 if id_mfi==231
replace year_ma=2019 if id_mfi==242
replace year_ma=2013 if id_mfi==243 

replace year_ma=2017 if id_mfi==245 

replace year_ma=2013 if id_mfi==248 

replace year_ma=2015 if id_mfi==252
replace year_ma=2017 if id_mfi==256 
replace year_ma=2017 if id_mfi==259 
replace year_ma=2016 if id_mfi==260 
replace year_ma=2011 if id_mfi==269 
replace year_ma=2015 if id_mfi==271 

replace year_ma=2016 if id_mfi==278 
replace year_ma=2016 if id_mfi==279 
replace year_ma=2015 if id_mfi==280
replace year_ma=2016 if id_mfi==285 
replace year_ma=2015 if id_mfi==291 
replace year_ma=2017 if id_mfi==301 

tab year,m
tab year_ma,m  /* Year of Merger and Acquisition */

g event=year-year_ma

// replace event=-6 if event==.

tab event,m

replace event = 4 if event>=4  & event!=.
replace event = -4 if event<=-4    & event!=.

tab event, gen(A)

foreach i in A1 A2 A3 A4 A5 A6 A7 A8 A9 {
	replace `i' = 0 if `i'==.
	
}
label var A1 "-4"
label var A2 "-3"
label var A3 "-2"
label var A4 "-1"
label var A5 "0"
label var A6 "1"
label var A7 "2"
label var A8 "3"
label var A9 "4"


/*
xi  i.event, noomit
forv i=1(1)12 {
gen A`i' = _Ievent_`i' 
}

label var A1 "-6"
label var A2 "-5"
label var A3 "-4"
label var A4 "-3"
label var A5 "-2"
label var A6 "-1"
label var A7 "0"
label var A8 "1"
label var A9 "2"
label var A10 "3"
label var A11 "4"
label var A12 "5"
*/ 


local log_loan "Log of Loan Amount"
local log_borr "Log of Number of Borrowers"
local log_loan_borr "Log of Loan Size"
local log_borr_f "Log of Female Borrowers Ratio"

global diff " A1 A2 A3 A4 A5 A6 A7 A8 A9 " /* Omitting A1 to A6 as reference */
* local diff " A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12"

local y log_loan log_borr log_loan_borr log_borr_f

global cov  equity2_asset cash_asset fundingP


cap mkdir "Graph_Event_Study"



reg log_loan  A1 A2 A3 A4 A5 A6 A7 A8 A9   $cov i.id_mfi i.district_code##i.year, cluster(district_code) noconstant
estimates store event1
mat B=e(b)
mat b=B["A1","A2","A3","A4"]

coefplot event1, keep($diff) vertical xline()  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) 

reg log_borr  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov i.id_mfi i.district_code##i.year, cluster(district_code) noconstant
estimates store event2
coefplot event2, keep($diff) vertical xline()  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) 

reg log_loan_borr  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov i.id_mfi i.district_code##i.year, cluster(district_code) noconstant
estimates store event3
coefplot event3, keep($diff) vertical xline()  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) 


reg borr_f  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov i.id_mfi i.district_code##i.year, cluster(district_code) noconstant
estimates store event4
coefplot event4, keep($diff) vertical xline()  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) 






foreach y in `y' {


qui reg `y' A1 A2 A3 A4 A5 A6 A7 A8 A9   `cov' i.id_mfi i.district_code##i.year, cluster(district_code) noconstant

estimates store event`y'
coefplot event`y', keep(`diff') vertical  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) title("``y''", size(medium)) saving("event`y'n", replace)
graph export "Graph_Event_Study\event`y'n.png", replace
}

/*
graph combine eventlog_loan.gph eventlog_borr.gph eventlog_loan_borr.gph eventlog_borr_f.gph
graph save "event1.gph", replace
graph export "event1.png", replace
*/

graph combine eventlog_loann.gph eventlog_borrn.gph eventlog_loan_borrn.gph eventlog_borr_fn.gph
graph save "Graph_Event_Study\event2.gph", replace
graph export "Graph_Event_Study\event2.png", replace


















