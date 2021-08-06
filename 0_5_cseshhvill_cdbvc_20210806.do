* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Commune Data Base of Cambodia

*MERGING FOR 2014 HH, VILLAGE CSES, AND CDB VILLAGE AND COMMUNE
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "merged_2014hha_villCDB.dta", clear
gen comm_id=substr(village_id, 1,6)  // keeping the first digits of the unique_id
merge m:m comm_id using "mergedCDB_2014com.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2014hha_villCDBcom.dta", replace

*MERGING FOR 2015 HH, VILLAGE CSES, AND CDB VILLAGE AND COMMUNE
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "merged_2015hha_villCDB.dta", clear

gen comm_id=substr(village_id, 1,6)  // keeping the first digits of the unique_id
merge m:m comm_id using "mergedCDB_2015com.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2015hha_villCDBcom.dta", replace

*MERGING FOR 2016 HH, VILLAGE CSES, AND CDB VILLAGE AND COMMUNE
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "merged_2016hha_villCDB.dta", clear

gen comm_id=substr(village_id, 1,6)  // keeping the first digits of the unique_id
merge m:m comm_id using "mergedCDB_2016com.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2016hha_villCDBcom.dta", replace

*MERGING FOR 2017 HH, VILLAGE CSES, AND CDB VILLAGE AND COMMUNE
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "merged_2017hha_villCDB.dta", clear

gen comm_id=substr(village_id, 1,6)  // keeping the first digits of the unique_id
merge m:m comm_id using "mergedCDB_2017com.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2017hha_villCDBcom.dta", replace


**** APPENDING FOR EACH YEAR FROM 2014 TO 2017


cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
log close _all
log using "log files\merging_all", text replace

use "merged_2014hha_villCDBcom.dta", clear
foreach num of numlist 2015/2017 {
append using "merged_`num'hha_villCDBcom", force
}

save "merged_2014_17.dta", replace

**** APPENDING FOR EACH YEAR FROM 2016 TO 2017

/*
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
log close _all
log using "log files\merging_2016_17", text replace

use "merged_2016hha_villCDBcom.dta", clear
append using "merged_2017hha_villCDBcom", force

save "merged_2016_17.dta", replace
*/
