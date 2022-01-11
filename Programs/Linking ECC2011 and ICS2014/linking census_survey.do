
clear all
clear mata
set emptycells drop 
*cd "G:\My Drive\cma_nix\Economic Survey\ec2011" 
cd "G:\My Drive\cma_nix\Economic Survey" 
use "MatrixData_V13.dta", clear

/* Defining Variables */
* Area Information
tab Q1_1,m
rename Q1_1 province
tab Q1_2,m
rename Q1_2 district
tab Q1_3,m
rename Q1_3 commune
tab Q1_4,m
rename Q1_4 village
tab Q1_5,m
rename Q1_5 enum_area

* Estabilishment
tab Q2_1
tab Q2_1,m
gen est_SN=Q2_1

* Generating unique id
gen province1=province
tostring province, replace
replace province="0"+province if province1<10

gen district1=district
tostring district, replace
replace district="0"+district if district1<10

gen commune1=commune
tostring commune, replace
replace commune="0"+commune if commune1<10

gen village1=village
tostring village, replace
replace village="0"+village if village1<10

gen est_SN1=est_SN
tostring est_SN, replace
replace est_SN="0"+est_SN if est_SN1>=100 & est_SN1<1000
replace est_SN="00"+est_SN if est_SN1>=10 & est_SN1<100
replace est_SN="000"+est_SN if est_SN1<10

gen id=province+district+commune+village+enum_area+est_SN
gen survey_area2011=province+district+commune+village+enum_area


* Owner of firm/establishment

tab Q3_1,m
gen gender_owner2011=Q3_1
gen female_owner2011=(Q3_1==2)
tab Q3_2,m
gen cambodian_owner2011=(Q3_2==1)
gen nationality_owner2011=Q3_2
* Registration status
tab Q4_1,m
gen registration_status2011=Q4_1
gen registered2011=(Q4_1==1)

* Ownership of establishment [legal status]
tab Q5,m  /* ownership_est*/
gen ownership_type2011=Q5
gen indProp_noReg2011=(Q5==1)

* Office type
* Single unit, Head or Branch Office
tab Q6,m
gen office_type2011=Q6
gen single_unit2011=(Q6==1)

* Tenure, kind and area of business place
rename Q7_1 tenure_business2011
rename Q7_2 kind_business2011
rename Q7_3 area_business2011

* Year of starting the business
tab Q9,m
gen year_start2011=Q9 if Q9<2021


* Number of persons engaged 
rename Q10_A_1 total_persons2011            /* Cambodian plus foreigner  */
rename Q10_A_2 cambodian_persons2011
rename Q10_A_3 foreigner_persons2011
rename Q10_A_4 male_persons2011
rename Q10_A_5 female_persons2011

rename Q10_A1_1 selfEmployed_total2011     /* Cambodian plus foreigner  */
rename Q10_A2_1 unpaid_total2011           /* Cambodian plus foreigner  */
rename Q10_A3_1 regularEmployees_total2011 /* Cambodian plus foreigner  */
rename Q10_A4_1 non_regularEmployees_total2011 /* Cambodian plus foreigner  */
rename Q10_B_1 voluntary_total2011 /* Cambodian plus foreigner  */


/* Sales and expenses   */
rename Q16_1M sales_monthly2011
rename Q16_1D sales_daily2011
rename Q16_2M expenses_monthly2011
rename Q16_2D expenses_daily2011


keep id survey_area2011 year_start2011 gender_owner2011 nationality_owner2011 registration_status2011 ownership_type2011 office_type2011 tenure_business2011 kind_business2011 area_business2011 total_persons2011 cambodian_persons2011 foreigner_persons2011 male_persons2011 female_persons2011 selfEmployed_total2011 unpaid_total2011 regularEmployees_total2011 non_regularEmployees_total2011 voluntary_total2011 registered2011 sales_monthly2011 sales_daily2011 expenses_monthly2011 expenses_daily2011

gen year2011=2011
gen fileid2011=0  /* I gave 0 for 2011 and 1 for 2014 for the matching purpose  */
cd "G:\My Drive\cma_nix\Economic Survey"
save ecc_2011_f, replace

***************************************************************

clear all
cd "G:\My Drive\cma_nix\Economic Survey\ec2014" 
use "ec2014_1.dta", clear

/* Defining Variables */
* Area Information
tab q1_1,m
rename q1_1 province
tab q1_2,m
rename q1_2 district
tab q1_3,m
rename q1_3 commune
tab q1_4,m
rename q1_4 village
tab q1_5,m
rename q1_5 enum_area

* Estabilishment
tab q2_1
tab q2_1,m
gen est_SN=q2_1

* Generating unique id
gen province1=province
tostring province, replace
replace province="0"+province if province1<10

gen district1=district
tostring district, replace
replace district="0"+district if district1<10

gen commune1=commune
tostring commune, replace
replace commune="0"+commune if commune1<10

gen village1=village
tostring village, replace
replace village="0"+village if village1<10

gen est_SN1=est_SN
tostring est_SN, replace
replace est_SN="0"+est_SN if est_SN1>=100 & est_SN1<1000
replace est_SN="00"+est_SN if est_SN1>=10 & est_SN1<100
replace est_SN="000"+est_SN if est_SN1<10

gen id=province+district+commune+village+enum_area+est_SN
gen survey_area2014=province+district+commune+village+enum_area



* Owner of firm/establishment

tab q3_1,m
gen gender_representative2014=q3_1
gen female_representative2014=(q3_1==2)

tab q3_2,m
gen gender_owner2014=q3_2
gen female_owner2014=(q3_2==2)

tab q3_3,m
gen nationality_owner2014=q3_3
gen cambodian_owner2014=(q3_3==1)

* Registration status
tab q4_1,m
gen registration_status2014=q4_1
gen registered2014=(q4_1==1)

* Ownership of establishment
tab q5,m  /* ownership_est*/
gen ownership_type2014=q5
gen indProp_noReg2014=(q5==1)

 
* Year of starting the business
tab q7,m
gen year_start2014=q7 if q7<2021

* Tenure, kind and area of business place
rename q8_1 tenure_business2014
rename q8_2 kind_business2014
rename q8_3 area_business2014


* Number of persons engaged 
rename q9_a_1 total_persons2014           /* Cambodian plus foreigner  */
rename q9_a_2 cambodian_persons2014
rename q9_a_3 foreigner_persons2014
rename q9_a_4 male_persons2014
rename q9_a_5 female_persons2014

rename q9_a1_1 selfEmployed_total2014     /* Cambodian plus foreigner  */
rename q9_a2_1 unpaid_total2014           /* Cambodian plus foreigner  */
rename q9_a3_1 regularEmployees_total2014 /* Cambodian plus foreigner  */
rename q9_a4_1 non_regularEmployees_total2014 /* Cambodian plus foreigner  */
rename q9_b_1 voluntary_total2014 /* Cambodian plus foreigner  */

* Office type
* Single unit, Head or Branch Office
tab q11,m
rename q11 office_type2014
gen single_unit2014=(office_type2014==1)


/* Sales and expenses   */

rename q16_1m sales_monthly2014
destring sales_monthly2014, replace

rename q16_1d sales_daily2014
destring sales_daily2014, replace

rename q16_2m expenses_monthly2014
destring expenses_monthly2014, replace

rename q16_2d expenses_daily2014
destring expenses_daily2014, replace


keep id survey_area2014 year_start2014 gender_owner2014 nationality_owner2014 registration_status2014 ownership_type2014 office_type2014 tenure_business2014 kind_business2014 area_business2014 total_persons2014 cambodian_persons2014 foreigner_persons2014 male_persons2014 female_persons2014 selfEmployed_total2014 unpaid_total2014 regularEmployees_total2014 non_regularEmployees_total2014 voluntary_total2014 registered2014 sales_monthly2014 sales_daily2014 expenses_monthly2014 expenses_daily2014

gen year2014=2014
gen fileid2014=1

cd "G:\My Drive\cma_nix\Economic Survey"
save ies_2014_f, replace

***********************************************
use ecc_2011_f, clear
merge 1:1 id using "ies_2014_f", generate(merge)

reshape long year_start survey_area fileid gender_owner nationality_owner registration_status ownership_type office_type tenure_business kind_business area_business total_persons cambodian_persons foreigner_persons male_persons female_persons selfEmployed_total unpaid_total regularEmployees_total non_regularEmployees_total voluntary_total registered sales_monthly sales_daily expenses_monthly expenses_daily, i(id) j(year)

drop if merge!=3
drop merge
br
destring id, ignore("B, G, M, S") replace
list id year registered if id==10201120010002 | id==10201120010004, sepby(id)

*isid id year
*bysort id year: assert _N == 1 
duplicates report id year
duplicates list id year
duplicates tag id year, gen(isdup) 
edit if isdup
drop if isdup==1 /* only 10 obs. */
drop isdup

xtset id year, yearly
br id year
distinct id year /*  4697 distinct ids and 2 years */

save "mergedBYid.dta", replace



