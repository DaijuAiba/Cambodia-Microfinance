
** Determinants of Interest Rate

cd "C:\Users\phd14102\Google Drive\cma_nix\interest rate"
use "MFI_NBC_CMA.dta", clear


*** DEFINING VARIABLES ***
d
distinct id name year

label var interest_rate "Interest rate"
label var effective_interest_rate "Effective interest rate"
label var agri_loan "Ratio of agricultural loan to total loan"
label var log_assets "Log of asset"
label var operate_cost1 "Ratio of operating cost to asset"
label var Funding_cost "Ratio of funding cost to borrowing plus deposit"
label var rural_toloan "Ratio of loan in rural areas to total loans"
label var women_borrowers "Ratio of number of female borrowers to total borrowers"
label var loan_borrowers "average loan size per borrower for each MFI"
label var log_loan_borrowers "log of average loan size per borrower"


* SUMMARY STATISTICS
local vars interest_rate effective_interest_rate agri_loan log_assets operate_cost1 operate_cost2 Funding_cost rural_toloan women_borrowers loan_borrowers log_loan_borrowers borrowers_loan
tabstat `vars', stat(mean sd n) long col(stat)

* REGRESSION ANALYSIS WITHOUT MFI FE AND ROBUST SE
local outcome interest_rate effective_interest_rate
local credit agri_loan women_borrowers log_loan_borrowers rural_toloan
local operation log_assets operate_cost1 Funding_cost

foreach var in `outcome' {
qui reg `var'  `credit' `operation' i.year, r
estimates store ols`var'
local output1 `output1' ols`var'
}
estimates table `output1', keep(`credit' `operation') b(%9.3f) se(%9.3f) stats( r2_a N)

* REGRESSION ANALYSIS WITHOUT MFI FE AND CLUSTERED SE AT MFI LEVEL
local outcome interest_rate effective_interest_rate
local credit agri_loan women_borrowers log_loan_borrowers rural_toloan
local operation log_assets operate_cost1 Funding_cost

foreach var in `outcome' {
qui reg `var'  `credit' `operation' i.year, cluster(id)
estimates store ols`var'
local output1 `output1' ols`var'
}
estimates table `output1', keep(`credit' `operation') b(%9.3f) se(%9.3f) stats( r2_a N)

* REGRESSION ANALYSIS WITH BOTH YEAR AND MFI FE, AND ROBUST SE

local outcome interest_rate effective_interest_rate
local credit agri_loan women_borrowers log_loan_borrowers rural_toloan
local operation log_assets operate_cost1 Funding_cost

foreach var in `outcome' {
qui reg `var'  `credit' `operation' i.year i.id, cluster(id)
estimates store ols`var'
local output1 `output1' ols`var'
}
estimates table `output1', keep(`credit' `operation') b(%9.3f) se(%9.3f) stats( r2_a N)

* REGRESSION ANALYSIS WITH BOTH YEAR AND MFI FE, AND CLUSTERED SE AT MFI LEVEL

local outcome interest_rate effective_interest_rate
local credit agri_loan women_borrowers log_loan_borrowers rural_toloan
local operation log_assets operate_cost1 Funding_cost

foreach var in `outcome' {
qui reg `var'  `credit' `operation' i.year i.id, cluster(id)
estimates store ols`var'
local output1 `output1' ols`var'
}
estimates table `output1', keep(`credit' `operation') b(%9.3f) se(%9.3f) stats( r2_a N)





