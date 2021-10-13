

* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey

clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance\CSES2019"

use "S09_HHDurableGoods", clear 
gen tv=(q09_c03==802)
gen motorcycle=(q09_c03==804)
gen cell_phone=(q09_c03==818)
gen ac_fan=(q09_c03==811 | q09_c03==812)
gen radio=(q09_c03==801)
gen pc=(q09_c03==825)
gen refrigerator=(q09_c03==810)
collapse (max) tv motorcycle cell_phone ac_fan radio pc refrigerator, by(hhid)
save "hhdurablegoods1", replace 

use "S01B_HHFoodConsumptionX", clear
/* To change it the weekly food consumtion to annual data, I multiply it by 52. */
gen food_cons=q01bc5*52 
gen food_consUSD=food_cons/4000
collapse (sum) food_cons food_consUSD, by(hhid)
save "hhfoodconsumption1", replace 

use "S05A_HHLandOwnership", clear
gen land_size=q05ac02 
gen own_land=(q05ac03==1)
gen title_gov=(q05ac13a==3) 
gen title_local=(q05ac13a==1 | q05ac13a==2 | q05ac13a==4)
gen land_coll=(q05ac20==1) 
collapse (sum) land_size (max) own_land title_gov title_local land_coll, by(hhid)
save "hhlandownership1", replace

use "S06_HHLiabilities", clear
* Borrowing purpose
gen productive_P=(q06_c05==1 | q06_c05==2) if q06_c05!=.
gen cons_cashf_P=(q06_c05>=3 & q06_c05<=8) if q06_c05!=.
gen refinance_P=(q06_c05==9) if q06_c05!=.
gen other_P=(q06_c05==10) if q06_c05!=.
gen non_productive_P=(q06_c05>=3) if q06_c05!=.

* Loan source
gen f_ins1=(q06_c04==8 | q06_c04==10)   // bank & mfi
gen f_ins2=(q06_c04==8 | q06_c04==9 | q06_c04==10) //bank, ngo, & mfi
gen inf_ins1=(q06_c04>=1 & q06_c04<=7)  //including relatives
gen inf_ins2=(q06_c04>=3 & q06_c04<=7) 
gen mfi_ngo=(q06_c04==9 | q06_c04==10)
gen money_lender=(q06_c04==4)
gen total_borrowed=q06_c06
gen total_borrowedUSD=q06_c06/4000
gen outstand_loan=q06_c07 
gen interest_monthly=q06_c08 if q06_c08<=40 & q06_c08 !=.
gen months_debtP=q06_c03 
gen debt_age= q06_c02 
collapse (max) productive_P cons_cashf_P refinance_P other_P non_productive_P f_ins1 f_ins2 inf_ins1 inf_ins2 mfi_ngo money_lender (sum) total_borrowed total_borrowedUSD outstand_loan (mean) interest_monthly months_debtP debt_age, by(hhid)
save "hhliabilities1", replace




use "S01A_HHmemberAllvar", clear
gen head_female=(q01ac06==1 & q01ac03==2) /* q01ac06 member status & q01ac03 is sex */
collapse (max) head_female, by(hhid)
save "hhmembers1", replace

use "S01-17_HHOtherInfo", clear
gen any_debt=(q06_q1==1)
gen health_subsidy=(q13aq1==1)
gen hh_size=tot_mem
keep any_debt health_subsidy hhid hh_size 
save "hhotherinfo1", replace

use "S01C_HHRecallNonFoodX", clear
/* For some non-food expenditure, we may change it to annual data, for example, I multiply 1 month data by 12, and 6 month data by 2 */
gen nonfood_exp=q01cc06 
replace nonfood_exp=q01cc06*12 if q01cc01==1 | q01cc01==2 | q01cc01==4 | q01cc01==5 | q01cc01==6 | q01cc01==8
replace nonfood_exp=q01cc06*2 if q01cc01==9 
gen nonfood_expUSD=nonfood_exp/4000
collapse (sum) nonfood_exp nonfood_expUSD, by(hhid)
save "hhrecallnonfood1", replace


use "q01-q17_hhvulnerability", clear
gen cheap_food=(q01dq02a>=1) /* at least once in last week  */
gen borrow_food=(q01dq02b>=1) 
gen reduce_mealN=(q01dq02c>=1) 
gen reduce_mealS=(q01dq02d>=1) 
* Past 30 days
gen ever_noFood=(q01dq4==1) 
gen sold_HHgoods=(q01dq3a==3) /* during last month  */
gen sold_PRODassets=(q01dq3b==3) 
gen spent_savings=(q01dq3d==3) 
gen sold_house_land=(q01dq3f==3) 
* ID poor card posession
gen equity_card=(q01dq7a==1) 
gen priority_card=(q01dq7b==1) 
gen other_card=(q01dq7c==1)
gen any_poorCard=(q01dq7a==1 | q01dq7b==1 | q01dq7c==1)
keep cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood sold_HHgoods sold_PRODassets spent_savings sold_house_land equity_card priority_card other_card any_poorCard hhid
save "hhvulnerability1", replace
*/

/*
use "households", clear
gen hh_size=total
keep hh_size hhid psu
save "households1", replace
*/

use "S15_PersonEcoCurrent", clear
* I multiply the monthly income by 12 to change it to annual data
gen income=q15_c20*12
gen incomeUSD=income/4000
tab q15_c13b
*destring q15_c13b, gen(desq15_c13b)
gen income_agri=(q15_c13b<210) 
collapse (sum) income incomeUSD (max) income_agri, by(hhid)
save "personecocurrent1", replace

use "S02_PersonEducation", clear
gen ever_attendedH=(q02c04==1 & q02c1b==1)
gen years_attendedH=q02c05 if q02c1b==1
* Education for the head of household
gen primary_hh=(q02c08<7 & q02c1b==1) 
gen secondaryAB_hh=(q02c08>=7 & q02c1b==1) 
gen diploma_certAB_hh=(q02c08>=13 & q02c1b==1) 
gen degree_aboveAB_hh=(q02c08>=18 & q02c1b==1) 
collapse (max) primary_hh secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh ever_attendedH (mean) years_attendedH, by(hhid)
save "personeducation1", replace

use "S13_PersonIllness_V6", clear
gen sick=(q13bc2a==1) /* Any member sick last month */
collapse (max) sick, by(hhid)
save "personillness1", replace

/*
use "NewHouseholdWeights(HW)_2020-10-20", clear
*gen rural=(urbrur==2)
*rename hhsize HHSize
rename HW1920a hhw
tostring hhid, replace
tostring psu, replace
keep psu hhid hhw
save "weighthouseholds1", replace
*/

use "temp_geographic", clear
rename districtid district_code
rename communeid commune_code
rename villageid village_code
rename hhweight hhwt
rename datayear year

gen province_code=.
replace province_code=1 if province_name=="Banteay Meanchey"
replace province_code=2 if province_name=="Battambang"
replace province_code=3 if province_name=="Kampong Cham"
replace province_code=4 if province_name=="Kampong Chhnang"
replace province_code=5 if province_name=="Kampong Speu"
replace province_code=6 if province_name=="Kampong Thom"
replace province_code=7 if province_name=="Kampot"
replace province_code=8 if province_name=="Kandal"
replace province_code=9 if province_name=="Koh Kong"
replace province_code=10 if province_name=="Kratie"
replace province_code=11 if province_name=="Mondul Kiri"
replace province_code=12 if province_name=="Phnom Penh"
replace province_code=13 if province_name=="Preah Vihear"
replace province_code=14 if province_name=="Prey Veng"
replace province_code=15 if province_name=="Pursat"
replace province_code=16 if province_name=="Ratanak Kiri"
replace province_code=17 if province_name=="Siemreap"
replace province_code=18 if province_name=="Preah Sihanouk"
replace province_code=19 if province_name=="Stung Treng"
replace province_code=20 if province_name=="Svay Rieng"
replace province_code=21 if province_name=="Takeo"
replace province_code=22 if province_name=="Otdar Meanchey"
replace province_code=23 if province_name=="Kep"
replace province_code=24 if province_name=="Pailin"
replace province_code=25 if province_name=="Tboung Khmum"
tab province_code,m

keep hhid psu province_code district_code commune_code village_code hhwt year
save "temp_psudata1", replace

/*
use "psulisting", clear
/*
rename Province_Code province_code
rename District_Code district_code
rename Commune_Code commune_code
rename Village_Code village_code
*/
keep psu province_code district_code commune_code village_code
save "psulisting1", replace
*/
use "temp_hhsize", clear
rename hhsize HHSize
keep hhid HHSize
save "hhsize1", replace

use "q05b_hhproductioncrops", clear
gen income_crop=(q05bc06-q05bc07-q05bc08)*q05bc09 if (q05bc07+q05bc08)< q05bc06
gen income_cropUSD=income_crop/4000
collapse (sum) income_crop income_cropUSD, by(hhid)
save "hhproductioncrops1", replace

use "S05C_HHCostCultivationCrop", clear
gen cost_crop=q05cc16
gen cost_cropUSD=q05cc16/4000
collapse (sum) cost_crop cost_cropUSD, by(hhid)
save "hhcostcultivationcrops1", replace

use "S05E_HHLivestock1_update", clear
gen income_livestock=q05e1c09+q05e1c13
gen income_livestockUSD=income_livestock/4000
gen cost_livestock1=q05e1c10
gen cost_livestock1USD=q05e1c10/4000
collapse (sum) income_livestock income_livestockUSD cost_livestock1 cost_livestock1USD, by(hhid)
save "hhlivestock11", replace

use "S05E_HHLivestock2", clear
gen cost_livestock2=q05e2c03 
gen cost_livestock2USD=cost_livestock2/4000
collapse (sum) cost_livestock2 cost_livestock2USD, by(hhid)
save "hhlivestock21", replace

***************************************8


* MERGING ALL

clear
mergemany 1:1 hhdurablegoods1 hhfoodconsumption1 hhlandownership1 hhliabilities1 hhmembers1 hhotherinfo1 hhrecallnonfood1 hhvulnerability1 personecocurrent1 personeducation1 personillness1 temp_psudata1 hhsize1 hhproductioncrops1 hhcostcultivationcrops1 hhlivestock11 hhlivestock21, match(hhid)

br psu hhid province_code district_code commune_code village_code

tostring province_code, gen(pr_code)
tostring district_code, gen(dist_code)
tostring commune_code, gen(comm_code)
tostring village_code, gen(vill_code)

replace pr_code="0"+pr_code if province_code<10
replace dist_code="0"+dist_code if district_code<10
replace comm_code="0"+comm_code if commune_code<10
replace vill_code="0"+vill_code if village_code<10


gen district_id=pr_code+dist_code
gen commune_id=pr_code+dist_code+comm_code
gen village_id=pr_code+dist_code+comm_code+vill_code

drop province_code district_code commune_code village_code pr_code dist_code comm_code vill_code

br hhid psu district_id
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance"

save "cses2019all", replace