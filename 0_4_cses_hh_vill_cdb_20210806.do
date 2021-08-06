
* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* Data Source: Cambodian Socio-economic Survey


*MERGING FOR 2014 HH AND VILLAGE CSES, AND CDB
cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "merged_2014hha_vill.dta", clear

gen p_code=.
replace p_code=1 if province_name=="Banteay Meanchey"
replace p_code=2 if province_name=="Battambang"
replace p_code=3 if province_name=="Kampong Cham"
replace p_code=4 if province_name=="Kampong Chhnang"
replace p_code=5 if province_name=="Kampong Speu"
replace p_code=6 if province_name=="Kampong Thom"
replace p_code=7 if province_name=="Kampot"
replace p_code=8 if province_name=="Kandal"
replace p_code=9 if province_name=="Koh Kong"
replace p_code=10 if province_name=="Kratie"
replace p_code=11 if province_name=="Mondul Kiri"
replace p_code=12 if province_name=="Phnom Penh"
replace p_code=13 if province_name=="Preah Vihear"
replace p_code=14 if province_name=="Prey Veng"
replace p_code=15 if province_name=="Pursat"
replace p_code=16 if province_name=="Ratanak Kiri"
replace p_code=17 if province_name=="Siemreap"
replace p_code=18 if province_name=="Preah Sihanouk"
replace p_code=19 if province_name=="Stung Treng"
replace p_code=20 if province_name=="Svay Rieng"
replace p_code=21 if province_name=="Takeo"
replace p_code=22 if province_name=="Oddar Meanchey"
replace p_code=23 if province_name=="Kep"
replace p_code=24 if province_name=="Pailin"
replace p_code=25 if province_name=="Tboung Khmum"
tab p_code,m

tostring p_code, gen(pr_code)
replace pr_code="0"+pr_code if p_code<10
gen village_id=pr_code+district_code+commune_code+village_code

replace village_id="22010304" if village_id=="22010308"
replace village_id="22010507" if village_id=="22010508"
replace village_id="22040207" if village_id=="22040206"
replace village_id="22040319" if village_id=="22040320"
replace village_id="22040503" if village_id=="22040502"
replace village_id="22050204" if village_id=="22050209"
replace village_id="22050606" if village_id=="22050607"
replace village_id="24010102" if village_id=="24010103"

* oddar meanchey 22, siemreap 17, kratie 10


merge m:m village_id using "mergedCDB_2014.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2014hha_villCDB.dta", replace


*MERGING FOR 2015 HH AND VILLAGE CSES, AND CDB

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "mergedCDB_2015.dta", clear
drop village_id
tostring villgis, gen(village_id)
replace village_id="0"+village_id if villgis<10000000
save "mergedCDB_2015.dta", replace

use "merged_2015hha_vill.dta", clear

gen p_code=.
replace p_code=1 if province_name=="Banteay Meanchey"
replace p_code=2 if province_name=="Battambang"
replace p_code=3 if province_name=="Kampong Cham"
replace p_code=4 if province_name=="Kampong Chhnang"
replace p_code=5 if province_name=="Kampong Speu"
replace p_code=6 if province_name=="Kampong Thom"
replace p_code=7 if province_name=="Kampot"
replace p_code=8 if province_name=="Kandal"
replace p_code=9 if province_name=="Koh Kong"
replace p_code=10 if province_name=="Kratie"
replace p_code=11 if province_name=="Mondul Kiri"
replace p_code=12 if province_name=="Phnom Penh"
replace p_code=13 if province_name=="Preah Vihear"
replace p_code=14 if province_name=="Prey Veng"
replace p_code=15 if province_name=="Pursat"
replace p_code=16 if province_name=="Ratanak Kiri"
replace p_code=17 if province_name=="Siemreap"
replace p_code=18 if province_name=="Preah Sihanouk"
replace p_code=19 if province_name=="Stung Treng"
replace p_code=20 if province_name=="Svay Rieng"
replace p_code=21 if province_name=="Takeo"
replace p_code=22 if province_name=="Oddar Meanchey"
replace p_code=23 if province_name=="Kep"
replace p_code=24 if province_name=="Pailin"
replace p_code=25 if province_name=="Tboung Khmum"
tab p_code,m


tostring p_code, gen(pr_code)
replace pr_code="0"+pr_code if p_code<10
gen village_id=pr_code+district_code+commune_code+village_code
replace village_id="24010110" if village_id=="24010101"
replace village_id="24020205" if village_id=="24020209"

* oddar meanchey 22, siemreap 17, kratie 10
merge m:m village_id using "mergedCDB_2015.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2015hha_villCDB.dta", replace

*MERGING FOR 2016 HH AND VILLAGE CSES, AND CDB

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 
use "mergedCDB_2016.dta", clear
drop village_id
tostring villgis, gen(village_id)
replace village_id="0"+village_id if villgis<10000000
save "mergedCDB_2016.dta", replace

use "merged_2016hha_vill.dta", clear


gen p_code=.
replace p_code=1 if province_name=="Banteay Meanchey"
replace p_code=2 if province_name=="Battambang"
replace p_code=3 if province_name=="Kampong Cham"
replace p_code=4 if province_name=="Kampong Chhnang"
replace p_code=5 if province_name=="Kampong Speu"
replace p_code=6 if province_name=="Kampong Thom"
replace p_code=7 if province_name=="Kampot"
replace p_code=8 if province_name=="Kandal"
replace p_code=9 if province_name=="Koh Kong"
replace p_code=10 if province_name=="Kratie"
replace p_code=11 if province_name=="Mondul Kiri"
replace p_code=12 if province_name=="Phnom Penh"
replace p_code=13 if province_name=="Preah Vihear"
replace p_code=14 if province_name=="Prey Veng"
replace p_code=15 if province_name=="Pursat"
replace p_code=16 if province_name=="Ratanak Kiri"
replace p_code=17 if province_name=="Siemreap"
replace p_code=18 if province_name=="Preah Sihanouk"
replace p_code=19 if province_name=="Stung Treng"
replace p_code=20 if province_name=="Svay Rieng"
replace p_code=21 if province_name=="Takeo"
replace p_code=22 if province_name=="Oddar Meanchey"
replace p_code=23 if province_name=="Kep"
replace p_code=24 if province_name=="Pailin"
replace p_code=25 if province_name=="Tboung Khmum"
tab p_code,m

tostring p_code, gen(pr_code)
replace pr_code="0"+pr_code if p_code<10
gen village_id=pr_code+district_code+commune_code+village_code
replace village_id="22020218" if village_id=="22020217"
replace village_id="22020411" if village_id=="22020414"
replace village_id="22030303" if village_id=="22030308"

* oddar meanchey 22, siemreap 17, kratie 10
merge m:m village_id using "mergedCDB_2016.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2016hha_villCDB.dta", replace

*MERGING FOR 2017 HH AND VILLAGE CSES, AND CDB

cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data4" 

use "merged_2017hha_vill.dta", clear

gen p_code=.
replace p_code=1 if province_name=="Banteay Meanchey"
replace p_code=2 if province_name=="Battambang"
replace p_code=3 if province_name=="Kampong Cham"
replace p_code=4 if province_name=="Kampong Chhnang"
replace p_code=5 if province_name=="Kampong Speu"
replace p_code=6 if province_name=="Kampong Thom"
replace p_code=7 if province_name=="Kampot"
replace p_code=8 if province_name=="Kandal"
replace p_code=9 if province_name=="Koh Kong"
replace p_code=10 if province_name=="Kratie"
replace p_code=11 if province_name=="Mondul Kiri"
replace p_code=12 if province_name=="Phnom Penh"
replace p_code=13 if province_name=="Preah Vihear"
replace p_code=14 if province_name=="Prey Veng"
replace p_code=15 if province_name=="Pursat"
replace p_code=16 if province_name=="Ratanak Kiri"
replace p_code=17 if province_name=="Siemreap"
replace p_code=18 if province_name=="Preah Sihanouk"
replace p_code=19 if province_name=="Stung Treng"
replace p_code=20 if province_name=="Svay Rieng"
replace p_code=21 if province_name=="Takeo"
replace p_code=22 if province_name=="Oddar Meanchey"
replace p_code=23 if province_name=="Kep"
replace p_code=24 if province_name=="Pailin"
replace p_code=25 if province_name=="Tboung Khmum"
tab p_code,m


tostring p_code, gen(pr_code)
replace pr_code="0"+pr_code if p_code<10

gen village_id=pr_code+district_code+commune_code+village_code
replace village_id="22020411" if village_id=="22020414"
replace village_id="22030303" if village_id=="22030308"

* oddar meanchey 22, siemreap 17, kratie 10
merge m:m village_id using "mergedCDB_2017.dta", generate(merge)
drop if merge!=3
drop merge
save "merged_2017hha_villCDB.dta", replace



