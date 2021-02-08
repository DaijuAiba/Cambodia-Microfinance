
//Make the data for disaster 
cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2011_vill(3).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2011

save "disaster_2011_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2012_vill(4).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2012

save "disaster_2012_dis_level", replace

cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2013_vill(3).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2013

save "disaster_2013_dis_level", replace



cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2014_vill(3).dta" ,clear

tostring villGis, gen(vgis)
replace vgis="0" + vgis if villGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2014

save "disaster_2014_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2015_vill(3).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2015

save "disaster_2015_dis_level", replace



cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2016_vill(3).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)

gen year= 2016
save "disaster_2016_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2017_vill(3).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1317 v1318 v1319 v1320 v1321 v1322 , by(distgis)
gen year= 2017
save "disaster_2017_dis_level", replace


clear 

ap using disaster_2011_dis_level
ap using disaster_2012_dis_level
ap using disaster_2013_dis_level
ap using disaster_2014_dis_level
ap using disaster_2015_dis_level
ap using disaster_2016_dis_level
ap using disaster_2017_dis_level


rename distgis district_code

save "disaster_dis_level",replace

end
//=======
cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2011_vill(1).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1 , by(distgis)
gen year= 2011

save "population_2011_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2012_vill(1).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1, by(distgis)
gen year= 2012

save "population_2012_dis_level", replace

cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2013_vill(1).dta" ,clear

tostring villgis, gen(vgis)
replace vgis="0" + vgis if villgis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum) v1 , by(distgis)
gen year= 2013

save "population_2013_dis_level", replace



cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2014_vill(1).dta" ,clear

tostring villGis, gen(vgis)
replace vgis="0" + vgis if villGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)
gen year= 2014

save "population_2014_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2015_vill(1).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)
gen year= 2015

save "population_2015_dis_level", replace



cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2016_vill(1).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)

gen year= 2016
save "population_2016_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2017_vill(1).dta" ,clear

tostring VillGis, gen(vgis)
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)
gen year= 2017
save "population_2017_dis_level", replace


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2018_vill.dta" ,clear

gen vgis=VillGis 
destring VillGis, replace force
replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)
gen year= 2018
save "population_2018_dis_level", replace



cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"
use "C:\Users\a0841\OneDrive\2014-2015 Cambodia Survey\Commune Database\CDB2019_vill(1).dta" ,clear

tostring VillGis, gen(vgis)

replace vgis="0" + vgis if VillGis<10000000

gen dgis=substr(vgis,1,4)
destring dgis,gen(distgis)


collapse (sum)  v1 , by(distgis)
gen year= 2019
save "population_2019_dis_level", replace



clear 

ap using population_2011_dis_level
ap using population_2012_dis_level
ap using population_2013_dis_level
ap using population_2014_dis_level
ap using population_2015_dis_level
ap using population_2016_dis_level
ap using population_2017_dis_level
ap using population_2018_dis_level
ap using population_2019_dis_level


rename distgis district_code

save "population_dis_level",replace

end



//=============
tsset  distgis year

graph bar v1317 v1319 v1321, over(year)

graph bar v1318 v1320 v1322, over(year)

hist v1322

scatter v1320 v1322

scatter v1319 v1320 
scatter v1321 v1322



//=================

use "CMA-NIX 2014q4-2019q4",clear

keep if period==tq(2017q4)| period==tq(2016q4) | period==tq(2015q4) | period==tq(2014q4)   

gen year=.
replace year =2017 if period == tq(2017q4)
replace year =2016 if period == tq(2016q4)
replace year =2015 if period == tq(2015q4)
replace year =2014 if period == tq(2014q4)
gen PAR_ratio= par_30/amount_loan 
collapse (sum) par_30  amount_loan  if  PAR_ratio<1 , by(year district_code)
gen PAR_ratio= par_30/amount_loan 

merge m:1 district_code year using "disaster_dis_level"

drop _merge 

merge m:1 district_code year using  "population_dis_level"


gen flood_pop= v1319/v1
gen draught_pop= v1321/v1


hist PAR_ratio

scatter  PAR_ratio  v1319

reg  PAR_ratio  v1319  
reg  PAR_ratio    v1321
reg  PAR_ratio  v1319  v1321 


reg  PAR_ratio  flood_pop  
reg  PAR_ratio    draught_pop


reg  PAR_ratio  flood_pop  draught_pop i.year i.district_code 
qreg  PAR_ratio  flood_pop  draught_pop i.year i.district_code, q(50) 

