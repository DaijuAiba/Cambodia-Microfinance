
* MERGING THE 2014-2019 CDB 


/* 
FOR 2014 VILLAGE, COMMUNE, AND DISTRICT
I change lower to capital case initial letters for villGis, commGis, and distGis

I drop the pre-existing "year" variable from CDB2014_com(2) CDB2015_com(2) CDB2016_com(2) and CDB2017_com(2)
*/


clear
*cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data 20210812" 
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
keep VillGis CommGis DistGis year v1317 v1318 v1319 v1320 v1321 v1322 v2 v3 v2004 v2005 v2007 v2008 v2009 v2011 v2012 v2056 v2057
save "merged_CDB2014all", replace

clear
foreach y in 2015 2016 2017 {
*cd "T:\340_緒方貞子平和開発研究所\4_特殊\02_研究関連　所内共有データ\013_経済成長と貧困削減\2. Cambodia (Financial Inclusion)\Fenta Cambodia\working data 20210812" 

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
keep VillGis CommGis DistGis year v1317 v1318 v1319 v1320 v1321 v1322 v2 v3 v2004 v2005 v2007 v2008 v2009 v2011 v2012 v2056 v2057
save "merged_CDB`y'all", replace
clear
}

* For 2019

clear
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
keep VillGis CommGis DistGis year  v1317 v1318 v1319 v1320 v1321 v1322 v2 v3 v2004 v2005 v2007 v2008 v2009 v2011 v2012 v2056 v2057
save "merged_CDB2019all", replace


clear
append using merged_CDB2014all merged_CDB2015all merged_CDB2016all merged_CDB2017all merged_CDB2019all, force

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

* Disasters at village level
gen stormF=(v1317>=1)
gen storm=(v1318>=1)
gen floodF=(v1319>=1)
gen flood=(v1320>=1)
gen droughtF=(v1321>=1)
gen drought=(v1322>=1)

gen disasterF=(v1317>=1 | v1319>=1 | v1321>=1)

* Number of banks and microfinance institutions at commune level
codebook v2004
tab v2004,m
gen no_mfi_c=v2004 if v2004!=.
gen no_banks_c=v2005 if v2005!=.

* Infrastructure
codebook v2056 // number of lines of road in the commune
tab v2056,m
gen road_lines=v2056 if v2056!=. 

codebook v2057 // total length of road in the commune
tab v2057,m
gen road_length=v2057 if v2057!=. 


codebook v2008 // area of residential land
tab v2008,m
gen resid_areaC=v2008 if v2008!=. 

codebook v2009 // area of rice land in the commune
tab v2009,m
gen rice_areaC=v2009 if v2009!=. 

codebook v2011 // area of short-term crop land
tab v2011,m
gen shortC_areaC=v2011 if v2011!=. 

codebook v2012 // area of long-term crop land
tab v2012,m
gen longC_areaC=v2012 if v2012!=. 

/*
* road_lines road_length resid_areaC rice_areaC shortC_areaC longC_areaC no_mfi_c no_banks_c

*collapse (sum) pop_sizeC land_areaC road_length stormF floodF droughtF, by(DistGis year)
rename DistGis district_id
tab district_id,m
drop if district_id=="." | land_areaC==0
*/

collapse (sum) pop_sizeC land_areaC road_length (max) stormF floodF droughtF disasterF no_mfi_c no_banks_c, by(CommGis year)

rename CommGis commune_id
tab commune_id,m

cd "C:\Users\phd14102\Google Drive\cma_nix\Disaster_HH finance"

save "appended_CDB2014-19all", replace




