* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey village level

* MERGING for 2013
/*
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2013" 
log close _all
log using "log files\merging_2013v", text replace
use "vcses2013_(1).dta", clear  // we take household food consumption as the master data
foreach num of numlist 2/14 {
merge m:m vid using "vcses2013_(`num').dta", generate(merge`num')
}
drop merge*
save "merged_2013villa.dta", replace
*/

* MERGING for 2014
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2014" 
log close _all
log using "log files\merging_2014v", text replace
use "vcses2014_(1).dta", clear  // we take household food consumption as the master data
foreach num of numlist 2/14 {
merge m:m vid using "vcses2014_(`num').dta", generate(merge`num')
}
drop merge*
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2014" 
save "merged_2014villa.dta", replace

* MERGING for 2015
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2015" 
log close _all
log using "log files\merging_2015v", text replace
use "vcses2015_(1).dta", clear  // we take household food consumption as the master data
foreach num of numlist 2/14 {
merge m:m vid using "vcses2015_(`num').dta", generate(merge`num')
}
drop merge*
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2015" 
save "merged_2015villa.dta", replace

* MERGING for 2016
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2016" 
log close _all
log using "log files\merging_2016v", text replace
use "vcses2016_(1).dta", clear  // we take household food consumption as the master data
foreach num of numlist 2/5 {
merge m:m vid using "vcses2016_(`num').dta", generate(merge`num')
}
drop merge*
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2016" 
save "merged_2016villa.dta", replace

* MERGING for 2017
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2017" 
log close _all
log using "log files\merging_2017v", text replace
use "vcses2017_(1).dta", clear  // we take household food consumption as the master data
foreach num of numlist 2/5 {
merge m:m vid using "vcses2017_(`num').dta", generate(merge`num')
}
drop merge*
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2017" 
save "merged_2017villa.dta", replace



******************************









