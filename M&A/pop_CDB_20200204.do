
* PROJECT TITLE: STUDY ON FINANCIAL INCLUSION IN CAMBODIA
* Project leader: Dr. Aiba Daiju
* Research assistant: Hailegabriel Abebe Fenta
* DATA: Commune Database of Cambodia

******************************
***********************
* MERGING THE 2014-2017 CDB AT THE VILLAGE LEVEL

clear
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB2014_vill(1)", clear
merge 1:1 villGis using "CDB2014_vill(2)", generate(merge)
drop merge
merge 1:1 villGis using "CDB2014_vill(3)", generate(merge)
drop merge
rename villGis VillGis
gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000
gen CommGis=substr(VillGis, 1,6)
gen DistGis=substr(CommGis, 1,4)
drop vvv
gen year=2014
save "merged_CDB2014_vill", replace

clear
foreach y in 2015 2016 2017 2019 {
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
gen DistGis=substr(CommGis, 1,4)
drop vvv
gen year=`y'
save "merged_CDB`y'_vill", replace
}

clear
cd "C:\Users\phd14102\Google Drive\cma_nix\Commune Database"
use "CDB2018_vill", clear
/*
gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000
*/
gen CommGis=substr(VillGis, 1,6)
gen year=2018
save "merged_CDB2018_vill", replace

clear
append using merged_CDB2014_vill merged_CDB2015_vill merged_CDB2016_vill merged_CDB2017_vill merged_CDB2018_vill merged_CDB2019_vill, force


* DESCRIPTIVE STATISTICS

codebook v2
tab v2,m
gen fem_tot=v2 if v2!=.

codebook v3
tab v3,m
gen mal_tot=v3 if v3!=.

gen pop_size=fem_tot+mal_tot if v2!=. & v3!=.


codebook v1
tab v1,m
gen tot_fam=v1 if v1!=.
gen no_hhs=tot_fam


collapse (sum) pop_size no_hhs, by(DistGis year)

rename DistGis district_code

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
save "appended_CDB2014-19_vill", replace



