
clear all

cd "G:\My Drive\cma_nix\Disaster_HH finance\Disaster_since202204"
  
use ".\GPCC2019_Household.dta", clear

desc c1_khet c2_srok c3_khum c4_phum c5_ea
br c1_khet c2_srok c3_khum c4_phum c5_ea
gen cc1=c1_khet
gen cc2=c2_srok
gen cc3=c3_khum
tostring c4_phum, gen (cc4)
destring cc4, replace
gen cc5=c5_ea
gen cc6=c6_building 
tostring c7_hhno, gen (cc7) 
drop if cc7=="99"

tostring c1_khet c2_srok c3_khum c4_phum c5_ea c6_building c7_hhno, replace
tostring c4_phum, gen(c4_phum1)
tostring c7_hhno, gen(c7_hhno1)

replace c1_khet="0"+c1_khet if cc1<10
replace c2_srok="0"+c2_srok if cc2<10
replace c3_khum="0"+c3_khum if cc3<10
replace c4_phum1="0"+c4_phum1 if cc4<10
replace c5_ea="0"+c5_ea if cc5<10
replace c6_building="00"+c6_building if cc6<10
replace c6_building="0"+c6_building if cc6>=10 & cc6<100

drop cc1 cc2 cc3 cc4 cc5 cc6 cc7

egen hhid= concat(c1_khet c2_srok c3_khum c4_phum1 c5_ea c6_building c7_hhno1)
br c1_khet c2_srok c3_khum c4_phum1 c5_ea c6_building c7_hhno1 hhid
distinct hhid


gen comm_code=substr(hhid, 1,6)
br hhid comm_code

tab urban_rural,m
tab urban_rural, nolabel
gen rural=(urban_rural==2) if urban_rural!=.

tab h11_tv,m
gen zero_tv=(h11_tv==0) if h11_tv!=.

tab h13_cellphone,m
gen zero_cellphone=(h13_cellphone==0) if h13_cellphone!=.

tab h14_computer,m
gen zero_computer=(h14_computer==0) if h14_computer!=.

tab h16_motorbike,m
gen zero_motor=(h16_motorbike==0) if h16_motorbike!=.

tab h18_washing_machine,m
gen zero_wash_machine=(h18_washing_machine==0) if h18_washing_machine!=.

tab h20_air_conditioner,m
gen zero_aircon=(h20_air_conditioner==0) if h20_air_conditioner!=.

tab h21_car,m
gen zero_car=(h21_car==0) if h21_car!=.

tab floor,m nolab
gen wood_floor=(floor==2) if floor!=.

keep hhid comm_code rural zero_tv zero_cellphone zero_computer zero_motor zero_wash_machine zero_aircon zero_car wood_floor

save ".\GPCC2019hh.dta", replace

use ".\GPCC2019_Person_Fertility.dta", clear

desc c1_khet c2_srok c3_khum c4_phum c5_ea
br c1_khet c2_srok c3_khum c4_phum c5_ea
gen cc1=c1_khet
gen cc2=c2_srok
gen cc3=c3_khum
tostring c4_phum, gen (cc4)
destring cc4, replace
gen cc5=c5_ea
gen cc6=c6_building 
tostring c7_hhno, gen (cc7) 
drop if cc7=="99"

tostring c1_khet c2_srok c3_khum c4_phum c5_ea c6_building c7_hhno, replace
tostring c4_phum, gen(c4_phum1)
tostring c7_hhno, gen(c7_hhno1)

replace c1_khet="0"+c1_khet if cc1<10
replace c2_srok="0"+c2_srok if cc2<10
replace c3_khum="0"+c3_khum if cc3<10
replace c4_phum1="0"+c4_phum1 if cc4<10
replace c5_ea="0"+c5_ea if cc5<10
replace c6_building="00"+c6_building if cc6<10
replace c6_building="0"+c6_building if cc6>=10 & cc6<100

drop cc1 cc2 cc3 cc4 cc5 cc6 cc7

egen hhid= concat(c1_khet c2_srok c3_khum c4_phum1 c5_ea c6_building c7_hhno1)
br c1_khet c2_srok c3_khum c4_phum1 c5_ea c6_building c7_hhno1 hhid
distinct hhid

br p12_prevres p12_pro p12_dis p12_com
tostring p12_prevres, gen(cccP)
destring cccP, replace
tostring p12_prevres, gen(comm_codeP)

replace comm_codeP="0"+comm_codeP if cccP<100000
drop if comm_codeP>"251000"

tab p04_sex,m
gen female=(p04_sex==2)
tab p05_age,m
gen age=p05_age
tab p07_marital,m 
gen ever_married=(p07_marital!=1)
tab p08_marriage_age,m nolab
gen age_marriage=p08_marriage_age if p08_marriage_age<990

tab p13_duration_stay,m
tab p13_duration_stay,m nolabel
gen moved=(p13_duration_stay<=99) if p14_migration!=99
tab moved,m
gen duration_stay=p13_duration_stay if p13_duration_stay<=95
tab p14_migration,m
gen mig_workTransfer=(p14_migration==1) if p14_migration!=99
gen mig_empSearch=(p14_migration==2) if p14_migration!=99
gen mig_marriage=(p14_migration==4) if p14_migration!=99
gen mig_famMoved=(p14_migration==5) if p14_migration!=99
gen mig_lostLandHome=(p14_migration==6) if p14_migration!=99
gen mig_naturalCal=(p14_migration==7) if p14_migration!=99
gen mig_otherReason=(p14_migration==3 | (p14_migration>7 & p14_migration<99)) if p14_migration!=99
sum duration_stay moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason

tab p16a_school,m nolab
tab p16a_school,m 
gen ever_attended=(p16a_school>1 & p16a_school<9) if p16a_school!=9
tab p16b_grade_attending,m 
tab p16b_grade_attending,m nolab
gen low_secMore=(p16b_grade_attending>=7 & p16b_grade_attending<=19) if p16a_school!=9
gen upp_secMore=(p16b_grade_attending>=10 & p16b_grade_attending<=19)  if p16a_school!=9
gen under_gradMore=(p16b_grade_attending>=17 & p16b_grade_attending<=19)  if p16a_school!=9
sum ever_attended low_secMore upp_secMore under_gradMore

tab p19_occupation,m
tab p19_occupation,m nolabel
gen mkt_gard_crop=(p19_occupation==611) if p19_occupation!=.  /* Market gardeners and crop growers*/
gen subsistence_crop=(p19_occupation==631) if p19_occupation!=.   /* Subsistence crop farmers */
gen garment=(p19_occupation==755) if p19_occupation!=. /* garment and related trades workers */
gen shop_salespersons=(p19_occupation==548) if p19_occupation!=. /* shop salespersons */
gen mining=(p19_occupation==931) if p19_occupation!=. /* mining and construction laborers */
gen street_mkt=(p19_occupation== 541) if p19_occupation!=. /*  Street market salespersons */
gen frame_build=(p19_occupation==711) if p19_occupation!=. /* Building frame and related trades worker */
gen agri_forest=(p19_occupation==921) if p19_occupation!=. /* agricultural, forestry and fishery laborers */ 
gen client_info=(p19_occupation==422) if p19_occupation!=. /* client information workers */
gen other_occ=(p19_occupation!=611 & p19_occupation!=631 & p19_occupation!=755 & p19_occupation!=548 & p19_occupation!=931 & p19_occupation!=541 & p19_occupation!=711 & p19_occupation!=921 & p19_occupation!=422 & p19_occupation!=999 & p19_occupation!=. )

sum mkt_gard_crop subsistence_crop garment shop_salespersons mining street_mkt frame_build agri_forest client_info other_occ

tab f04a_ceb_m,m
gen ceb_m=f04a_ceb_m if f04a_ceb_m<=20
tab f04b_ceb_f,m
gen ceb_f=f04b_ceb_f if f04b_ceb_f<=20
gen ceb=ceb_m+ceb_f

gen impairment=(p17_1see!=1 | p17_2hear!=1 | p17_3walk!=1 |  p17_4remember!=1 | p17_5self_care!=1 | p17_6usual!=1) if (p17_1see!=. | p17_2hear!=. | p17_3walk!=. | p17_4remember!=. | p17_5self_care!=.)
tab impairment,m

tab p18_activity,m 
gen employed=(p18_activity==1)

*collapse (sum) p04_sex p07_marital p14_migration p16a_school p18_activity (mean) p05_age p08_marriage_age p13_duration_stay, by(hhid)
*gen comm_code=substr(hhid, 1,6)
*br hhid comm_code

sum female age ever_married age_marriage ceb ceb_f ceb_m employed impairment

rename comm_codeP comm_code

keep hhid comm_code female ever_married mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason ever_attended employed age age_marriage duration_stay moved low_secMore upp_secMore under_gradMore ceb ceb_f ceb_m impairment mkt_gard_crop subsistence_crop garment shop_salespersons mining street_mkt frame_build agri_forest client_info other_occ


save ".\GPCC2019pp.dta", replace

