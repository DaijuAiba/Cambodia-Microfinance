

clear all
cd "G:\My Drive\cma_nix"
import excel ".\Commune Database\Original Excel Data\CDB2010\2010_CDB Excel Raw Data 2010 En New Gazetteer.xlsx", sheet("2010cdb") firstrow

fsum, label

gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000
gen CommGis=substr(VillGis, 1,6)
drop vvv
br CommGis VillGis 
rename CommGis comm_code
rename VillGis vill_code


collapse (sum) COW_FAMI Disas_fami H_Mot_trailer_NUM H_BICY H_Family_Car Wat_safe HH_migt_out NUM_FERT, by(comm_code)
distinct comm_code

* Reconciling comm codes before and after 2014

replace comm_code="250101" if comm_code=="030401"
replace comm_code="250102" if comm_code=="030402"
replace comm_code="250103" if comm_code=="030403"
replace comm_code="250104" if comm_code=="030404"
replace comm_code="250105" if comm_code=="030405"
replace comm_code="250106" if comm_code=="030407"
replace comm_code="250107" if comm_code=="030406"
replace comm_code="250201" if comm_code=="030901"
replace comm_code="250202" if comm_code=="030902"
replace comm_code="250203" if comm_code=="030903"
replace comm_code="250204" if comm_code=="030904"
replace comm_code="250205" if comm_code=="030905"
replace comm_code="250206" if comm_code=="030906"
replace comm_code="250207" if comm_code=="030907"
replace comm_code="250208" if comm_code=="030908"
replace comm_code="250209" if comm_code=="030909"
replace comm_code="250210" if comm_code=="030910"
replace comm_code="250211" if comm_code=="030911"
replace comm_code="250212" if comm_code=="030912"
replace comm_code="250301" if comm_code=="031001"
replace comm_code="250302" if comm_code=="031002"
replace comm_code="250303" if comm_code=="031003"
replace comm_code="250304" if comm_code=="031004"
replace comm_code="250305" if comm_code=="031005"
replace comm_code="250306" if comm_code=="031006"
replace comm_code="250307" if comm_code=="031016"
replace comm_code="250308" if comm_code=="031007"

replace comm_code="250309" if comm_code=="031008"
replace comm_code="250310" if comm_code=="031011"
replace comm_code="250311" if comm_code=="031010"
replace comm_code="250312" if comm_code=="031014"
replace comm_code="250313" if comm_code=="031013"
replace comm_code="250314" if comm_code=="031015"
replace comm_code="250401" if comm_code=="031101"
replace comm_code="250402" if comm_code=="031102"
replace comm_code="250403" if comm_code=="031103"
replace comm_code="250404" if comm_code=="031104"
replace comm_code="250405" if comm_code=="031105"
replace comm_code="250406" if comm_code=="031107"
replace comm_code="250407" if comm_code=="031108"
replace comm_code="250501" if comm_code=="031202"
replace comm_code="250502" if comm_code=="031203"
replace comm_code="250503" if comm_code=="031204"
replace comm_code="250504" if comm_code=="031205"
replace comm_code="250505" if comm_code=="031206"
replace comm_code="250506" if comm_code=="031207"
replace comm_code="250507" if comm_code=="031208"
replace comm_code="250508" if comm_code=="031209"
replace comm_code="250601" if comm_code=="031701"
replace comm_code="250602" if comm_code=="031702"
replace comm_code="250701" if comm_code=="031601"
replace comm_code="250702" if comm_code=="031602"
replace comm_code="250703" if comm_code=="031604"
replace comm_code="250704" if comm_code=="031605"
replace comm_code="250705" if comm_code=="031606"
replace comm_code="250706" if comm_code=="031608"
replace comm_code="250707" if comm_code=="031612"
replace comm_code="250708" if comm_code=="031613"
replace comm_code="250709" if comm_code=="031614"
replace comm_code="250710" if comm_code=="031615"
replace comm_code="250711" if comm_code=="031616"
replace comm_code="250712" if comm_code=="031618"
replace comm_code="250713" if comm_code=="031621"
replace comm_code="250714" if comm_code=="031622"

distinct comm_code


tab COW_FAMI,m 
gen cow=COW_FAMI
replace cow=1 if COW_FAMI==0
gen ln_cow=log(cow)

tab Disas_fami,m 
gen disas=Disas_fami
replace disas=1 if Disas_fami==0
gen ln_disas=log(disas)

tab H_Mot_trailer_NUM,m
gen motor=H_Mot_trailer_NUM
replace motor=1 if H_Mot_trailer_NUM==0
gen ln_motor=log(motor)


tab H_BICY,m
gen bicy=H_BICY
replace bicy=1 if H_BICY==1
gen ln_bicy=log(bicy)

tab H_Family_Car,m
gen car=H_Family_Car
replace car=1 if H_Family_Car==0
gen ln_car=log(car)

tab Wat_safe,m 
gen safeW=Wat_safe
replace safeW=1 if Wat_safe==0
gen ln_safeW=log(safeW)

tab HH_migt_out,m 
gen migt_out=HH_migt_out
replace migt_out=1 if HH_migt_out==0
gen ln_migt_out=log(migt_out)

tab NUM_FERT,m 
gen fertilizer=NUM_FERT
replace fertilizer=1 if NUM_FERT==0
gen ln_fertilizer=log(fertilizer)


sum ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer

save ".\Disaster_HH finance\Disaster_since202204\2008cdb_comm.dta", replace


************************************
cd "G:\My Drive\cma_nix\Disaster_HH finance\Disaster_since202204"

* Merging
use "2008cdb_comm.dta", clear

merge m:1 comm_code using "disaster2011_comm"
drop if _merge!=3
drop _merge

tab no_floodF,m
gen exposedD=(no_floodF!=0) if no_floodF!=.

gen exposedR=no_floodF/no_familiesV

gen exposedR2=no_floodF/no_familiesV
replace exposedR2=. if no_floodF==0


local var ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer
foreach y in `var' {
	reg `y' exposedD, cluster(comm_code)
	estimates store `y'
}
estimates table ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer, keep(exposedD) b(%9.4f) se(%9.4f) t(%9.2f) p(%9.4f) stats(r2_a N)

local var ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer
foreach y in `var' {
	reg `y' exposedR, cluster(comm_code)
	estimates store `y'
}
estimates table ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer, keep(exposedR) b(%9.4f) se(%9.4f) t(%9.2f) p(%9.4f) stats(r2_a N)

local var ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer
foreach y in `var' {
	reg `y' exposedR2, cluster(comm_code)
	estimates store `y'
}
estimates table ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer, keep(exposedR2) b(%9.4f) se(%9.4f) t(%9.2f) p(%9.4f) stats(r2_a N)



* Control is limited to those communes in similar districts to those exposed.

drop exposedD exposedR exposedR2

gen dist_code=substr(comm_code, 1,4)
distinct comm_code dist_code


drop if dist_code=="0106" | dist_code=="0110" | dist_code=="0204" | dist_code=="0205" | dist_code=="0211" | dist_code=="0302" | dist_code=="0304" | dist_code=="0307" | dist_code=="0401" | dist_code=="0402" | dist_code=="0403" | dist_code=="0404" | dist_code=="0408" | dist_code=="0501" | dist_code=="0502" | dist_code=="0503" | dist_code=="0504" | dist_code=="0505" | dist_code=="0506" | dist_code=="0507" | dist_code=="0508" | dist_code=="0603" | dist_code=="0605" | dist_code=="0701" | dist_code=="0703" | dist_code=="0707" | dist_code=="0708" | dist_code=="0805" | dist_code=="0809" | dist_code=="0901" | dist_code=="0902" | dist_code=="0903" | dist_code=="0904" | dist_code=="0905" | dist_code=="0906" | dist_code=="0907" | dist_code=="1102" | dist_code=="1103" | dist_code=="1104" | dist_code=="1105" | dist_code=="1307" | dist_code=="1308" | dist_code=="1406" | dist_code=="1407" | dist_code=="1411" | dist_code=="1601" | dist_code=="1602" | dist_code=="1603" | dist_code=="1604" | dist_code=="1605" | dist_code=="1606" | dist_code=="1607" | dist_code=="1608" | dist_code=="1714" | dist_code=="1801" | dist_code=="1803" | dist_code=="1804" | dist_code=="1903" | dist_code=="1904" | dist_code=="2002" | dist_code=="2008" | dist_code=="2202" | dist_code=="2204" | dist_code=="2301" | dist_code=="2302" 

gen exposedD=(no_floodF!=0) if no_floodF!=.

gen exposedR=no_floodF/no_familiesV

gen exposedR2=no_floodF/no_familiesV
replace exposedR2=. if no_floodF==0



local var ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer
foreach y in `var' {
	reg `y' exposedD, cluster(comm_code)
	estimates store `y'
}
estimates table ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer, keep(exposedD) b(%9.4f) se(%9.4f) t(%9.2f) p(%9.4f) stats(r2_a N)

local var ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer
foreach y in `var' {
	reg `y' exposedR, cluster(comm_code)
	estimates store `y'
}
estimates table ln_cow ln_disas ln_motor ln_bicy ln_car ln_safeW ln_migt_out ln_fertilizer, keep(exposedR) b(%9.4f) se(%9.4f) t(%9.2f) p(%9.4f) stats(r2_a N)

