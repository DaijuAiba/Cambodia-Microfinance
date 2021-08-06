* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey


* MERGING for 2014
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2014" 
log close _all
log using "log files\merging_2014", text replace

/*
use "cses2014_(29).dta", clear
gen st_urbrur=string(urbrur)
drop urbrur
rename st_urbrur urbrur
gen st_stratum=string(stratum)
drop stratum
rename st_stratum stratum
gen st_HW14A=string(HW14A)
drop HW14A
rename st_HW14A HW14A
save "cses2014_(29).dta", replace
clear all
*/

* Detecting duplicates 
foreach num of numlist 1/17 {
use "cses2014_(`num').dta",clear
duplicates report hhid
bysort hhid: gen copies1=_N
tab copies1
duplicates drop
clear all
}

use "cses2014_(1).dta", clear  // we take household food condumption as the master dat
foreach num of numlist 2/17 {
merge m:m hhid using "cses2014_(`num').dta", force generate(merge`num')
}
drop merge*


#delimit;
rename (Q01BC05 Q07_C03 Q07_C04 Q07_C05 Q05AC01 Q05AC02 
Q05AC03 Q05AC04A Q05AC04B Q05AC04C Q05AC05A Q05AC05B 
Q05AC05C Q05AC06A Q05AC06B Q05AC06C Q05AC07 Q05AC08 
Q05AC09 Q05AC10 Q05AC12  Q05AC13A Q05AC13B Q05AC14 Q05AC15
Q05AC16A Q05AC16B Q05AC16C Q05AC17 Q05AC20
Q06_C01 Q06_C02 Q06_C03 Q06_C04 Q06_C05 Q06_C06 Q06_C07 
Q06_C08 Q09_C03 Q09_C04
Q01AC01 Q01AC03 Q01AC04A Q01AC04B Q01AC04C Q01AC05A Q01AC05B
Q01AC06 Q01AC07 Q01AC08 Q01AC09 Q01AC10 Q01AC11A Q01AC11B
Q01AC12A Q01AC12B Q01AC12C Q01AC13 Q01AC14  
Q01BQ1 Q05AQ1A Q05AQ1B Q05AQ2 Q05AQ3 Q05BQ1 Q05DQ1 Q05EQ1 
Q05FQ1 Q05FQ2 Q05FQ3 Q05GQ1 Q05GQ2 Q05HQ1 Q06_Q1 Q08_Q1 
PastYear WetDry Q01CC01 Q01CC04 Q01CC05 Q01CC06 Q15_C03 
Q15_C04 Q15_C13B Q15_C20 
Q04_01 Q02C04 Q02C05 Q02C06 Q01DQ1A Q01DQ1B Q01DQ1C 
Q01DQ1D Q01DQ1E Q01DQ2A Q01DQ2B Q01DQ2C Q01DQ2D Q01DQ2E
Q01DQ2F Q01DQ2G Q01DQ2H Q01DQ2I Q01DQ2J Q01DQ3 Q01DQ3A
Q01DQ4 Q01DQ4A Q01DQ5 Q01DQ5A Q01DQ6A Q01DQ6B Q01DQ6C
Q01DQ7 Q15_C08)

(q01bc05 q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 
q05ac03 q05ac04a q05ac04b q05ac04c q05ac05a q05ac05b 
q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08 
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15
q05ac16a q05ac16b q05ac16c q05ac17 q05ac20
q06_c01 q06_c02 q06_c03 q06_c04 q06_c05 q06_c06 q06_c07 
q06_c08 q09_c03 q09_c04 
q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c q01ac05a q01ac05b 
q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q01ac11a q01ac11b 
q01ac12a q01ac12b q01ac12c q01ac13 q01ac14 
q01bq1 q05aq1a q05aq1b q05aq2 q05aq3 q05bq1 q05dq1 q05eq1 
q05fq1 q05fq2 q05fq3 q05gq1 q05gq2 q05hq1 q06_q1 q08_q1 
pastyear wetdry q01cc01 q01cc04 q01cc05 q01cc06 q15_c03
q15_c04 q15_c13b q15_c20
q04_01 q02c04 q02c05 q02c06 q01dq1a q01dq1b q01dq1c 
q01dq1d q01dq1e q01dq2a q01dq2b q01dq2c q01dq2d q01dq2e
q01dq2f q01dq2g q01dq2h q01dq2i q01dq2j q01dq3 q01dq3a
q01dq4 q01dq4a q01dq5 q01dq5a q01dq6a q01dq6b q01dq6c
q01dq7 q15_c08), replace; 
#delimit cr


* Q05E1C01 Q05E1C03 Q05E1C04 Q05E1C05 Q05E1C06 Q05E2C01 Q05E2C03  
*q05e1c01 q05e1c03 q05e1c04 q05e1c05 q05e1c06 q05e2c01 q05e2c03


#delimit;
keep q01bc05 q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 
q05ac03 q05ac04a q05ac04b q05ac04c q05ac05a q05ac05b 
q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08 
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15
q05ac16a q05ac16b q05ac16c q05ac17 q05ac20
q06_c01 q06_c02 q06_c03 q06_c04 q06_c05 q06_c06 q06_c07 
q06_c08  q09_c03 q09_c04
q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c q01ac05a q01ac05b 
q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q01ac11a q01ac11b 
q01ac12a q01ac12b q01ac12c q01ac13 q01ac14 
q01bq1 q05aq1a q05aq1b q05aq2 q05aq3 q05bq1 q05dq1 q05eq1 
q05fq1 q05fq2 q05fq3 q05gq1 q05gq2 q05hq1 q06_q1 q08_q1 
pastyear wetdry q01cc01 q01cc04 q01cc05 q01cc06 q15_c03
q15_c04 q15_c13b q15_c20 psu hhid urbrur stratum

q04_01 q02c04 q02c05 q02c06 q01dq1a q01dq1b q01dq1c 
q01dq1d q01dq1e q01dq2a q01dq2b q01dq2c q01dq2d q01dq2e
q01dq2f q01dq2g q01dq2h q01dq2i q01dq2j q01dq3 q01dq3a
q01dq4 q01dq4a q01dq5 q01dq5a q01dq6a q01dq6b q01dq6c
q01dq7 q15_c08;
/*
collapse q01bc05 q05g1c06  q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06 q02c04 q02c05 
q02c06 q02c07 q02c08 q02c09 q02c10 q02c11 q02c12 q02c13 q02c14, by(hhid);
*/

gen year=2014
save "merged_2014hh.dta", replace


* MERGING for 2015

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2015" 
log close _all
log using "log files\merging_2015", text replace

/*
use "cses2015_(9).dta", clear
rename HHID hhid
save "cses2015_(9).dta", replace
use "cses2015_(12).dta", clear
rename HHID hhid
save "cses2015_(12).dta", replace
use "cses2015_(15).dta", clear
rename HHID hhid
save "cses2015_(15).dta", replace
*/

* Detecting duplicates 
foreach num of numlist 1/16 {
use "cses2015_(`num').dta",clear
duplicates report hhid
bysort hhid: gen copies1=_N
tab copies1
duplicates drop
clear all
}

use "cses2015_(1).dta", clear  // we take household food condumption as the master data

foreach num of numlist 2/16 {
merge m:m hhid using "cses2015_(`num').dta", generate(merge`num')
}
drop merge*

rename PSU psu

#delimit;
rename (Q07_C03 Q07_C04 Q07_C05 Q05AC01 Q05AC02 
Q05AC03 Q05AC04A Q05AC04B Q05AC04C Q05AC05A Q05AC05B 
Q05AC05C Q05AC06A Q05AC06B Q05AC06C Q05AC07 Q05AC08 
Q05AC09 Q05AC10 Q05AC12  Q05AC13A Q05AC13B Q05AC14 Q05AC15
Q05AC16A Q05AC16B Q05AC16C Q05AC17 Q05AC20
Q06_C01 Q06_C02 Q06_C03 Q06_C04 Q06_C05 Q06_C06 Q06_C07 
Q06_C08 Q09_C03 Q09_C04 
Q01AC01 Q01AC03 Q01AC04A Q01AC04B Q01AC04C Q01AC05A Q01AC05B
Q01AC06 Q01AC07 Q01AC08 Q01AC09 Q01AC10 Q01AC11A Q01AC11B
Q01AC12A Q01AC12B Q01AC12C Q01AC13 Q01AC14  
Q01BQ1 Q05AQ1A Q05AQ1B Q05AQ2 Q05AQ3 Q05BQ1 Q05DQ1 Q05EQ1 
Q05FQ1 Q05FQ2 Q05FQ3 Q05GQ1 Q05GQ2 Q05HQ1 Q06_Q1 Q08_Q1 
PastYear WetDry Q01CC01 Q01CC04 Q01CC05 Q01CC06 Q15_C03 
Q15_C04 Q15_C13B Q15_C20
Q04_01 Q02C04 Q02C05 Q02C06 Q01DQ2A Q01DQ2B Q01DQ2C 
Q01DQ2D Q01DQ2E Q01DQ3 Q01DQ3A Q01DQ3B Q01DQ3C Q01DQ3D 
Q01DQ3E Q01DQ3F Q01DQ3G Q01DQ3H Q01DQ3I Q01DQ3J Q01DQ4 
Q01DQ5 Q01DQ6 Q01DQ7A Q01DQ7B Q01DQ7C Q01DQ8 Q15_C08)

(q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 
q05ac03 q05ac04a q05ac04b q05ac04c q05ac05a q05ac05b 
q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08 
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15
q05ac16a q05ac16b q05ac16c q05ac17 q05ac20
q06_c01 q06_c02 q06_c03 q06_c04 q06_c05 q06_c06 q06_c07 
q06_c08 q09_c03 q09_c04  
q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c q01ac05a q01ac05b 
q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q01ac11a q01ac11b 
q01ac12a q01ac12b q01ac12c q01ac13 q01ac14 
q01bq1 q05aq1a q05aq1b q05aq2 q05aq3 q05bq1 q05dq1 q05eq1 
q05fq1 q05fq2 q05fq3 q05gq1 q05gq2 q05hq1 q06_q1 q08_q1 
pastyear wetdry q01cc01 q01cc04 q01cc05 q01cc06 q15_c03
q15_c04 q15_c13b q15_c20
q04_01 q02c04 q02c05 q02c06 q01dq2a q01dq2b q01dq2c 
q01dq2d q01dq2e q01dq3 q01dq3a q01dq3b q01dq3c q01dq3d 
q01dq3e q01dq3f q01dq3g q01dq3h q01dq3i q01dq3j q01dq4 
q01dq5 q01dq6 q01dq7a q01dq7b q01dq7c q01dq8 q15_c08), 
replace; 
#delimit cr


#delimit;
keep q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 
q05ac03 q05ac04a q05ac04b q05ac04c q05ac05a q05ac05b 
q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08 
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15
q05ac16a q05ac16b q05ac16c q05ac17 q05ac20
q06_c01 q06_c02 q06_c03 q06_c04 q06_c05 q06_c06 q06_c07 
q06_c08 q09_c03 q09_c04
q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c q01ac05a q01ac05b 
q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q01ac11a q01ac11b 
q01ac12a q01ac12b q01ac12c q01ac13 q01ac14 
q01bq1 q05aq1a q05aq1b q05aq2 q05aq3 q05bq1 q05dq1 q05eq1 
q05fq1 q05fq2 q05fq3 q05gq1 q05gq2 q05hq1 q06_q1 q08_q1 
pastyear wetdry q01cc01 q01cc04 q01cc05 q01cc06 q15_c03
q15_c04 q15_c13b q15_c20 psu hhid urbrur stratum

q04_01 q02c04 q02c05 q02c06 q01dq2a q01dq2b q01dq2c 
q01dq2d q01dq2e q01dq3 q01dq3a q01dq3b q01dq3c q01dq3d 
q01dq3e q01dq3f q01dq3g q01dq3h q01dq3i q01dq3j q01dq4 
q01dq5 q01dq6 q01dq7a q01dq7b q01dq7c q01dq8 q15_c08;

/*
collapse q05g1c06  q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06 q02c04 q02c05 
q02c06 q02c07 q02c08 q02c09 q02c10 q02c11 q02c12 q02c13 q02c14, by(hhid);
*/

gen year=2015
save "merged_2015hh.dta", replace


* MERGING for 2016

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2016" 
log close _all
log using "log files\merging_2016", text replace


use "cses2016_(1).dta", clear  // we take household food condumption as the master data

foreach num of numlist 2/16 {
merge m:m hhid using "cses2016_(`num').dta", generate(merge`num')
}
drop merge*

#delimit;
keep hhid q01bc05 q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q05ac20 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q09_c03 q09_c04 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06  
q15_c03 q15_c04 q15_c13b q15_c20 persid psu hhid

q04_01 q02c04 q02c05 q02c06 q01dq2a q01dq2b q01dq2c 
q01dq2d q01dq2e q01dq3 q01dq3a q01dq3b q01dq3c q01dq3d 
q01dq3e q01dq3f q01dq3g q01dq3h q01dq3i q01dq3j q01dq4 
q01dq5 q01dq6 q01dq7a q01dq7b q01dq7c q01dq8 q15_c08;

/*
collapse q01bc05 q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06 q02c04 q02c05 
q02c06 q02c07 q02c08 q02c09 q02c10 q02c11 q02c12 q02c13 q02c14, by(hhid);
*/

gen year=2016
save "merged_2016hh.dta", replace


* MERGING for 2017

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2017" 
log close _all
log using "log files\merging_2017", text replace
/*
use "cses2017_(27).dta", clear
gen hhid=households
gen hhidString=string(hhid)
drop hhid
rename hhidString hhid
save "cses2017_(27).dta", replace
clear all
*/


use "cses2017_(1).dta", clear  // we take household food condumption as the master data

foreach num of numlist 2/16 {
merge m:m hhid using "cses2017_(`num').dta", generate(merge`num')
}
drop merge*

#delimit;
keep hhid q01bc05 q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q05ac20 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q09_c03 q09_c04 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06
q15_c03 q15_c04 q15_c13b q15_c20 persid psu hhid
 
q04_01 q02c04 q02c05 q02c06 q01dq2a q01dq2b q01dq2c 
q01dq2d q01dq2e q01dq3 q01dq3a q01dq3b q01dq3c q01dq3d 
q01dq3e q01dq3f q01dq3g q01dq3h q01dq3i q01dq3j q01dq4 
q01dq5 q01dq6 q01dq7a q01dq7b q01dq7c q01dq8 q15_c08;

/*
collapse q01bc05   q07_c03 q07_c04 q07_c05 q05ac01 q05ac02 q05ac03 q05ac04a 
q05ac04b q05ac04c q05ac05a q05ac05b q05ac05c q05ac06a q05ac06b q05ac06c q05ac07 q05ac08
q05ac09 q05ac10 q05ac12  q05ac13a q05ac13b q05ac14 q05ac15 q05ac17 q06_c01 q06_c02 q06_c03 
q06_c04 q06_c05 q06_c06 q06_c07 q06_c08 q01ac01 q01ac03 q01ac04a q01ac04b q01ac04c 
q01ac05a q01ac05b q01ac06 q01ac07 q01ac08 q01ac09 q01ac10 q05aq1a q05aq1b q05aq2 q05aq3
q05bq1 q05dq1 q05eq1  q06_q1 q08_q1  q01cc01 q01cc04 q01cc05 q01cc06 q02c04 q02c05 
q02c06 q02c07 q02c08 q02c09 q02c10 q02c11 q02c12 q02c13 q02c14, by(hhid);
*/

gen year=2017
save "merged_2017hh.dta", replace
clear all


* MERGING WITH AREA INFORMATION
/*
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
use "area_info2013.dta", clear
gen psu_n=real(psu)
replace psu="0"+psu if psu_n<10000
drop psu_n
save "area_info2013.dta", replace
use "merged_2013hh.dta", clear
merge m:m psu using "area_info2013.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2013hha.dta", replace
*/

************ 2014 AREA*****
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2014" 
use "area_info2014.dta",clear

rename Province_Code province_code
rename Province_Name province_name
rename District_Code district_code
rename District_Name district_name
rename Commune_Code commune_code
rename Commune_Name commune_name
rename Village_Code village_code
rename Village_Name village_name
rename UrbanRural urbanrural
rename SurveyMonth surveymonth

save "area_info2014n.dta", replace
use "merged_2014hh.dta", clear
merge m:m psu using "area_info2014n.dta", generate(merge)
drop merge
save "merged_2014hha.dta", replace

************ 2015 AREA*****
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2015" 
use "area_info2015.dta", clear
rename Province_Code province_code
rename Province_Name province_name
rename District_Code district_code
rename District_Name district_name
rename Commune_Code commune_code
rename Commune_Name commune_name
rename Village_Code village_code
rename Village_Name village_name
rename UrbanRural urbanrural
rename SurveyMonth surveymonth
*rename PSU psu
save "area_info2015n.dta", replace

use "merged_2015hh.dta", clear
merge m:m psu using "area_info2015n.dta", generate(merge)
drop merge
save "merged_2015hha.dta", replace

************ 2016 AREA*****
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2016" 
use "merged_2016hh.dta", clear
merge m:m psu using "area_info2016.dta", generate(merge)
drop merge
save "merged_2016hha.dta", replace

************ 2017 AREA*****
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2017" 
use "merged_2017hh.dta", clear
merge m:m psu using "area_info2017.dta", generate(merge)
drop merge
save "merged_2017hha.dta", replace


