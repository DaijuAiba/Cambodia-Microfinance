
clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
use "cleaned_merged2011_19.dta", clear

drop if year<2014

keep storm flood drought stormF floodF droughtF year district_code id_mfi
collapse storm flood drought stormF floodF droughtF, by(district_code)

save "disaster.dta", replace


* Preparing to make a hazard map
*************************************

* Installing applications

/*
ssc install spmap
ssc install shp2dta
ssc install mif2dta
*/

* Translating the files

shp2dta using khm_admbnda_adm2_gov_20181004.shp, database(camdb2018) coordinates(camcoord2018) genid(id) replace

* Determining the coding used by the map
use "camdb2018.dta", clear
describe
list id ADM2_EN ADM2_PCODE
replace ADM2_PCODE = subinstr(ADM2_PCODE, "KH", "", .)
rename ADM2_PCODE district_code
br district_code
save "camdb2018a.dta", replace

use "trans.dta", clear
gen dddd=district_code
tostring district_code, replace
replace district_code="0"+district_code if dddd<1000
br district_code
save "trans2.dta", replace


* Merging
use "disaster.dta", clear

merge 1:1 district_code using trans2
drop _merge

merge 1:1 district_code using camdb2018a
drop _merge


* Drawing the map 
format storm flood drought stormF floodF droughtF %4.0f

spmap storm using camcoord2018, id(id) fcolor(Blues) title(Number of Persons affected by Storm) clnumber(2) 
graph save "storm.gph", replace
graph export storm.png, replace

spmap flood using camcoord2018, id(id) fcolor(Blues2) title(Number of Persons affected by Flood) clnumber(2)
graph save "flood.gph", replace
graph export flood.png, replace

spmap drought using camcoord2018, id(id) fcolor(Greens) title(Number of Persons affected by Drought) clnumber(2)
graph save "drought.gph", replace
graph export drought.png, replace

spmap stormF using camcoord2018, id(id) fcolor(Greens2) title(Number of Families affected by Storm) clnumber(2)
graph save "stormF.gph", replace
graph export stormF.png, replace

spmap floodF using camcoord2018, id(id) fcolor(Oranges) title(Number of Families affected by Flood) clnumber(2)
graph save "floodF.gph", replace
graph export floodF.png, replace

spmap droughtF using camcoord2018, id(id) fcolor(Greys) title(Number of Families affected by Drought) clnumber(2)
graph save "droughtF.gph", replace
graph export droughtF.png, replace

graph combine storm.gph stormF.gph
graph save "storm_stormF.gph", replace
graph export storm_stormF.png, replace

graph combine drought.gph droughtF.gph
graph save "drought_droughtF.gph", replace
graph export drought_droughtF.png, replace

graph combine flood.gph floodF.gph
graph save "flood_floodF.gph", replace
graph export flood_floodF.png, replace


/* References
https://www.stata.com/support/faqs/graphics/spmap-and-maps/

*/

