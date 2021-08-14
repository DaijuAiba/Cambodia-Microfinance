

/* 
PROJECT TITLE: FINANCIAL INCLUSION IN CAMBODIA
PROJECT LEADER: Dr. Aiba Daiju
RESEARCH ASSISTANT: Hailegabriel Abebe Fenta

*/

****** DATA 2011


cd 

global datafilepath Data

use "${datafilepath}\2011q4.dta", clear
*br district_code district_name B name
tostring district_code, replace


replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2011
*br district_code district_name year
tab amount_loan,m
gen am_loan=amount_loan if amount_loan<1000000
drop amount_loan
rename am_loan amount_loan

save "${datafilepath}\2011q4_n.dta", replace

********* DATA 2012

use "${datafilepath}\2012q4.dta", clear
*br district_code district_name
tostring district_code, replace

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2012
*br district_code district_name year
tab amount_loan,m
gen am_loan=amount_loan if amount_loan<1000000
drop amount_loan
rename am_loan amount_loan

save "${datafilepath}\2012q4_n.dta", replace

****** DATA 2013

use "${datafilepath}\2013q4.dta", clear
*br district_code district_name
tostring district_code, replace

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2013
save "${datafilepath}\2013q4_n.dta", replace

****** DATA 2014

use "${datafilepath}\2014q4.dta", clear
*br district_code district_name
tostring district_code, replace


drop if district_name==""

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

gen year=2014
save "${datafilepath}\2014q4_n.dta", replace



****** DATA 2015

use "${datafilepath}\2015q4.dta", clear
*br district_code district_name
tostring district_code, replace

drop if district_name==""

gen year=2015
save "${datafilepath}\2015q4_n.dta", replace


****** DATA 2016
use "${datafilepath}\2016q4.dta", clear
*br district_code district_name
tostring district_code, replace


drop if district_name==""
gen year=2016
save "${datafilepath}\2016q4_n.dta", replace

****** DATA 2017
use "${datafilepath}\2017q4.dta", clear
*br district_code district_name

tostring district_code, replace


drop if district_name==""
gen year=2017
save "${datafilepath}\2017q4_n.dta", replace

****** DATA 2018

use "${datafilepath}\2018q4.dta", clear
*br district_code district_name amount_loan
tostring district_code, replace

drop if district_name==""

gen year=2018
save "${datafilepath}\2018q4_n.dta", replace


****** DATA 2019

use "${datafilepath}\2019q4.dta", clear
*br district_name district_code amount_loan
*browse if missing(real(amount_loan))
replace amount_loan="" if amount_loan=="-"
destring amount_loan, replace 

*browse if missing(real(par_30))
replace par_30="" if par_30=="-"
destring par_30, replace 

replace ratio_par_30="" if ratio_par_30=="-"
/*  Deleting two outlier observations for ratio of par 30, far below 0.0001 */
/*
replace ratio_par_30="0.000003833196038" if ratio_par_30=="3.83319603773e-06"
replace ratio_par_30="0.000004107990864" if ratio_par_30=="4.10799086383e-06"
*/
tab ratio_par_30,m
destring ratio_par_30, replace force

replace reschedule_loan="" if reschedule_loan=="-"
replace ratio_reschedule_loan="" if ratio_reschedule_loan=="-"

destring reschedule_loan ratio_reschedule_loan, replace force
*destring amount_loan, replace dpcomma ignore(", ")

replace district_code="2501" if district_code=="304"
replace district_code="2502" if district_code=="309"
replace district_code="2503" if district_code=="310"
replace district_code="2504" if district_code=="311"
replace district_code="2505" if district_code=="312"
replace district_code="2506" if district_code=="317"
replace district_code="2507" if district_code=="316"

replace district_code="103" if district_code=="Kampong Leaeng" & district_name=="Phnum Srok"

tostring district_code, replace
drop if district_code=="1213" | district_code=="1214" /* Only in 2019 */
gen year=2019

save "${datafilepath}\2019q4_n.dta", replace


* APPENDING


cd 
clear
append using "${datafilepath}\2011q4_n" "${datafilepath}\2012q4_n" "${datafilepath}\2013q4_n" "${datafilepath}\2014q4_n" "${datafilepath}\2015q4_n" "${datafilepath}\2016q4_n" "${datafilepath}\2017q4_n" "${datafilepath}\2018q4_n" "${datafilepath}\2019q4_n", force

// distinct district_code  // 197 distinct district codes
// br district_name district_code year N
// br district_code
destring district_code, gen(dist)
replace district_code="0"+district_code if dist<1000
drop dist
// br  district_code

destring num_male_loan, replace

gen loan_size=amount_loan/total_num_borrowers


keep num_commune num_village num_office amount_loan par_30 ratio_par_30 write_off ratio_write_off reschedule_loan ratio_reschedule_loan num_male_loan num_female_loan total_num_borrowers amount_deposit num_male_deposits num_female_deposits total_num_depositors num_staff_male num_staff_female total_staff loan_size district_code year name


save "${datafilepath}\cma2011_19.dta", replace

************************************************************************************************************************************************************************
***********************

* MERGING THE 2014-2017 CDB 

/* FOR 2014 VILLAGE, COMMUNE, AND DISTRICT
I change lower to capital case initial letters for villGis, commGis, and distGis

I drop the pre-existing "year" variable from CDB2014_com(2) CDB2015_com(2) CDB2016_com(2) and CDB2017_com(2)

For 2018, I do separately because the merging within the village, commune, and district level has been already done
*/

clear
foreach y in 2014  2015 2016 2017 2019{
use "${datafilepath}\CDB`y'_vill(1)", clear
cap rename villgis VillGis

merge 1:1 VillGis using "${datafilepath}\CDB`y'_vill(2)", generate(merge)
drop merge
merge 1:1 VillGis using "${datafilepath}\CDB`y'_vill(3)", generate(merge)
drop merge
gen vvv=VillGis
tostring VillGis, replace
replace VillGis="0"+VillGis if vvv<10000000  // Or use strlen() function
gen CommGis=substr(VillGis, 1,6)
drop vvv
*br CommGis VillGis 

destring CommGis, replace
gen ccc=CommGis
tostring CommGis, replace 
replace CommGis="0"+CommGis if ccc<100000  // // Or use strlen() function
gen DistGis=substr(CommGis, 1,4)
drop ccc

destring DistGis, replace

collapse (sum) v2 v3 v1317 v1318 v1319 v1320 v1321 v1322,by(DistGis)
save "${datafilepath}\disrict_`y'(1)",replace



use "${datafilepath}\CDB`y'_com(1)", clear

gen ccc=CommGis
tostring CommGis, replace
replace CommGis="0"+CommGis if ccc<100000   // Or use strlen() function
gen DistGis=substr(CommGis, 1,4)

destring DistGis, replace


collapse (sum) v2007,by(DistGis)
merge 1:1  DistGis using "${datafilepath}\disrict_`y'(1)"

gen year=`y'
save "${datafilepath}\merged_CDB`y'all", replace

}

* FOR 2018
clear
use "${datafilepath}\CDB2018_vill(1)", clear


collapse (sum) v2 v3     ,by(DistGis)
save "${datafilepath}\disrict_2018(1)",replace


use "${datafilepath}\CDB2019_com(1)", clear
destring CommGis, replace
gen ccc=CommGis
tostring CommGis, replace 
replace CommGis="0"+CommGis if ccc<100000  // // Or use strlen() function
gen DistGis=substr(CommGis, 1,4)
drop ccc


collapse (sum) v2007,by(DistGis)
merge 1:1  DistGis using "${datafilepath}\disrict_2018(1)"


destring DistGis, replace
gen year=2018
save "${datafilepath}\merged_CDB2018all", replace




clear
foreach i of num 2014/2019{
append using "${datafilepath}\merged_CDB`i'all" ,force

}


* DESCRIPTIVE STATISTICS

gen fem_tot=v2 if v2!=.

gen mal_tot=v3 if v3!=.

gen pop_size=fem_tot+mal_tot if v2!=. & v3!=. /* village level */

* Total land area of commune 
gen land_area=v2007 if v2007!=.  /* Commune level  */

gen pop_density=pop_size/land_area
*gen pop_density=pop_sizeC/land_areaC
*br pop_sizeV pop_sizeC pop_density

* Disasters at village level
rename  v1317 stormF
rename v1318 storm
rename v1319 floodF
rename  v1320 flood
rename v1321 droughtF
rename v1322 drought

rename DistGis district_code
drop _merge

save "${datafilepath}\appended_CDB2014-19all", replace

**************************************************************************

use "${datafilepath}\cma2011_19.dta", clear
drop if year<2014

* Assigning IDs for MFIs
tab name,m

gen id_mfi=.

replace id_mfi=1	 if name=="ACLEDA"
replace id_mfi=201	 if name=="ACTIVEPEOPLE" | name=="ActivePeople" 
replace id_mfi=202	 if name=="AEON"
replace id_mfi=243	 if name=="AMATAK" 
replace id_mfi=205	 if name=="AMK"
replace id_mfi=203	 if name=="AMRET"
replace id_mfi=251	 if name=="ANAKUT"
replace id_mfi=204	 if name=="AngkorACE"
replace id_mfi=404	 if name=="ASARD"
replace id_mfi=252	 if name=="AsiaPacific" 
replace id_mfi=278	 if name=="ATOM" 

replace id_mfi=279	 if name=="Baitang"
replace id_mfi=280	 if name=="Bamboo" 
replace id_mfi=236	 if name=="BAYON"
replace id_mfi=309	 if name=="Baytangcredit" | name=="Baitang Micro"
replace id_mfi=253	 if name=="BNKC"
replace id_mfi=237	 if name=="BORRIBO"
replace id_mfi=401	 if name=="BORVOR"
replace id_mfi=245	 if name=="BSPFINANCE"

replace id_mfi=409	 if name=="CAD"
replace id_mfi=281	 if name=="CambodiaLaborCare" | name==	"CambodiaLaorCare"
replace id_mfi=206	 if name=="CamCapital" 
replace id_mfi=209	 if name=="CAMMA"
replace id_mfi=254	 if name=="CapitalRongRoeung"
replace id_mfi=208	 if name=="CBIRD"
replace id_mfi=405	 if name=="CCDA"
replace id_mfi=401	 if name=="CCSF"
replace id_mfi=410	 if name=="CDF"
replace id_mfi=255	 if name=="Cellcard"
replace id_mfi=411	 if name=="CFEO"
replace id_mfi=255	 if name=="Chailease" | name==	"Chailease Royal Finance" | name==	"Chailease Royal Leasing Plc"
replace id_mfi=210	 if name=="CHAMROEUN" 
replace id_mfi=256	 if name=="CHOKCHEY" 
replace id_mfi=239	 if name=="CITY"
replace id_mfi=305	 if name=="cklsfinance"
replace id_mfi=403	 if name=="CMK"
replace id_mfi=304	 if name=="Cred"

replace id_mfi=408	 if name=="DAKO"
replace id_mfi=246	 if name=="DELTA"

replace id_mfi=213	 if name=="EAP"
replace id_mfi=257	 if name=="ELIN" | name=="Elin" 

replace id_mfi=411	 if name=="Family"
replace id_mfi=214	 if name=="FarmerFinance" 
replace id_mfi=258	 if name=="FASMEC"
replace id_mfi=216	 if name=="FirstFinance" 
replace id_mfi=215	 if name=="FUDF"
replace id_mfi=259	 if name=="Funan" 
replace id_mfi=260	 if name=="FUTABA" 

replace id_mfi=217	 if name=="GCMF"
replace id_mfi=275	 if name=="GL"
replace id_mfi=284	 if name=="GoldenCash"
replace id_mfi=261	 if name=="Grow"

replace id_mfi=218	 if name=="HKL"

replace id_mfi=285	 if name=="IDEMITSU" 
replace id_mfi=306	 if name=="iFinance" | name=="iFINANCE" 
replace id_mfi=219	 if name=="IPR"

replace id_mfi=303	 if name=="JCFINANCE"
replace id_mfi=286	 if name=="JetCash"

replace id_mfi=287	 if name=="KBSC"
replace id_mfi=240	 if name=="KEY"
replace id_mfi=220	 if name=="KHEMARAK"
replace id_mfi=288	 if name=="Khmercapital"
replace id_mfi=262	 if name=="KKFund" | name=="KKFUND"
replace id_mfi=212	 if name=="KREDIT"
replace id_mfi=263	 if name=="KroursaEnnatean"

replace id_mfi=264	 if name=="LBP"
replace id_mfi=289	 if name=="LED"
replace id_mfi=231	 if name=="LOLC"
replace id_mfi=242	 if name=="LYHOUR"

replace id_mfi=307	 if name=="MAXCREDIT"
replace id_mfi=222	 if name=="MAXIMA" 
replace id_mfi=265	 if name=="Megaleasing"
replace id_mfi=290	 if name=="MIA"
replace id_mfi=266	 if name=="MOHANOKOR"
replace id_mfi=291	 if name=="MOTHERFINANCIAL"

replace id_mfi=276	 if name=="NCD"
replace id_mfi=247	 if name=="NIRON"
replace id_mfi=226	 if name=="NongHyup" 

replace id_mfi=248	 if name=="ORO"

replace id_mfi=292	 if name=="PGDevelopment"
replace id_mfi=274	 if name=="Pracheacheat"
replace id_mfi=224	 if name=="PRASAC" | name=="Prasac"
replace id_mfi=267	 if name=="Prasethpheap"
replace id_mfi=308	 if name=="PreahChan"
replace id_mfi=225	 if name=="PRIME"
replace id_mfi=268	 if name=="PRINCE"

replace id_mfi=240	 if name=="Queen"

replace id_mfi=245	 if name=="RMA" 
replace id_mfi=295	 if name=="Royal" | name=="ROLYA MICROFINANCE PLC"

replace id_mfi=296	 if name=="SabayCredit" 
replace id_mfi=249	 if name=="SACHAK"
replace id_mfi=269	 if name=="SAHAKA" 
replace id_mfi=270	 if name=="SAHAKRINPHEAP"
replace id_mfi=298	 if name=="SAMBAT"
replace id_mfi=226	 if name=="SAMIC"
replace id_mfi=227	 if name=="SAMRITHISAK"
replace id_mfi=228	 if name=="SATHAPANA"
replace id_mfi=229	 if name=="SEILANITHIH"
replace id_mfi=300	 if name=="SereyOudom"
replace id_mfi=230	 if name=="SONATRA"

replace id_mfi=250	 if name=="TACA" | name=="BAMC(TACA)"
replace id_mfi=271	 if name=="TBB"
replace id_mfi=301	 if name=="TGO"
replace id_mfi=231	 if name=="TPC"
replace id_mfi=302	 if name=="TROPKHNOM"

replace id_mfi=402	 if name=="VDA"
replace id_mfi=233	 if name=="VisionFund"
replace id_mfi=272	 if name=="VITHEY"

replace id_mfi=233	 if name=="WBfinance" | name==	"Wbfinance"
replace id_mfi=217	 if name=="WELCOME"
replace id_mfi=221	 if name=="Woori" | name=="MALIS" 
replace id_mfi=234	 if name=="YCP"

tab id_mfi,m   /* 194 missing for both name and id_mfi */
drop if id_mfi==.

destring district_code,replace

merge m:1 district_code year using  "${datafilepath}\appended_CDB2014-19all"
drop if _merge!=3   
drop _merge


merge m:1 id_mfi year using  "${datafilepath}\asset_liq_mfi-nbc"
drop if _merge!=3   
drop _merge

save "${datafilepath}\cleaned_merged2011_19.dta", replace


