

/* This do file continues from "quarterly_analysis2_mfi.do" */

* Generating quarter of M&A


gen quarter_ma=.

replace quarter_ma=tq(2016q1) if id_mfi==202 
replace quarter_ma=tq(2015q1) if id_mfi==203 
replace quarter_ma=tq(2018q3) if id_mfi==205 
replace quarter_ma=tq(2018q4) if id_mfi==210 
replace quarter_ma=tq(2019q3) if id_mfi==212 
replace quarter_ma=tq(2017q1) if id_mfi==214 
replace quarter_ma=tq(2016q3) if id_mfi==215 

replace quarter_ma=tq(2016q2) if id_mfi==217 
replace quarter_ma=tq(2016q3) if id_mfi==218 
replace quarter_ma=tq(2018q2) if id_mfi==221 
*replace quarter_ma=tq(2014q3) if id_mfi==222 
replace quarter_ma=tq(2017q1) if id_mfi==224 
replace quarter_ma=tq(2018q3) if id_mfi==226 
replace quarter_ma=tq(2016q2) if id_mfi==228 
replace quarter_ma=tq(2017q1) if id_mfi==231 
replace quarter_ma=tq(2018q2) if id_mfi==233 

replace quarter_ma=tq(2019q4) if id_mfi==242 
replace quarter_ma=tq(2017q4) if id_mfi==245 
*replace quarter_ma=2014q2) if id_mfi==248 

replace quarter_ma=tq(2015q4) if id_mfi==252 
replace quarter_ma=tq(2017q3) if id_mfi==256 
replace quarter_ma=tq(2017q2) if id_mfi==259 
replace quarter_ma=tq(2016q4) if id_mfi==260 
replace quarter_ma=tq(2015q4) if id_mfi==269

replace quarter_ma=tq(2015q2) if id_mfi==271 
replace quarter_ma=tq(2016q3) if id_mfi==278 
replace quarter_ma=tq(2016q4) if id_mfi==279 
replace quarter_ma=tq(2015q1) if id_mfi==280 
replace quarter_ma=tq(2016q1) if id_mfi==285 
replace quarter_ma=tq(2015q3) if id_mfi==291 
replace quarter_ma=tq(2016q2) if id_mfi==301 

tab quarter_ma,m

g event=yearq-quarter_ma
drop if event==.
tab event,m


xi  i.event, noomit
forv i=1(1)40 {
gen A`i' = _Ievent_`i' 
}

label var A1 "-20"
label var A2 "-19"
label var A3 "-18"
label var A4 "-17"
label var A5 "-16"
label var A6 "-15"
label var A7 "-14"
label var A8 "-13"
label var A9 "-12"
label var A10 "-11"
label var A11 "-10"
label var A12 "-9"
label var A13 "-8"
label var A14 "-7"
label var A15 "-6"
label var A16 "-5"
label var A17 "-4"
label var A18 "-3"
label var A19 "-2"
label var A20 "-1"
label var A21 "0"
label var A22 "1"
label var A23 "2"
label var A24 "3"
label var A25 "4"
label var A26 "5"
label var A27 "6"
label var A28 "7"
label var A29 "8"
label var A30 "9"
label var A31 "10"
label var A32 "11"
label var A33 "12"
label var A34 "13"
label var A35 "14"
label var A36 "15"
label var A37 "16"
label var A38 "17"
label var A39 "18"
label var A40 "19"

gen log_par30=log(par_30)
rename ratio_par_30 ratio_par30

local log_loan "Log of Loan Amount"
local log_borr "Log of Number of Borrowers"
local log_loan_borr "Log of Loan Size"
local log_borr_f "Log of Female Borrowers Ratio"
local log_par30 "Log of Par 30"
local ratio_par30 "Ratio of Par 30"

local diff A1 A2 A3 A4 A5 A6 A7 A8 A9 A10 A11 A12 A13 A14 A15 A16 A17 A18 A19 A20 A21 A22 A23 A24 A25 A26 A27 A28 A29 A30 A31 A32 A33 A34 A35 A36 A37 A38 A39 A40


local y log_loan log_borr log_loan_borr log_borr_f log_par30 ratio_par30
local cov  equity2_asset cash_asset fundingP

foreach y in `y' {
cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

qui reg `y' `diff' `cov' i.id_mfi i.district_code i.yearq, cluster(district_code) nocons
*reg `y' `diff' `cov' i.id_mfi i.district_code i.yearq, cluster(district_code)

estimates store event`y'
coefplot event`y', keep(`diff') vertical  yline(0) xtitle("Event time (Quarter - Quarter of M&A)") title("``y''", size(medium)) scale(0.7) saving("event`y'nQ", replace)
graph export event`y'nQ.png, replace
}


graph combine eventlog_loannQ.gph eventlog_borrnQ.gph, rows(2) 
graph save "event1Q.gph", replace
graph export "event1Q.png", replace
graph export "event1Q.pdf", replace

graph combine eventlog_loan_borrnQ.gph eventlog_borr_fnQ.gph, rows(2)
graph save "event2Q.gph", replace
graph export "event2Q.png", replace
graph export "event2Q.pdf", replace


graph combine eventlog_par30nQ.gph eventratio_par30nQ.gph, rows(2)
graph save "event3Q.gph", replace
graph export "event3Q.png", replace
graph export "event3Q.pdf", replace
















