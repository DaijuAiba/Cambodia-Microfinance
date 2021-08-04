



/* 
PROJECT TITLE: FINANCIAL INCLUSION IN CAMBODIA
PROJECT LEADER: Dr. Aiba Daiju
RESEARCH ASSISTANT: Hailegabriel Abebe Fenta
*/
 
clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
use "CMA-NIX 2014q4-2019q4.dta", clear

* Cleaning variables and generating new variables

tab time,m
drop if time==""

gen yearq = quarterly(time, "YQ") 
format yearq %tq 

gen year = yofd(dofq(yearq))
*numdate quarterly q1 = yearq, pattern(YQ)

tab district_code,m
drop if district_code==.

drop if district_code==1213 | district_code==1214 /* Only in 2019 */


replace district_code=2501 if district_code==304
replace district_code=2502 if district_code==309
replace district_code=2503 if district_code==310
replace district_code=2504 if district_code==311
replace district_code=2505 if district_code==312
replace district_code=2506 if district_code==317
replace district_code=2507 if district_code==316

tab district_code,m

distinct district_code  // 197 distinct district codes
gen dist=district_code
tostring district_code, replace
replace district_code="0"+district_code if dist<1000
drop dist
tab district_code,m


********************************************
tab MFI_id,m
rename MFI_id id_mfi


gen MA_q=0

replace MA_q=1 if id_mfi==202 & yearq>=tq(2016q1)
replace MA_q=1 if id_mfi==203 & yearq>=tq(2015q1)
replace MA_q=1 if id_mfi==205 & yearq>=tq(2018q3)
replace MA_q=1 if id_mfi==210 & yearq>=tq(2018q4)
replace MA_q=1 if id_mfi==212 & yearq>=tq(2019q3)
replace MA_q=1 if id_mfi==214 & yearq>=tq(2017q1)
replace MA_q=1 if id_mfi==215 & yearq>=tq(2016q3)

replace MA_q=1 if id_mfi==217 & yearq>=tq(2016q2)
replace MA_q=1 if id_mfi==218 & yearq>=tq(2016q3)
replace MA_q=1 if id_mfi==221 & yearq>=tq(2018q2)
*replace MA_q=1 if id_mfi==222 & yearq>=tq(2014q3)
replace MA_q=1 if id_mfi==224 & yearq>=tq(2017q1)
replace MA_q=1 if id_mfi==226 & yearq>=tq(2018q3)
replace MA_q=1 if id_mfi==228 & yearq>=tq(2016q2)
replace MA_q=1 if id_mfi==231 & yearq>=tq(2017q1)
replace MA_q=1 if id_mfi==233 & yearq>=tq(2018q2)

replace MA_q=1 if id_mfi==242 & yearq>=tq(2019q4)
replace MA_q=1 if id_mfi==245 & yearq>=tq(2017q4)
*replace MA_q=1 if id_mfi==248 & yearq>=tq(2014q2)

replace MA_q=1 if id_mfi==252 & yearq>=tq(2015q4)
replace MA_q=1 if id_mfi==256 & yearq>=tq(2017q3)
replace MA_q=1 if id_mfi==259 & yearq>=tq(2017q2)
replace MA_q=1 if id_mfi==260 & yearq>=tq(2016q4)
replace MA_q=1 if id_mfi==269 & yearq>=tq(2015q4)

replace MA_q=1 if id_mfi==271 & yearq>=tq(2015q2)
replace MA_q=1 if id_mfi==278 & yearq>=tq(2016q3)
replace MA_q=1 if id_mfi==279 & yearq>=tq(2016q4)
replace MA_q=1 if id_mfi==280 & yearq>=tq(2015q1)
replace MA_q=1 if id_mfi==285 & yearq>=tq(2016q1)
replace MA_q=1 if id_mfi==291 & yearq>=tq(2015q3)
replace MA_q=1 if id_mfi==301 & yearq>=tq(2016q2)

tab MA_q,m
sum MA_q

merge m:1 district_code year using  "appended_CDB2014-19all"
drop if _merge!=3   
drop _merge


merge m:m id_mfi year using  "asset_liq_mfi-nbcFS"
drop if _merge!=3   
drop _merge



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
gen loan_size=amount_loan/total_num_borrowers
gen log_loan_borr=log(loan_size)
gen borr_f=num_female_loan/total_num_borrowers
gen log_borr_f=log(borr_f)

gen urban=(strpos(district_name, "(Krong)")>0) /* "Krong" is city/town in Khmer */
tab urban,m
gen rural=(urban==0)
bys id_mfi: egen rloan=mean(amount_loan) if rural==1
gen log_rloan=log(rloan)
*******************************************************

* Regression Analysis

local x0 equity2_asset log_borr log_loan_borr log_borr_f log_rloan 
local x1 `x0' i.id_mfi
local x2 `x1' i.district_code
local x3 `x2' i.yearq

foreach x in 0 1 2 3 {
qui reg MA_q `x`x'', cluster(district_code)
estimates store x`x'
local output `output' x`x'
}
estimates table `output', keep(`x0') b(%9.3f) se(%9.3f) stats(r2_a N)

