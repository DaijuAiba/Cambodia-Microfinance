


/*
***********************************
TECHNOLOGY, LOAN TYPE, EXPENDITURE AND HARVEST AMOUNT
***********************************
*/

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("BTB 1") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "btb1_t", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("BTB 2") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c

cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "btb2_t", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SRP1") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "srp1_t", replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SRP2") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "srp2_t", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("PLN") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "pln_t", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("SML") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "sml_t", replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022\20200515_JICA Data Collection_hg.xlsx", sheet("PST") firstrow

keep q0_1 q0_2 q2_2 q2_4c q1_13a q1_18 q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_4a q6_2 q6_3 q6_9 q7_1 q6_10 q6_11 q7_2a q7_2b q7_3 q7_4 q7_5 q8_6b q8_6c


cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
save "pst_t", replace

*********************************************************************
*********************************************************************
clear all
cd "C:\Users\phd14102\Google Drive\cma_nix\Agribuddy 20201022"
append using "btb1_t" "btb2_t" "srp1_t" "srp2_t" "pln_t" "sml_t" "pst_t", force


foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q6_10 q6_11 {
destring `var', replace force
}

tab q1_13a,m
rename q1_13a fam_s

tab q1_18,m 
rename q1_18 dist


tab q6_2,m
rename q6_2 land_s

tab q6_3,m
gen own_land=(q6_3=="Owner")

tab q6_9,m /* no of workers  */

tab q2_2,m
gen nonagri_inc=q2_2*2
replace nonagri_inc=0 if q2_2==.
tab nonagri_inc,m

tab  q2_4c
gen rem_inc=q2_4c*4
replace rem_inc=0 if  q2_4c==.

tab q8_6b,m 
gen covid_trouble=(q8_6b=="YES")

tab q8_6c,m
gen reduce_income=(q8_6c=="Reduce income")

sum q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 covid_trouble reduce_income


rename q0_1 b_code
rename q0_2 f_code

tab q5_4a,m
gen no_loan=(q5_4a=="")
gen ind_loan=(q5_4a=="Individual")
gen gr_loan=(q5_4a=="Group")

local loan_type no_loan ind_loan gr_loan
sum `loan_type'

gen harvest_kg=q6_10 
gen harvest_kg_m=q6_10 
replace harvest_kg_m=0 if harvest_kg_m==.

tab q6_11,m
gen price_kg=q6_11
replace price_kg=0 if q6_11==.
tab price_kg,m

gen agr_inc=harvest_kg_m*price_kg
sum agr_inc nonagri_inc

tab q7_2a,m 
tab q7_2b,m 

gen other_equip=(q7_2a=="Other"  | q7_2a=="" )
gen tiller_equip=(q7_2a=="Tiller" )
gen tractor_equip=(q7_2a=="Tractor")

local equip other_equip tiller_equip tractor_equip
sum `equip'

tab q7_3,m 
gen manual_planting=(q7_3=="Manual")
gen machine_planting=(q7_3=="Machine")
gen other_planting=(q7_3=="")
sum manual_planting machine_planting other_planting


tab q7_4,m 
gen machine_harvesting=(q7_4=="Machine")
gen manual_harvesting=(q7_4=="Manual")
gen other_harvesting=(q7_4=="")

local harvesting machine_harvesting manual_harvesting other_harvesting
sum `harvesting'

tab q7_5,m   /* Missing is treated as no use */
gen fert_use=(q7_5=="YES")
sum fert_use


gen food_exp=q3_1*52
replace food_exp=0 if food_exp==.
gen elec_wat_exp=q3_2*12
replace elec_wat_exp=0 if elec_wat_exp==.
gen topup_exp=q3_3*12
replace topup_exp=0 if topup_exp==.
gen travel_exp=q3_4*12
replace travel_exp=0 if travel_exp==.
gen health_exp=q3_5*12
replace health_exp=0 if health_exp==.
gen loan_exp=q3_6*12
replace loan_exp=0 if loan_exp==.
gen motor_exp=q3_7
replace motor_exp=0 if motor_exp==.
gen educ_exp=q3_8 
replace educ_exp=0 if educ_exp==.
gen gamble_exp=q3_9 
replace gamble_exp=0 if gamble_exp==.
gen social_exp=q3_10 
replace social_exp=0 if social_exp==.

gen total_inc_yr=agr_inc+nonagri_inc+rem_inc
gen total_exp_yr=food_exp+elec_wat_exp+topup_exp+travel_exp+health_exp+loan_exp+motor_exp+educ_exp+gamble_exp+social_exp
gen nonfood_exp=total_exp_yr-food_exp

sum total_inc_yr total_exp_yr

local all_vars harvest_kg harvest_kg_m fam_s land_s own_land no_loan ind_loan gr_loan tiller_equip tractor_equip other_equip manual_planting machine_planting other_planting manual_harvesting machine_harvesting   other_harvesting fert_use food_exp nonfood_exp health_exp total_exp_yr agr_inc nonagri_inc rem_inc total_inc_yr covid_trouble reduce_income

collapse(mean) `all_vars', by(f_code)
sum `all_vars'

/*
collapse(mean) `all_vars', by(dist)
sum `all_vars'
*/

*tabstat `all_vars' , stat(mean sd n min max)


local y1 harvest_kg_m total_inc_yr agr_inc nonagri_inc rem_inc
local y2 total_exp_yr food_exp nonfood_exp health_exp

local x1 land_s own_land water_s ind_loan gr_loan  tiller_equip tractor_equip manual_planting machine_planting manual_harvesting machine_harvesting fert_use covid_trouble
local x2 fam_s ind_loan gr_loan  tiller_equip tractor_equip manual_planting machine_planting manual_harvesting machine_harvesting fert_use covid_trouble


foreach y in `y1' {
reg `y' `x1', r
estimates store x1_`y'
local output1 `output1' x1_`y'
}
estimates table `output1', keep(`x1') b(%9.3f) se(%9.3f) stats(r2_a N)
*estimates table `output1', keep(`x1') star stats(r2_a N)


foreach y in `y2' {
reg `y' `x2', r
estimates store x2_`y'
local output2 `output2' x2_`y'
}
estimates table `output2', keep(`x2') b(%9.3f) se(%9.3f) stats(r2_a N)
*estimates table `output2', keep(`x2') star stats(r2_a N)








