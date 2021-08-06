* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta


******************************
***********************
** DESCRIPTIVE STATISTICS USING POOLED DATA
**************************

*continued from the do-file "cseshhvill_cdbvc_20210719".

/*
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
log close _all
log using "log files\desc_panel", text replace
use "merged_2014_17.dta", clear
*/

* FINANCIAL OUTCOME

codebook q06_c06
tab q06_c06,m
tab q06_c06,m nolabel
gen total_borrowed=q06_c06 if q06_c06~=.
tab total_borrowed,m
gen total_borrowed_n=q06_c06 if q06_c06~=.
replace total_borrowed_n=0 if q06_c06==.
tab total_borrowed_n,m

codebook q06_c07
tab q06_c07,m
tab q06_c07,m nolabel
gen outstand_loan=q06_c07 if q06_c07~=.
tab outstand_loan

codebook q06_q1
gen any_debt=(q06_q1==1) if q06_q1!=.
sum any_debt

codebook q15_c20
gen income_month=q15_c20 if q15_c20!=.
tab income_month,m
gen income_month_n=q15_c20 if q15_c20!=.
replace income_month_n=0 if q15_c20==.
tab income_month_n,m
gen income_month_tho=income_month/1000

codebook q06_c08 
tab q06_c08,m
tab q06_c08,m nolabel
gen interest_monthly=q06_c08 if q06_c08 <=40 & q06_c08 !=.
sum interest_monthly
*********************

**** FAMILY AFFECTED BY DISASTER

codebook v1
tab v1,m
gen tot_fam=v1 if v1!=.

codebook v2
tab v2,m
gen fem_tot=v2 if v2!=.

codebook v3
tab v3,m
gen mal_tot=v3 if v3!=.

gen fam_poll=v320 if v320!=.
gen fam_storm=v1317 if v1317!=.
gen fam_flood=v1319 if v1319!=.
gen fam_drought=v1321 if v1321!=.
gen fam_fire=v1323 if v1323!=.

gen pers_storm=v1318 if v1318!=.
gen pers_flood=v1320 if v1320!=.
gen pers_drought=v1322 if v1322!=.
gen pers_fire=v1324 if v1324!=.

gen poll_depth=fam_poll/tot_fam
gen storm_depth=fam_storm/tot_fam
gen flood_depth=fam_flood/tot_fam
gen drought_depth=fam_drought/tot_fam
gen fire_depth=fam_fire/tot_fam

*** FOOD AND NON FOOD EXPENDITURE
codebook q01bc05
gen food_cons=q01bc05 if q01bc05!=.
sum food_cons
gen food_cons_n=q01bc05 if q01bc05!=.
replace food_cons_n=0 if q01bc05==.

codebook q01cc06
gen nonfood_exp=q01cc06 if q01cc06!=.
sum nonfood_exp
gen nonfood_exp_n=q01cc06 if q01cc06!=.
replace nonfood_exp_n=0 if q01cc06==.


*** Loan from Formal Institutions
codebook q06_c04
tab q06_c04,m
tab q06_c04,m nolabel
gen loan_source=q06_c04 if q06_c04!=.
gen f_ins1=(loan_source==8 | loan_source==11)   // bank and mfi
gen f_ins2=(loan_source==8 | loan_source==9  | loan_source==11)    // bank, ngo, and mfi
gen inf_ins1=(loan_source>=1 & loan_source<=7)   // including relatives
gen inf_ins2=(loan_source>=3 & loan_source<=7) 
gen mfi_ngo=(loan_source==9 | loan_source==11)
gen money_lender=(loan_source==4)

** Borrowing purpose

codebook q06_c05  
tab q06_c05,m
tab q06_c05,m nolabel
gen borrow_purpose=q06_c05 if q06_c05<=10 & q06_c05!=.
tab borrow_purpose


gen productive=(borrow_purpose==1 | borrow_purpose==2) if borrow_purpose!=.
gen cons_cashf=(borrow_purpose>=3 & borrow_purpose<=8) if borrow_purpose!=.
gen refinance=(borrow_purpose==9) if borrow_purpose!=.
gen other_p=(borrow_purpose==10) if borrow_purpose!=.
global p_borr "productive cons_cashf refinance other_p"
sum $p_borr

**** OTHER COVARIATES
******************************
******************************

* Borrowers characteristics

codebook q05ac02
tab q05ac02,m
gen land_size=q05ac02 if q05ac02!=.
gen log_land_size=log(land_size)

codebook q05ac13a  // what kind of paper/land certificate do you have? 
tab q05ac13a,m
gen title_gov=(q05ac13a==3) if q05ac13a!=.
tab title_gov
gen title_local=(q05ac13a==4) if q05ac13a!=.
tab title_local

* village/commune characteristics

codebook s1q2_personsinvillage
gen pop=s1q2_personsinvillage if s1q2_personsinvillage!=.
gen log_pop=log(pop)

codebook q15_r23
tab q15_r23,m nolabel
gen exist_formal=(q15_r23==1) if q15_r23!=.
tab exist_formal

codebook q15_r24
tab q15_r24,m  
gen distance_formal=q15_r24 if q15_r24!=.
tab distance_formal


* Number of banks and microfinance institutions at commune level
codebook v2004
tab v2004,m
gen no_mfi_c=v2004 if v2004!=.
gen no_banks_c=v2005 if v2005!=.

codebook q06_c02
tab q06_c02,m
tab q06_c02,m nolabel
gen debt_age= q06_c02 if q06_c02!=. //in months

* Year of grant
gen monthly = ym(year,surveymonth)
format monthly %tm
gen month_grant=monthly-debt_age
format month_grant %tm

gen year_g=2001 if month_grant==tm(2001m11)
replace year_g=2007 if month_grant==tm(2007m3)
replace year_g=2008 if month_grant>=tm(2008m2) & month_grant<=tm(2008m9)
replace year_g=2009 if month_grant>=tm(2009m2) & month_grant<=tm(2009m11)
replace year_g=2010 if month_grant>=tm(2010m1) & month_grant<=tm(2010m11)
replace year_g=2011 if month_grant>=tm(2011m1) & month_grant<=tm(2011m12)
replace year_g=2012 if month_grant>=tm(2012m1) & month_grant<=tm(2012m12)
replace year_g=2013 if month_grant>=tm(2013m1) & month_grant<=tm(2013m12)
replace year_g=2014 if month_grant>=tm(2014m1) & month_grant<=tm(2014m12)
replace year_g=2015 if month_grant>=tm(2015m1) & month_grant<=tm(2015m12)
replace year_g=2016 if month_grant>=tm(2016m1) & month_grant<=tm(2016m12)
replace year_g=2017 if month_grant>=tm(2017m1) & month_grant<=tm(2017m12)

tab year_g,m

* Maturity
codebook q06_c03
tab q06_c03,m
gen months_debtP=q06_c03 if q06_c03~=.
gen maturity=debt_age+months_debtP
gen ln_maturity=ln(maturity)

* Inverse of borrowing
gen borrow_inverse=1/total_borrowed

* Land use as collateral

codebook q05ac20
tab q05ac20,m
gen land_coll=(q05ac20==1) if q05ac20!=.

* Infrastructure
codebook v2056 // number of lines of road in the commune
tab v2056,m
gen road_lines=v2056 if v2056!=. 

codebook v2057 // total length of road in the commune
tab v2057,m
gen road_length=v2057 if v2057!=. 

codebook v2007 // total land area of commune
tab v2007,m
gen land_areaC=v2007 if v2007!=. 

codebook v2008 // area of residential land
tab v2008,m
gen resid_areaC=v2008 if v2008!=. 

codebook v2009 // area of rice land in the commune
tab v2009,m
gen rice_areaC=v2009 if v2009!=. 

codebook v2011 // area of short-term crop land
tab v2011,m
gen shortC_areaC=v2011 if v2011!=. 

codebook v2012 // area of long-term crop land
tab v2012,m
gen longC_areaC=v2012 if v2012!=. 

* Type of income source // kind of economic activity
* example; agriculture, manufacturing, construction, hotel/restaurant, trade...
codebook q15_c13b   // International code for agriculture is 01
tab q15_c13b
destring q15_c13b, gen(desq15_c13b)
gen income_agri=(desq15_c13b<210) if desq15_c13b!=.
tab income_agri


* Asset indicators 
*[durable goods include home electronics, furniture, computer and printer]
codebook q09_c03 // product code
codebook q09_c04  //total number of durable good
tab q09_c04,m
gen asset2_more=(q09_c04>=2) 
gen tv=(q09_c03==802)
gen motorcycle=(q09_c03==804)
gen cell_phone=(q09_c03==818)
gen ac_fan=(q09_c03==811 | q09_c03==812)
gen radio=(q09_c03==801)
gen pc=(q09_c03==825)
gen refrigerator=(q09_c03==810)


* Land ownership
codebook q05ac03
bys year: sum q05ac03 // own, rent land or have it in some other way
gen own_land=(q05ac03==1) if q05ac03!=.

gen dist_f_new=distance_formal
replace dist_f_new=0 if exist_formal==1
tab dist_f_new

* NEW VARIABLES
codebook s2q10b_toroad 
tab s2q10b_toroad,m  // most of them are missing
gen dist_road=s2q10b_toroad if s2q10b_toroad!=.


codebook s2q2_totirriagriland
tab s2q2_totirriagriland
gen irr_land=s2q2_totirriagriland if s2q2_totirriagriland!=.


codebook q01ac03
tab q01ac03,m
gen female=(q01ac03==2) 
 
codebook q01ac06 
tab q01ac06,m
tab q01ac06,m nolabel
gen head=(q01ac06==1) 
gen spouse=(q01ac06==2) 
gen son_daughter=(q01ac06==3) 
gen parent=(q01ac06==6) 
gen sibling=(q01ac06==7)
gen other_relation=(q01ac06==4 | q01ac06==5 | q01ac06>=8) 

sum female head spouse son_daughter parent sibling other_relation

gen head_female=(female==1 & head==1)
tab head_female

* Education for the head of household
gen primary_hh=(q02c08<7 & head==1) 
gen secondaryAB_hh=(q02c08>=7 & head==1) 
gen diploma_certAB_hh=(q02c08>=13 & head==1) 
gen degree_aboveAB_hh=(q02c08>=18 & head==1) 

***** DEPENDENT VARIABLE [Y]
****[1] Economic hardship indicators
/* Last seven days strategies for one or more days 
related to consumption of food
*/

codebook q01dq2a  
tab q01dq2a,m nolabel
gen cheap_food=(q01dq2a>=1) 
codebook q01dq2b
tab q01dq2b,m nolabel
gen borrow_food=(q01dq2b>=1) 
codebook q01dq2c // number of meals per day
tab q01dq2c,m nolabel
gen reduce_mealN=(q01dq2c>=1) 
codebook q01dq2d
tab q01dq2d,m nolabel
gen reduce_mealS=(q01dq2d>=1) 
codebook q01dq2e // meal quantity by adults/mothers for young children
tab q01dq2e,m nolabel
gen reduce_mealQ_M=(q01dq2e>=1) 

* Past 30 days
gen ever_noFood=(q01dq3==1) 

* ID poor card posession
codebook q01dq7a
gen equity_card=(q01dq7a==2) 
codebook q01dq7b
gen priority_card=(q01dq7b==2) 
codebook q01dq7c
gen other_card=(q01dq7c==2)
gen any_poorCard=(q01dq7a==2 | q01dq7b==2 | q01dq7c==2) 

gen ever_attended=(q02c04==1) 
gen years_attended=q02c05 

gen ever_attendedH=(ever_attended==1 & head==1)
gen years_attendedH=ever_attended if head==1

codebook q15_c13b   // International code for agriculture is 01
tab q15_c13b
*destring q15_c13b, gen(desq15_c13b)
gen agri_work=(desq15_c13b<210) 
tab agri_work

codebook q15_c08
tab q15_c08,m
gen own_account=(q15_c08==3)

codebook q05ac02
tab q05ac02,m
gen plot_size=q05ac02 if q05ac02!=.
replace plot_size=0 if q05ac02==.

codebook s1q5_totlandarea
tab s1q5_totlandarea
gen land_areaV=s1q5_totlandarea if s1q5_totlandarea!=.
codebook hhsize
gen hh_size=hhsize if hhsize!=.

gen hh_sizeN=q01ac01 if q01ac01!=. // q01ac01 is id number for the hh members


tab s2q1_totagriland,m
gen agri_land=s2q1_totagriland if s2q1_totagriland!=.
replace agri_land=0 if s2q1_totagriland==.



* health indicator
gen health_subsidy=(q13aq1==1) if q13aq1!=.

gen district_id=province_code+district_code
gen province_id=province_code 


******** CONSTRUCTING FIXED EFFECTS
/*
* Village fixed effect
tabulate village_id, gen(vill)
sum vill*

* Commune fixed effect
tabulate comm_id, gen(comm)
sum comm*

*District fixed effect
tabulate district_id, gen(dist)
sum dist* 

* Province fixed effect
tabulate province_id, gen(pro)
sum pro*


* year of grant fixed effect
tabulate year, gen(yr)
sum yr*

* year of grant fixed effect
tabulate year_g, gen(yr_g)
sum yr_g*

*/
*************
* Transforming to logarith form

gen ln_income_month=ln(income_month)
replace ln_income_month=0 if ln_income_month==.
gen ln_food_cons=ln(food_cons)
replace ln_food_cons=0 if ln_food_cons==.
gen ln_nonfood_exp=ln(nonfood_exp)
replace ln_nonfood_exp=0 if ln_nonfood_exp==.
gen ln_total_borrowed=ln(total_borrowed)
replace ln_total_borrowed=0 if ln_total_borrowed==.

gen borr_inc=total_borrowed/income_month
gen ln_borr_inc=ln(borr_inc)

***************************
***************************
***************************
* NOTE:
distinct hhid // Number of households = 11373
distinct village_id  // Number of villages   = 1473
distinct comm_id // Number of communes = 968
distinct district_id // Number of districts  = 184
distinct province_id // Number of provinces  = 24

br hhid village_id comm_id district_id province_id
#delimit;
keep fam_storm fam_flood fam_drought storm_depth
flood_depth drought_depth income_month food_cons nonfood_exp 
total_borrowed income_month_n food_cons_n nonfood_exp_n
total_borrowed_n ln_income_month ln_food_cons ln_nonfood_exp
ln_total_borrowed any_debt f_ins2 
inf_ins1 inf_ins2 pop log_pop land_size log_land_size productive cons_cashf 
refinance other_p borrow_purpose exist_formal distance_formal
mfi_ngo title_gov title_local no_mfi_c no_banks_c debt_age
maturity ln_maturity borrow_inverse land_coll road_lines 
road_length land_areaC resid_areaC rice_areaC shortC_areaC
longC_areaC income_agri asset2_more own_land interest_monthly
money_lender dist_f_new pers_storm pers_flood pers_drought
tv motorcycle cell_phone ac_fan radio pc refrigerator 
primary_hh secondaryAB_hh diploma_certAB_hh 
degree_aboveAB_hh ever_attendedH years_attendedH agri_work own_land plot_size land_areaV hh_size hh_sizeN dist_road irr_land agri_land health_subsidy
 female head head_female cheap_food borrow_food reduce_mealN reduce_mealS reduce_mealQ_M ever_noFood equity_card priority_card other_card any_poorCard
 year year_g 
hhid village_id comm_id district_id province_id;
#delimit cr

save "pooled_20210719.dta", replace



