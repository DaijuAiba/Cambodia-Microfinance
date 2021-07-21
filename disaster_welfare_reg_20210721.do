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


#delimit;
local vlist fam_flood fam_drought fam_storm;
local depv income_month food_cons nonfood_exp total_borrowed 
income_month_n food_cons_n nonfood_exp_n total_borrowed_n
any_debt f_ins2 ln_income_month ln_food_cons 
ln_nonfood_exp ln_total_borrowed; 
local covars pop land_size dist_f_new exist_formal 
asset2_more income_agri;

foreach y in `depv' {;
qui reg `y' `vlist' i.year i.village_id1 `covars', cluster(village_id1);
estimates store `y';
local output `output' `y';
};
estimates table `output', keep(`vlist' `covars') b(%9.3f) se(%9.3f) stats(N r2_a);
#delimit cr;
