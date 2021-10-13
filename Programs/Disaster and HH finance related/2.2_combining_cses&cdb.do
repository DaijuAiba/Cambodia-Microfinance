

* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey

clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance"

clear
append using cses2014all cses2015all cses2016all cses2017all cses2019all, force
merge m:1 commune_id year using appended_CDB2014-19all
drop if _merge!=3
drop _merge


* Additional cleaning after merging and appending 
/* Liability data is only for those households with outstanding debt, so we make the dummies zero for those without debt, and we do the same for income, and food and non-food expenditure. */

*OUTLIER income_livestock, KEEP IF < 50,000,000,000 AND income_livestockUSD < 10,000,000

local v productive_P cons_cashf_P refinance_P other_P f_ins1 f_ins2 inf_ins1 inf_ins2 mfi_ngo money_lender any_debt total_borrowed total_borrowedUSD income incomeUSD food_cons food_consUSD  nonfood_exp nonfood_expUSD land_size own_land title_gov title_local land_coll income_crop income_cropUSD income_livestock income_livestockUSD cost_crop cost_cropUSD cost_livestock1 cost_livestock2 cost_livestock1USD cost_livestock2USD

foreach v in `v' {
    replace `v'=0 if `v'==.
	sum `v'
}

* Managing outliers
drop if income_livestock>1000000000 | income_livestockUSD>250000
drop if income>100000000 | incomeUSD>25000
drop if food_cons>100000000 | food_consUSD>25000
drop if nonfood_exp>100000000 | nonfood_expUSD>25000

rename income income_empt
rename incomeUSD incomeUSD_empt

gen income_total= income_empt + income_crop + income_livestock
gen cost_livestock=cost_livestock1 + cost_livestock2
gen cost_total= food_cons + nonfood_exp + cost_crop + cost_livestock
gen income_totalUSD=income_total/4000
gen cost_livestockUSD=cost_livestock1USD + cost_livestock2USD
gen cost_totalUSD=cost_total/4000

sum incomeUSD_empt food_consUSD nonfood_expUSD income_total cost_total income_totalUSD cost_totalUSD

gen ln_income_empt=log(income_empt)
gen ln_income_crop=log(income_crop)
gen ln_income_livestock=log(income_livestock)
gen ln_food_cons=log(food_cons)
gen ln_nonfood_exp=log(nonfood_exp)
gen ln_cost_crop=log(cost_crop)
gen ln_cost_livestock=log(cost_livestock)
gen ln_total_borrowed=log(total_borrowed)
gen ln_road_length=log(road_length)
gen ln_income_total=log(income_total)
gen ln_cost_total=log(cost_total)

replace productive_P=. if any_debt==0

save "combined_cses_cdb.dta", replace
