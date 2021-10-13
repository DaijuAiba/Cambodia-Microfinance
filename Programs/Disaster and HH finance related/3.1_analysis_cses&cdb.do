
* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey

clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance"
use "combined_cses_cdb.dta", clear

* Descriptive statistics on formal and informal
sum f_ins2 inf_ins1 any_debt
gen ratio_informal=inf_ins1/any_debt

tabstat ratio_informal, by(year) stats(me n)
bys year: egen ratio_informalM=mean(ratio_informal)
line ratio_informalM year, sort(year) ytitle("Ratio of loan from informal sector") xtitle("Year")


* Principal component analysis for asset inndicators
corr tv motorcycle cell_phone ac_fan radio pc refrigerator
pca tv motorcycle cell_phone ac_fan radio pc refrigerator
screeplot
screeplot, graphregion(color(white)) ytitle("Component") title("Eigenvalues by component") ylab(,nogrid)
loadingplot, graphregion(color(white)) title("Variable Loading to Component 1 and 2") ylab(,nogrid)
scoreplot, mlabel($id) mlabsize(1.2) msize(0.5) graphregion(color(white)) title("Observation Loading to Component 1 and 2") ylab(,nogrid)
estat kmo

predict pc1 pc2 
corr pc1 pc2 

* Social protection (health subsidy)
corr health_subsidy any_poorCard

sum health_subsidy disasterF
gen health_subsidyD=health_subsidy * disasterF
reg ln_income_total health_subsidy disasterF health_subsidyD

/* DESCRIPTIVE ANALYSIS  */
* Dependent variables

sum ln_income_total ln_income_empt ln_income_crop ln_income_livestock ln_cost_total ln_food_cons ln_nonfood_exp ln_cost_crop ln_cost_livestock ln_total_borrowed any_debt f_ins2 cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood sold_HHgoods sold_PRODassets spent_savings sold_house_land

* Independent variables
sum floodF droughtF stormF tv motorcycle cell_phone ac_fan radio pc refrigerator primary_hh secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh own_land  HHSize health_subsidy health_subsidyD sick head_female ln_road_length any_poorCard no_mfi_c no_banks_c

**************************************************
/* REGRESSIONAL analysis  */

encode district_id, gen(district_id1)
encode commune_id, gen(commune_id1)

gen dis_fins2=disasterF*f_ins2
*local vlist floodF droughtF stormF

local vlist disasterF f_ins2 dis_fins2
local depv ln_income_total ln_income_empt ln_income_crop ln_income_livestock ln_cost_total ln_food_cons ln_nonfood_exp ln_cost_crop ln_cost_livestock ln_total_borrowed any_debt cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood sold_HHgoods sold_PRODassets spent_savings sold_house_land 

local covars1 pc1 secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh own_land HHSize sick head_female ln_road_length any_poorCard no_mfi_c no_banks_c
local covars2 pc2 secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh own_land HHSize sick head_female ln_road_length any_poorCard no_mfi_c no_banks_c

foreach y in `depv' {
qui reg `y' `vlist' i.year i.district_id1 `covars1', cluster(district_id1)
estimates store `y'
local output `output' `y'
}
*estimates table `output', keep(`vlist' `covars1') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table `output', keep(`vlist' `covars1') star(.10 .05 .01) stats(N r2_a)


foreach y in `depv' {
qui reg `y' `vlist' i.year i.district_id1 `covars2', cluster(district_id1)
estimates store `y'
local output `output' `y'
}
*estimates table `output', keep(`vlist' `covars2') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table `output', keep(`vlist' `covars2') star(.10 .05 .01) stats(N r2_a)


* Land title and financial access
tabstat f_ins2 title_gov title_local, by(year) stats(me n)

foreach p in 1 0 {
tabstat f_ins2 title_gov title_local if productive_P==`p', by(year) stats(me n)
}

foreach p in 1 0 {
tabstat f_ins2 title_gov title_local if head_female==`p', by(year) stats(me n)
}


local title title_gov title_local 
local covars pc1 secondaryAB_hh own_land HHSize sick head_female ln_road_length any_poorCard no_mfi_c no_banks_c

foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & year==2014, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)


foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & year==2015, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)


foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & year==2016, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)


foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & year==2017, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)


foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & year==2019, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)

*********************************************************************
/******
SEPARATELY BY FEMALE HEADED
*******/

local title title_gov title_local 
local covars pc1 secondaryAB_hh own_land HHSize sick ln_road_length any_poorCard no_mfi_c no_banks_c

foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & head_female==1, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)

foreach p in 1 0 {
qui reg f_ins2 `title' `covars' i.district_id1 if productive_P==`p' & head_female==0, cluster(district_id1)
estimates store p1_`p'
}
*estimates table p1_1 p1_0, keep(`title' `covars') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table p1_1 p1_0, keep(`title' `covars') star(.10 .05 .01)  stats(N r2_a)

**************************************************
/* DETERMINANTS OF HH FINANCIAL CONDITION BY HH HEAD  */


local vlist disasterF f_ins2 dis_fins2
local depv ln_income_total ln_income_empt ln_income_crop ln_income_livestock ln_cost_total ln_food_cons ln_nonfood_exp ln_cost_crop ln_cost_livestock ln_total_borrowed any_debt cheap_food borrow_food reduce_mealN reduce_mealS ever_noFood sold_HHgoods sold_PRODassets spent_savings sold_house_land 

local covars1 pc1 secondaryAB_hh diploma_certAB_hh degree_aboveAB_hh own_land HHSize sick ln_road_length any_poorCard no_mfi_c no_banks_c

foreach y in `depv' {
qui reg `y' `vlist' i.year i.district_id1 `covars1' if head_female==1, cluster(district_id1)
estimates store `y'
local output1 `output1' `y'
}
*estimates table `output1', keep(`vlist' `covars1') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table `output1', keep(`vlist' `covars1') star(.10 .05 .01) stats(N r2_a)

foreach y in `depv' {
qui reg `y' `vlist' i.year i.district_id1 `covars1' if head_female==0, cluster(district_id1)
estimates store `y'
local output0 `output0' `y'
}
*estimates table `output0', keep(`vlist' `covars1') b(%9.3f) se(%9.3f) stats(N r2_a)
estimates table `output0', keep(`vlist' `covars1') star(.10 .05 .01) stats(N r2_a)


