
* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta


******************************
***********************
** REGRERSSION ALALYSIS USING POOLED DATA 2014-17
**************************


cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
log close _all
log using "log files\regression_pooled", text replace
use "pooled_20210719.dta", clear

set matsize 5000

************************
***** MODEL ONE ********
************************
************************
encode hhid, gen(hhid1)
encode village_id, gen(village_id1)
encode comm_id, gen(comm_id1)
encode district_id, gen(district_id1)
encode province_id, gen(province_id1)

/*
income_month food_cons nonfood_exp total_borrowed 
income_month_n food_cons_n nonfood_exp_n total_borrowed_n
*/
gen log_agriL=log(agri_land)
gen health_subs=(health_subsidy==1)
gen inc_fromAgri=(income_agri==1)

/* DESCRIPTIVE ANALYSIS  */
* Dependent variables
#delimit;
sum income_month_n food_cons_n nonfood_exp_n 
total_borrowed_n ln_income_month ln_food_cons
ln_nonfood_exp ln_total_borrowed any_debt f_ins2;

* Independent variables
#delimit;
sum fam_flood fam_drought fam_storm log_pop log_land_size dist_f_new exist_formal asset2_more inc_fromAgri tv motorcycle cell_phone ac_fan radio pc refrigerator secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh years_attendedH own_land plot_size log_plotS agri_land log_agriL hh_size hh_sizeN health_subs head_female  cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood equity_card priority_card any_poorCard;

**************************************************
/* REGRESSIONAL analysis  */

#delimit;
local vlist fam_flood fam_drought fam_storm;
local depv ln_income_month ln_food_cons ln_nonfood_exp ln_total_borrowed any_debt f_ins2 cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood; 
local covars dist_f_new exist_formal asset2_more tv motorcycle cell_phone ac_fan radio pc refrigerator secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh own_land  head_female log_agriL hh_sizeN equity_card priority_card 
any_poorCard;

foreach y in `depv' {;
qui reg `y' `vlist' i.year i.district_id1 `covars', cluster(district_id1);
estimates store `y';
local output `output' `y';
};
estimates table `output', keep(`vlist' `covars') b(%9.3f) se(%9.3f) stats(N r2_a);
#delimit cr;
