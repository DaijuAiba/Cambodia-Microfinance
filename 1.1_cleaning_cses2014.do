
* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey

clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance\CSES2014"

use "hhdurablegoods", clear 
gen tv=(Q09_C03==802)
gen motorcycle=(Q09_C03==804)
gen cell_phone=(Q09_C03==818)
gen ac_fan=(Q09_C03==811 | Q09_C03==812)
gen radio=(Q09_C03==801)
gen pc=(Q09_C03==825)
gen refrigerator=(Q09_C03==810)
collapse (max) tv motorcycle cell_phone ac_fan radio pc refrigerator, by(hhid)
save "hhdurablegoods1", replace 

use "hhfoodconsumption", clear
/* To change it the weekly food consumtion to annual data, I multiply it by 52. */
gen food_cons=Q01BC05*52 
gen food_consUSD=food_cons/4000
collapse (sum) food_cons food_consUSD, by(hhid)
save "hhfoodconsumption1", replace 

use "hhlandownership", clear
gen land_size=Q05AC02 
gen own_land=(Q05AC03==1)
gen title_gov=(Q05AC13A==3) 
gen title_local=(Q05AC13A==1 | Q05AC13A==2 | Q05AC13A==4)
gen land_coll=(Q05AC20==1) 
collapse (sum) land_size (max) own_land title_gov title_local land_coll, by(hhid)
save "hhlandownership1", replace

use "hhliabilities", clear
* Borrowing purpose
gen productive_P=(Q06_C05==1 | Q06_C05==2) if Q06_C05!=.
gen cons_cashf_P=(Q06_C05>=3 & Q06_C05<=8) if Q06_C05!=.
gen refinance_P=(Q06_C05==9) if Q06_C05!=.
gen other_P=(Q06_C05==10) if Q06_C05!=.
gen non_productive_P=(Q06_C05>=3) if Q06_C05!=.
* Loan source
gen f_ins1=(Q06_C04==8 | Q06_C04==11)   // bank & mfi
gen f_ins2=(Q06_C04==8 | Q06_C04==9 | Q06_C04==11) //bank, ngo, & mfi
gen inf_ins1=(Q06_C04>=1 & Q06_C04<=7)  //including relatives
gen inf_ins2=(Q06_C04>=3 & Q06_C04<=7) 
gen mfi_ngo=(Q06_C04==9 | Q06_C04==11)
gen money_lender=(Q06_C04==4)
gen total_borrowed=Q06_C06
gen total_borrowedUSD=Q06_C06/4000
gen outstand_loan=Q06_C07 
gen interest_monthly=Q06_C08 if Q06_C08<=40 & Q06_C08 !=.
gen months_debtP=Q06_C03 
gen debt_age= Q06_C02 
collapse (max) productive_P cons_cashf_P refinance_P other_P non_productive_P f_ins1 f_ins2 inf_ins1 inf_ins2 mfi_ngo money_lender (sum) total_borrowed total_borrowedUSD outstand_loan (mean) interest_monthly months_debtP debt_age, by(hhid)
save "hhliabilities1", replace


use "hhmembers", clear
gen head_female=(Q01AC06==1 & Q01AC03==2) /* Q01AC06 member status & Q01AC03 is sex */
collapse (max) head_female, by(hhid)
save "hhmembers1", replace

use "hhotherinfo", clear
gen any_debt=(Q06_Q1==1)
gen health_subsidy=(Q13AQ1==1) 
keep any_debt health_subsidy hhid
save "hhotherinfo1", replace

use "hhrecallnonfood", clear
/* For some non-food expenditure, we may change it to annual data, for example, I multiply 1 month data by 12, and 6 month data by 2 */
gen nonfood_exp=Q01CC06 
replace nonfood_exp=Q01CC06*12 if Q01CC01==1 | Q01CC01==2 | Q01CC01==4 | Q01CC01==5 | Q01CC01==6 | Q01CC01==8
replace nonfood_exp=Q01CC06*2 if Q01CC01==9 
gen nonfood_expUSD=nonfood_exp/4000
collapse (sum) nonfood_exp nonfood_expUSD, by(hhid)
save "hhrecallnonfood1", replace

use "hhvulnerability", clear
gen cheap_food=(Q01DQ1A>=1) /* at least once in last week  */
gen borrow_food=(Q01DQ1B>=1) 
gen reduce_mealN=(Q01DQ1C>=1) 
gen reduce_mealS=(Q01DQ1D>=1) 
* Past 30 days
gen ever_noFood=(Q01DQ3==1) 
gen sold_HHgoods=(Q01DQ2A==3) /* during last month  */
gen sold_PRODassets=(Q01DQ2B==3) 
gen spent_savings=(Q01DQ2D==3) 
gen sold_house_land=(Q01DQ2F==3) 
* ID poor card posession
gen equity_card=(Q01DQ6A==1) 
gen priority_card=(Q01DQ6B==1) 
gen other_card=(Q01DQ6C==1)
gen any_poorCard=(Q01DQ6A==1 | Q01DQ6B==1 | Q01DQ6C==1)
keep cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood sold_HHgoods sold_PRODassets spent_savings sold_house_land equity_card priority_card other_card any_poorCard hhid
save "hhvulnerability1", replace

use "households", clear
gen hh_size=Total
keep hh_size hhid
save "households1", replace

use "personecocurrent", clear
* I multiply the monthly income by 12 to change it to annual data
gen income=Q15_C20*12
gen incomeUSD=income/4000
tab Q15_C13B
destring Q15_C13B, gen(desQ15_C13B)
gen income_agri=(desQ15_C13B<210) 
collapse (sum) income incomeUSD (max) income_agri, by(hhid)
save "personecocurrent1", replace

use "personeducation", clear
gen ever_attendedH=(Q02C04==1 & Q02C1b==1)
gen years_attendedH=Q02C05 if Q02C1b==1
* Education for the head of household
gen primary_hh=(Q02C08<7 & Q02C1b==1) 
gen secondaryAB_hh=(Q02C08>=7 & Q02C1b==1) 
gen diploma_certAB_hh=(Q02C08>=13 & Q02C1b==1) 
gen degree_aboveAB_hh=(Q02C08>=18 & Q02C1b==1) 
collapse (max) primary_hh secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh ever_attendedH (mean) years_attendedH, by(hhid)
save "personeducation1", replace

use "personillness", clear
gen sick=(Q13BC2A==1) /* Any member sick last month */
collapse (max) sick, by(hhid)
save "personillness1", replace

use "weighthouseholds", clear
gen rural=(urbrur=="2")
destring HHSize, replace
destring HW14A, gen(hhwt)
keep psu hhid rural HHSize hhwt
save "weighthouseholds1", replace

use "psulisting", clear
rename Province_Code province_code
rename District_Code district_code
rename Commune_Code commune_code
rename Village_Code village_code
keep psu province_code district_code commune_code village_code
save "psulisting1", replace

use "hhproductioncrops", clear
gen income_crop=(Q05BC06-Q05BC07-Q05BC08)*Q05BC09 if (Q05BC07+Q05BC08)< Q05BC06
gen income_cropUSD=income_crop/4000
collapse (sum) income_crop income_cropUSD, by(hhid)
save "hhproductioncrops1", replace

use "hhcostcultivationcrops", clear
gen cost_crop=Q05CC16
gen cost_cropUSD=Q05CC16/4000
collapse (sum) cost_crop cost_cropUSD, by(hhid)
save "hhcostcultivationcrops1", replace

use "hhlivestock1", clear
gen income_livestock=Q05E1C09+Q05E1C13
gen income_livestockUSD=income_livestock/4000
gen cost_livestock1=Q05E1C10
gen cost_livestock1USD=Q05E1C10/4000
collapse (sum) income_livestock income_livestockUSD cost_livestock1 cost_livestock1USD, by(hhid)
save "hhlivestock11", replace

use "hhlivestock2", clear
gen cost_livestock2=Q05E2C03 
gen cost_livestock2USD=cost_livestock2/4000
collapse (sum) cost_livestock2 cost_livestock2USD, by(hhid)
save "hhlivestock21", replace


clear
mergemany 1:1 hhdurablegoods1 hhfoodconsumption1 hhlandownership1 hhliabilities1 hhmembers1 hhotherinfo1 hhrecallnonfood1 hhvulnerability1 households1 personecocurrent1 personeducation1 personillness1 weighthouseholds1 hhproductioncrops1 hhcostcultivationcrops1 hhlivestock11 hhlivestock21, match(hhid)

merge m:1 psu using psulisting1
drop if _merge!=3
drop _merge

br psu hhid province_code district_code commune_code village_code

gen district_id=province_code+district_code
gen commune_id=province_code+district_code+commune_code
gen village_id=province_code+district_code+commune_code+village_code

drop province_code district_code commune_code village_code 
br hhid psu district_id


gen year=2014
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance"
save "cses2014all", replace