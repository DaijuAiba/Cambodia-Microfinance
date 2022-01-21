



clear matrix
clear mata
set emptycells drop 

cd "G:\My Drive\cma_nix\cma_nix_new"
use "no_establishments_com.dta", clear
gen cccccc=comm_code
tostring comm_code, replace
replace comm_code="0"+comm_code if cccccc<100000
br 
drop cccccc
save "no_establishments2_com.dta", replace


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
use "no_establishments2_com.dta", clear

merge 1:1 comm_code using trans2_comm2018
drop if _merge!=3

drop _merge

merge 1:1 comm_code using camdb2018a_com
drop if _merge!=3
drop _merge

**********************************************************



* Drawing the map 
format no_firms %4.0f

spmap no_firms using camcoord2018_com, id(id) fcolor(Spectral) title(Number of establishments) clnumber(4) polygon(data(camcoord2018_com.dta)) 
graph save "no_firms.gph", replace
graph export no_firms.png, replace

tab no_firms,m
br comm_code no_firms




spmap no_firms using camcoord2018, id(id) fcolor(Blues) title(Number of establishments) clnumber(4) polygon(data(camcoord2018.dta)) 

spmap no_firms using camcoord2018, id(id) fcolor(Oranges) title(Number of establishments/firms) clnumber(4) polygon(data(camcoord2018.dta)) 



/* References
https://www.stata.com/support/faqs/graphics/spmap-and-maps/

*/

