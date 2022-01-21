



clear matrix
clear mata
set emptycells drop 

cd "G:\My Drive\cma_nix\Disaster_HH finance"
use "appended_CDB2014-19all.dta", clear

rename commune_id comm_code
keep no_stormF no_floodF no_droughtF no_disasterF year comm_code
collapse (max) no_stormF no_floodF no_droughtF no_disasterF, by(comm_code)
br

cd "G:\My Drive\cma_nix\cma_nix_new"

save "disaster_comm.dta", replace



* Preparing to make a hazard map
*************************************

* Installing applications


ssc install spmap
ssc install shp2dta
ssc install mif2dta


* Translating the files
/* SOURCE OF GIS DATA
https://data.humdata.org/dataset/cambodia-admin-level-0-international-boundaries
*/

shp2dta using khm_admbnda_adm3_gov_20181004.shp, database(camdb2018_com) coordinates(camcoord2018_com) genid(id) replace

* Determining the coding used by the map
use "camdb2018_com.dta", clear
describe
list id ADM3_EN ADM3_PCODE
replace ADM3_PCODE = subinstr(ADM3_PCODE, "KH", "", .)
rename ADM3_PCODE comm_code
br comm_code
distinct comm_code
br comm_code id  /* I use this list to construct trans_comm2018 data   */
save "camdb2018a_com.dta", replace

use "trans_comm2018.dta", clear
gen cccccc=comm_code
tostring comm_code, replace
replace comm_code="0"+comm_code if cccccc<100000
br comm_code
distinct comm_code id
save "trans2_comm2018.dta", replace


************************************
* Merging
use "disaster_comm.dta", clear

merge 1:1 comm_code using trans2_comm2018
drop if _merge!=3

drop _merge

merge 1:1 comm_code using camdb2018a_com
drop if _merge!=3
drop _merge

**********************************************************

hist no_stormF, percent xtitle(Number of families) title(Number of Families in the Commune Affected by Storm, size(medium))
hist no_stormF if no_stormF<50, percent xtitle(Number of families) title(Number of Families in the Commune Affected by Storm, size(medium))
*xlabel(0(1)25)

hist no_floodF, percent xtitle(Number of families) title(Number of Families in the Commune Affected by Flood, size(medium))
hist no_floodF if no_floodF<=500, percent xtitle(Number of families) title(Number of Families in the Commune Affected by Flood, size(medium)) 

hist no_droughtF, percent xtitle(Number of families) title(Number of Families in the Commune Affected by Drought, size(medium))


* Drawing the map 
format no_stormF no_floodF no_droughtF no_disasterF %4.0f

spmap no_stormF using camcoord2018_com, id(id) fcolor(YlOrRd) title(Number of Persons affected by Storm) clnumber(3)
spmap no_stormF using camcoord2018_com, id(id) fcolor(YlOrRd) title(Number of Persons affected by Storm) clmethod(custom) clbreaks (0 10 50 100 500 920)
graph save "storm_com.gph", replace
graph export storm_com.png, replace

br comm_code if no_stormF>500
br comm_code if no_stormF>100

spmap no_floodF using camcoord2018_com, id(id) fcolor(Reds2) title(Number of Persons affected by Flood) clnumber(3)
spmap no_floodF using camcoord2018_com, id(id) fcolor(Reds2) title(Number of Persons affected by Flood) clmethod(custom) clbreaks (0 10 50 100 500 1297) 

br comm_code if no_floodF>500

 
graph save "flood_com.gph", replace
graph export flood_com.png, replace

spmap no_droughtF using camcoord2018_com, id(id) fcolor(Greens) title(Number of Persons affected by Drought) clnumber(4)
spmap no_droughtF using camcoord2018_com, id(id) fcolor(Greens) title(Number of Persons affected by Drought) clmethod(custom) clbreaks (0 10 50 100 500 1000 3091)

br comm_code if no_droughtF>500
br comm_code if no_droughtF>1000

graph save "drought_com.gph", replace
graph export drought_com.png, replace

spmap no_disasterF using camcoord2018_com, id(id) fcolor(Greens2) title(Number of Families affected by Disaster) clnumber(4)
graph save "disaster_com.gph", replace
graph export disaster_com.png, replace


/* References
https://www.stata.com/support/faqs/graphics/spmap-and-maps/

*/

spmap no_floodF using camcoord2018_com, id(id) fcolor(Oranges) title(Number of Families affected by Flood) clmethod(custom) clbreaks (0 2 100 920)
graph save "flood_com2.gph", replace
graph export flood_com2.png, replace

spmap no_stormF using camcoord2018_com, id(id) fcolor(YlOrRd) title(Number of Persons affected by Storm) clnumber(3) 
graph save "storm_com.gph", replace
graph export storm_com.png, replace


