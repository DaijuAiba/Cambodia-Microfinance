

clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
use "cleaned_merged2011_19.dta", clear

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

browse if missing(real(hybrid_cap))
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



tab year,m
tab year_ma,m  /* Year of Merger and Acquisition */

g event=year-year_ma
replace event=-6 if event==.
tab event,m


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

local log_loan "Log of Loan Amount"
local log_borr "Log of Number of Borrowers"
local log_loan_borr "Log of Loan Size"
local log_borr_f "Log of Female Borrowers Ratio"

local diff "A7 A8 A9 A10 A11 A12" /* Omitting A1 to A6 as reference */
local y log_loan log_borr log_loan_borr log_borr_f
local cov  equity2_asset cash_asset fundingP

foreach y in `y' {
cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

qui reg `y' `diff' `cov' i.id_mfi i.district_code##i.year, cluster(district_code)

estimates store event`y'
coefplot event`y', keep(`diff') vertical  yline(0) xtitle("Event time (Year - Year of M&A)", size(small)) title("``y''", size(medium)) saving("event`y'n", replace)
graph export event`y'n.png, replace
}

/*
graph combine eventlog_loan.gph eventlog_borr.gph eventlog_loan_borr.gph eventlog_borr_f.gph
graph save "event1.gph", replace
graph export "event1.png", replace
*/

graph combine eventlog_loann.gph eventlog_borrn.gph eventlog_loan_borrn.gph eventlog_borr_fn.gph
graph save "event2.gph", replace
graph export "event2.png", replace


















