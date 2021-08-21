
// Final Update August 5, 2021



clear matrix
clear mata
set emptycells drop 

cd 

global datafilepath Data

do "Data preparation and merging.do"

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


*destring district_code, replace

replace amount_loan=0 if amount_loan==.
replace total_num_borrowers=0 if total_num_borrowers==.
gen loan_size = amount_loan/total_num_borrowers
gen log_loan=log(amount_loan)
gen log_borr=log(total_num_borrowers)
gen log_loan_borr=log(loan_size)
gen borr_f=num_female_loan/total_num_borrowers
gen log_borr_f=log(borr_f)



merge m:1 id_mfi using "${datafilepath}\MA.dta"





hist year_ma,freq
graph export "Graph_Event_Study\MA_year.png",replace
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




// Cutting outliers
hist log_loan_borr
hist log_borr

foreach k in log_loan log_borr log_loan_borr{
foreach i of num 2014/2019{
sum `k' if year==`i', detail
local up=r(p99)
local low=r(p1) 
replace  `k'=. if `k' >`up' & year==`i'
replace  `k'=. if `k' <`low' & year==`i' 
}
}
sum log_loan log_borr log_loan_borr borr_f

local log_loan "Log of Loan Amount"
local log_borr "Log of Number of Borrowers"
local log_loan_borr "Log of Loan Size"
local log_borr_f "Log of Female Borrowers Ratio"
local borr_f "Female Borrowers Ratio"

global diff " A1 A2 A3 A4 A5 A6 A7 A8 A9 " /* Omitting A1 to A6 as reference */
* local diff " A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12"

local y log_loan log_borr log_loan_borr log_borr_f

global cov  equity2_asset cash_asset fundingP


global fixed_effect  i.id_mfi i.district_code##i.year
cap mkdir "Graph_Event_Study"



reg log_loan  A1 A2 A3 A4 A5 A6 A7 A8 A9   $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event1
mat B1=e(b)

mat b=B1[" y1","A1".."A4"]
mat I=J(4,1,1)
mat m= b*I/4
scalar mean=m[1,1]
local k = mean

coefplot event1, keep($diff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Loan Amount") saving("Graph_Event_Study\event1", replace) 

reg log_borr  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov  $fixed_effect , cluster(district_code) noconstant 
estimates store event2
mat B2=e(b)

mat b=B2[" y1","A1".."A4"]
mat I=J(4,1,1)
mat m= b*I/4
scalar mean=m[1,1]
local k = mean
coefplot event2, keep($diff) vertical yline(`k') xline(4.5,lp(dash)lc(black))xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Number of Borrowers") saving("Graph_Event_Study\event2", replace)
 
reg log_loan_borr  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event3
mat B3=e(b)

mat b=B3[" y1","A1".."A4"]
mat I=J(4,1,1)
mat m= b*I/4
scalar mean=m[1,1]
local k = mean
coefplot event3, keep($diff) vertical   yline(`k')xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Loan Size") saving("Graph_Event_Study\event3", replace)


reg borr_f  A1 A2 A3 A4 A5 A6 A7 A8 A9  $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event4
mat B4=e(b)

mat b=B4[" y1","A1".."A4"]
mat I=J(4,1,1)
mat m= b*I/4
scalar mean=m[1,1]
local k = mean
coefplot event4, keep($diff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small))title("Female Borrowers Ratio")  saving("Graph_Event_Study\event4", replace)



graph combine "Graph_Event_Study\event1.gph" "Graph_Event_Study\event2.gph" "Graph_Event_Study\event3.gph" "Graph_Event_Study\event4.gph", saving(Graph_Event_Study\EventStudy,replace)

graph export "Graph_Event_Study\EventStudy.png", replace


hist event, saving(Graph_Event_Study\eventhist,replace)

graph export "Graph_Event_Study\eventhist.png", replace


hist year_ma


gen EconDev=log(pop_density)


//Interaction term with population density
foreach i in A1 A2 A3 A4 A5 A6 A7 A8 A9{
	
	gen `i'_E=`i'*EconDev
	
}

label var A1_E "-4"
label var A2_E "-3"
label var A3_E "-2"
label var A4_E "-1"
label var A5_E "0"
label var A6_E "1"
label var A7_E "2"
label var A8_E "3"
label var A9_E "4"

global coeff  A1_E A2_E A3_E A4_E  A5_E A6_E A7_E A8_E A9_E
 
 global var A1 A2 A3 A4 A5 A6 A7 A8 A9  A1_E A2_E A3_E A4_E A4_E A5_E A6_E A7_E A8_E A9_E  

global cov  equity2_asset cash_asset fundingP
global fixed_effect  i.id_mfi i.district_code##i.year



 reg log_loan  $var $cov $fixed_effect , cluster(district_code) noconstant
estimates store event5
mat B1=e(b)

scalar b1=B1["y1","A1_E"]
scalar b2=B1["y1","A2_E"]
scalar b3=B1["y1","A3_E"]
scalar b4=B1["y1","A4_E"]
scalar mean=(b1 + b2+ b3+ b4)/4
local k = mean

coefplot event5, keep($coeff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Loan Amount") saving("Graph_Event_Study\event5", replace) 


 
reg log_borr $var   $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event6
mat B1=e(b)

scalar b1=B1["y1","A1_E"]
scalar b2=B1["y1","A2_E"]
scalar b3=B1["y1","A3_E"]
scalar b4=B1["y1","A4_E"]
scalar mean=(b1 + b2+ b3+ b4)/4
local k = mean

coefplot event6, keep($coeff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Number of Borrowers") saving("Graph_Event_Study\event6", replace) 




 
reg log_loan_borr $var    $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event7
mat B1=e(b)
scalar b1=B1["y1","A1_E"]
scalar b2=B1["y1","A2_E"]
scalar b3=B1["y1","A3_E"]
scalar b4=B1["y1","A4_E"]
scalar mean=(b1 + b2+ b3+ b4)/4
local k = mean

coefplot event7, keep($coeff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Log of Loan Size") saving("Graph_Event_Study\event7", replace) 

 
reg borr_f $var     $cov  $fixed_effect , cluster(district_code) noconstant
estimates store event8
mat B1=e(b)

scalar b1=B1["y1","A1_E"]
scalar b2=B1["y1","A2_E"]
scalar b3=B1["y1","A3_E"]
scalar b4=B1["y1","A4_E"]
scalar mean=(b1 + b2+ b3+ b4)/4
local k = mean

coefplot event8, keep($coeff) vertical   yline(`k') xline(4.5,lp(dash)lc(black)) xtitle("Event time (Year - Year of Aquisition)", size(small)) title("Female Borrowers Ratio") saving("Graph_Event_Study\event8", replace) 



graph combine "Graph_Event_Study\event5.gph" "Graph_Event_Study\event6.gph" "Graph_Event_Study\event7.gph" "Graph_Event_Study\event8.gph", saving(Graph_Event_Study\EventStudy,replace)

graph export "Graph_Event_Study\EventStudy2.png", replace


 
sum log_loan log_borr log_loan_borr borr_f  equity2_asset cash_asset fundingP EconDev



/*
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


*/















