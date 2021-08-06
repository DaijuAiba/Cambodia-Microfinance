* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey

*MERGING FOR 2013 HH AND VILLAGE CSES

/*
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2013"
use "merged_2013hha.dta", clear
gen svid=real(substr(hhid,1,5))
gen vid=string(svid)
replace vid="0"+vid if svid<10000
drop svid
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\VCSES\VCSES2013"
merge m:m vid using "merged_2013villa.dta", generate(merge)
drop if merge!=3
drop merge
cd "T:\340_研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
save "merged_2013hha_vill.dta", replace
*/

*MERGING FOR 2014 HH AND VILLAGE CSES

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2014" 
use "merged_2014hha.dta", clear
/*
gen svid=real(substr(hhid,1,5))
gen vid=string(svid)
replace vid="0"+vid if svid<10000
drop svid
*/

gen vid=psu
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2014" 
merge m:m vid using "merged_2014villa.dta", generate(merge)
drop if merge!=3
drop merge
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
save "merged_2014hha_vill.dta", replace

*MERGING FOR 2015 HH AND VILLAGE CSES

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2015" 
use "merged_2015hha.dta", clear
/*
gen svid=real(substr(hhid,1,5))
gen vid=string(svid)
replace vid="0"+vid if svid<10000
drop svid
*/
gen vid=psu
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2015" 
merge m:m vid using "merged_2015villa.dta", generate(merge)
drop if merge!=3
drop merge
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
save "merged_2015hha_vill.dta", replace


*MERGING FOR 2016 HH AND VILLAGE CSES

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2016" 
use "merged_2016hha.dta", clear
/*
gen svid=real(substr(hhid,1,5))
gen vid=string(svid)
replace vid="0"+vid if svid<10000
drop svid
*/
gen vid=psu
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2016" 
merge m:m vid using "merged_2016villa.dta", generate(merge)
drop if merge!=3
drop merge
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
save "merged_2016hha_vill.dta", replace

*MERGING FOR 2017 HH AND VILLAGE CSES

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2017" 
use "merged_2017hha.dta", clear
/*
gen svid=real(substr(hhid,1,5))
gen vid=string(svid)
replace vid="0"+vid if svid<10000
drop svid
*/
gen vid=psu
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4\CSES\CSES2017" 
merge m:m vid using "merged_2017villa.dta", generate(merge)
drop merge
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4"
save "merged_2017hha_vill.dta", replace


