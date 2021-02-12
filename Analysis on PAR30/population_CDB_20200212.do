

* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* DATA: Commune Database of Cambodia

******************************
***********************
* MERGING THE 2014-2017 CDB 

/* FOR 2014 VILLAGE, COMMUNE, AND DISTRICT
I change lower to capital case initial letters for villGis, commGis, and distGis

I drop the pre-existing "year" variable from CDB2014_com(2) CDB2015_com(2) CDB2016_com(2) and CDB2017_com(2)

For 2018, I do separately because the merging within the village, commune, and district level has been already done
*/
clear
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB2014_vill(1)", clear
merge 1:1 villGis using "CDB2014_vill(2)", generate(merge)
drop merge
merge 1:1 villGis using "CDB2014_vill(3)", generate(merge)
drop merge
gen vvv=villGis
tostring villGis, replace
replace villGis="0"+villGis if vvv<10000000
gen commGis=substr(villGis, 1,6)
drop vvv
br commGis villGis 

destring commGis, replace
merge m:1 commGis using "CDB2014_com(1)", generate(merge)
drop merge
merge m:1 commGis using "CDB2014_com(2)", generate(merge)
drop merge
gen ccc=commGis
tostring commGis, replace
replace commGis="0"+commGis if ccc<100000
gen distGis=substr(commGis, 1,4)
drop ccc

destring distGis, replace
merge m:1 distGis using "CDB2014_dist", generate(merge)
drop merge
gen ddd=distGis
tostring distGis, replace
replace distGis="0"+distGis if ddd<1000

br distGis commGis villGis
rename villGis VillGis
rename commGis CommGis
rename distGis DistGis
gen year=2014
save "merged_CDB2014all", replace


/* FOR 2015, 2016, 2017, AND 2019 
because 2018 is also a bit different, we make it separately
*/




clear
foreach y in 2015 2016 2017 {
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB`y'_vill(1)", clear
merge 1:1 VillGis using "CDB`y'_vill(2)", generate(merge)
drop merge
merge 1:1 VillGis using "CDB`y'_vill(3)", generate(merge)
drop merge
gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000
gen CommGis=substr(VillGis, 1,6)
drop vvv
br CommGis VillGis 

destring CommGis, replace
merge m:1 CommGis using "CDB`y'_com(1)", generate(merge)
drop merge
merge m:1 CommGis using "CDB`y'_com(2)", generate(merge)
drop merge
gen ccc=CommGis
tostring CommGis, replace
replace CommGis="0"+CommGis if ccc<100000
gen DistGis=substr(CommGis, 1,4)
drop ccc

destring DistGis, replace
merge m:1 DistGis using "CDB`y'_dist", generate(merge)
drop merge
gen ddd=DistGis
tostring DistGis, replace
replace DistGis="0"+DistGis if ddd<1000
gen year=`y'
save "merged_CDB`y'all", replace
clear
}

* FOR 2018
clear
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB2018_vill", clear
gen CommGis=substr(VillGis, 1,6)
destring CommGis, replace
merge m:1 CommGis using "CDB2018_com", generate(merge)
drop merge
gen ccc=CommGis
tostring CommGis, replace
replace CommGis="0"+CommGis if ccc<100000
drop ccc
destring DistGis, replace
merge m:1 DistGis using "CDB2018_dist", generate(merge)
drop merge
gen ddd=DistGis
tostring DistGis, replace
replace DistGis="0"+DistGis if ddd<1000
br VillGis CommGis DistGis
gen year=2018
save "merged_CDB2018all", replace

* For 2019

clear
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB2019_vill(1)", clear
merge 1:1 VillGis using "CDB2019_vill(2)", generate(merge)
drop merge
merge 1:1 VillGis using "CDB2019_vill(3)", generate(merge)
drop merge
gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000
gen CommGis=substr(VillGis, 1,6)
drop vvv
br CommGis VillGis 

destring CommGis, replace
merge m:1 CommGis using "CDB2019_com(1)", generate(merge)
drop merge
gen ccc=CommGis
tostring CommGis, replace
replace CommGis="0"+CommGis if ccc<100000
gen DistGis=substr(CommGis, 1,4)
drop ccc

destring DistGis, replace
merge m:1 DistGis using "CDB2019_dist", generate(merge)
drop merge
gen ddd=DistGis
tostring DistGis, replace
replace DistGis="0"+DistGis if ddd<1000

br DistGis CommGis VillGis
gen year=2019
save "merged_CDB2019all", replace



clear
append using merged_CDB2014all merged_CDB2015all merged_CDB2016all merged_CDB2017all merged_CDB2018all merged_CDB2019all, force


* DESCRIPTIVE STATISTICS

codebook v2
tab v2,m
gen fem_tot=v2 if v2!=.

codebook v3
tab v3,m
gen mal_tot=v3 if v3!=.

gen pop_sizeV=fem_tot+mal_tot if v2!=. & v3!=. /* village level */

* Total land area of commune 
gen land_areaC=v2007 if v2007!=.  /* Commune level  */

egen pop_sizeC=sum(pop_sizeV), by(CommGis)

gen pop_density=pop_sizeC/land_areaC
br pop_sizeV pop_sizeC pop_density

* Disasters at village level
gen storm=v1318
gen flood=v1320
gen drought=v1322

collapse (sum) pop_sizeC land_areaC pop_density storm flood drought, by(DistGis year)


rename DistGis district_code

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "appended_CDB2014-19all", replace



