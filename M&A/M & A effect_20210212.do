

****************
***************
****************
/*
PROJECT TITLE: FINANCIAL INCLUSION IN CAMBODIA
PROJECT LEADER: Dr. Aiba Daiju
RESEARCH ASSISTANT: Hailegabriel Abebe Fenta

*/

******

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
use "cma2011_19.dta", clear

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

gen merg_acq=(id_mfi==201 | id_mfi==206 | id_mfi==210 | id_mfi==214 | id_mfi==216 | id_mfi==221 | id_mfi==222 | id_mfi==226 | id_mfi==243 | id_mfi==245 | id_mfi==252 | id_mfi==256 | id_mfi==259 | id_mfi==260 | id_mfi==269 | id_mfi==278 | id_mfi==280 | id_mfi==285 |id_mfi==296)

tab merg_acq,m


merge m:1 district_code year using  "appended_CDB2014-19all"
drop if _merge!=3   
drop _merge


*collapse (sum) amount_loan total_num_borrowers pop_size,  by(district_code year id_mfi)

* Descriptive statistics

destring district_code, replace

gen log_loan=log(amount_loan)
gen log_borr=log(total_num_borrowers)
gen log_loan_borr=log(loan_size)
gen log_pop=log(pop_density)

gen log_storm=log(storm)
gen log_flood=log(flood)
gen log_drought=log(drought)

sum amount_loan total_num_borrowers loan_size merg_acq pop_density storm flood drought 
sum log_loan log_borr log_loan_borr log_pop log_storm log_flood log_drought

* Generating merger and acquisition (M&A) Dummy

gen popXma=log_pop*merg_acq


* Regression Analysis
local y log_loan log_borr log_loan_borr

foreach y in `y' {
qui reg `y' merg_acq log_pop popXma i.district_code i.id_mfi i.year, cluster(district_code)
estimates store a1_`y'
local output1 `output1' a1_`y'
}
estimates table `output1', keep(merg_acq log_pop popXma) b(%9.3f) se(%9.3f) stats(r2_a N)

* Controlling for disaster factors

local y log_loan log_borr log_loan_borr

foreach y in `y' {
qui reg `y' merg_acq log_pop popXma log_storm log_flood log_drought i.district_code i.id_mfi i.year, cluster(district_code)
estimates store a2_`y'
local output2 `output2' a2_`y'
}
estimates table `output2', keep(merg_acq log_pop popXma log_storm log_flood log_drought) b(%9.3f) se(%9.3f) stats(r2_a N)




