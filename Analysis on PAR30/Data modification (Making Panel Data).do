

//============================


cd "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata"


use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2019q3-q4.dta" ,clear
destring  amount_loan par_30 ratio_par_30 ratio_write_off reschedule_loan ratio_reschedule_loan,replace force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2019q3SATHAPANA.dta",force
ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2019q4SATHAPANA.dta",force
ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2019q3ACLEDA.dta",force
ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2019q4ACLEDA.dta",force



ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q2\2019q2.dta" ,force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q1\2019q1.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2018q4\2018q4.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2018q3\2018q3.dta" , force


ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2018q2\2018q2.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2018q1\2018q1.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2017q4\2017q4.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2017q3\2017q3.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2017q2\2017q2.dta" , force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2017q1\2017q1.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2016q4\2016q4.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2016q3\2016q3.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2016q2\2016q2.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2016q1\2016q1.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2015q4\2015q4.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2015q3\2015q3.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2015q2\2015q2.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2015q1\2015q1.dta", force

ap using "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2014q4\2014q4.dta", force

	
			
replace MFI_id =	1	 if name==	"ACLEDA"
replace MFI_id =	201	 if name==	"ActivePeople"
replace MFI_id =	202	 if name==	"AEON"
replace MFI_id =	243	 if name==	"AMATAK"
replace MFI_id =	205	 if name==	"AMK"
replace MFI_id =	203	 if name==	"AMRET"
replace MFI_id =	251	 if name==	"ANAKUT"
replace MFI_id =	204	 if name==	"AngkorACE"
replace MFI_id =	404	 if name==	"ASARD"
replace MFI_id =	252	 if name==	"AsiaPacific"
replace MFI_id =	278	 if name==	"ATOM"
replace MFI_id =	279	 if name==	"Baitang"
replace MFI_id =	280	 if name==	"Bamboo"
replace MFI_id =	236	 if name==	"BAYON"
replace MFI_id =	309	 if name==	"Baytangcredit"
replace MFI_id =	253	 if name==	"BNKC"
replace MFI_id =	237	 if name==	"BORRIBO"
replace MFI_id =	401	 if name==	"BORVOR"
replace MFI_id =	245	 if name==	"BSPFINANCE"
replace MFI_id =	412	 if name==	"CAD"
replace MFI_id =	281	 if name==	"CambodiaLaborCare"
replace MFI_id =	209	 if name==	"CAMMA"
replace MFI_id =	254	 if name==	"CapitalRongRoeung"
replace MFI_id =	405	 if name==	"CCDA"
replace MFI_id =	401	 if name==	"CCSF"
replace MFI_id =	410	 if name==	"CDF"
replace MFI_id =	255	 if name==	"Cellcard"
replace MFI_id =	411	 if name==	"CFEO"
replace MFI_id =	255	 if name==	"Chailease"
replace MFI_id =	210	 if name==	"CHAMROEUN"
replace MFI_id =	256	 if name==	"CHOKCHEY"
replace MFI_id =	239	 if name==	"CITY"
replace MFI_id =	305	 if name==	"cklsfinance"
replace MFI_id =	403	 if name==	"CMK"
replace MFI_id =	304	 if name==	"Cred"
replace MFI_id =	408	 if name==	"DAKO"
replace MFI_id =	246	 if name==	"DELTA"
replace MFI_id =	213	 if name==	"EAP"
replace MFI_id =	257	 if name==	"ELIN"
replace MFI_id =	411	 if name==	"Family"
replace MFI_id =	214	 if name==	"FarmerFinance"
replace MFI_id =	258	 if name==	"FASMEC"
replace MFI_id =	216	 if name==	"FirstFinance"
replace MFI_id =	215	 if name==	"FUDF"
replace MFI_id =	259	 if name==	"Funan"
replace MFI_id =	260	 if name==	"FUTABA"
replace MFI_id =	217	 if name==	"GCMF"
replace MFI_id =	275	 if name==	"GL"
replace MFI_id =	284	 if name==	"GoldenCash"
replace MFI_id =	261	 if name==	"Grow"
replace MFI_id =	218	 if name==	"HKL"
replace MFI_id =	285	 if name==	"IDEMITSU"
replace MFI_id =	306	 if name==	"iFinance"
replace MFI_id =	219	 if name==	"IPR"
replace MFI_id =	303	 if name==	"JCFINANCE"
replace MFI_id =	286	 if name==	"JetCash"
replace MFI_id =	287	 if name==	"KBSC"
replace MFI_id =	240	 if name==	"KEY"
replace MFI_id =	220	 if name==	"KHEMARAK"
replace MFI_id =	288	 if name==	"Khmercapital"
replace MFI_id =	262	 if name==	"KKFund"
replace MFI_id =	262	 if name==	"KKFUND"
replace MFI_id =	212	 if name==	"KREDIT"
replace MFI_id =	263	 if name==	"KroursaEnnatean"
replace MFI_id =	264	 if name==	"LBP"
replace MFI_id =	289	 if name==	"LED"
replace MFI_id =	231	 if name==	"LOLC"
replace MFI_id =	242	 if name==	"LYHOUR"
replace MFI_id =	307	 if name==	"MAXCREDIT"
replace MFI_id =	222	 if name==	"MAXIMA"
replace MFI_id =	265	 if name==	"Megaleasing"
replace MFI_id =	290	 if name==	"MIA"
replace MFI_id =	266	 if name==	"MOHANOKOR"
replace MFI_id =	291	 if name==	"MOTHERFINANCIAL"
replace MFI_id =	276	 if name==	"NCD"
replace MFI_id =	247	 if name==	"NIRON"
replace MFI_id =	226	 if name==	"NongHyup"
replace MFI_id =	248	 if name==	"ORO"
replace MFI_id =	292	 if name==	"PGDevelopment"
replace MFI_id =	274	 if name==	"Pracheacheat"
replace MFI_id =	224	 if name==	"PRASAC"
replace MFI_id =	267	 if name==	"Prasethpheap"
replace MFI_id =	308	 if name==	"PreahChan"
replace MFI_id =	225	 if name==	"PRIME"
replace MFI_id =	268	 if name==	"PRINCE"
replace MFI_id =	240	 if name==	"Queen"
replace MFI_id =	245	 if name==	"RMA"
replace MFI_id =	295	 if name==	"Royal"
replace MFI_id =	249	 if name==	"SACHAK"
replace MFI_id =	269	 if name==	"SAHAKA"
replace MFI_id =	270	 if name==	"SAHAKRINPHEAP"
replace MFI_id =	298	 if name==	"SAMBAT"
replace MFI_id =	226	 if name==	"SAMIC"
replace MFI_id =	227	 if name==	"SAMRITHISAK"
replace MFI_id =	228	 if name==	"SATHAPANA"
replace MFI_id =	229	 if name==	"SEILANITHIH"
replace MFI_id =	300	 if name==	"SereyOudom"
replace MFI_id =	230	 if name==	"SONATRA"
replace MFI_id =	250	 if name==	"TACA"
replace MFI_id =	271	 if name==	"TBB"
replace MFI_id =	301	 if name==	"TGO"
replace MFI_id =	231	 if name==	"TPC"
replace MFI_id =	302	 if name==	"TROPKHNOM"
replace MFI_id =	402	 if name==	"VDA"
replace MFI_id =	233	 if name==	"VisionFund"
replace MFI_id =	272	 if name==	"VITHEY"
replace MFI_id =	233	 if name==	"WBfinance"
replace MFI_id =	217	 if name==	"WELCOME"
replace MFI_id =	221	 if name==	"Woori"
replace MFI_id =	234	 if name==	"YCP"




destring district_code,replace force

gen period = quarterly(time, "YQ")


gen Type=.
replace Type=3 
replace Type=1 if MFI_id==1 | MFI_id==228
replace Type=2 if MFI_id==233 |  MFI_id==205 | MFI_id== 203 | MFI_id==231 | MFI_id==218 | MFI_id==231| MFI_id==212


drop if MFI_id==. 


tostring district_code, gen(district)
replace district= "0" + district if district_code<1000
gen Province_code=substr(district,1,2) 

keep time MFI_id name district_code district district_name num_commune num_village num_office type_operation amount_loan par_30 ratio_par_30 write_off ratio_write_off reschedule_loan ratio_reschedule_loan num_male_loan num_female_loan total_num_borrowers amount_deposit num_male_deposits num_female_deposits total_num_depositors num_staff_male num_staff_female total_staff  amount_loan_large num_male_loan_large num_female_loan_large total_num_borrowers_large  period Type Province_code


save "CMA-NIX 2014q4-2019q4",replace 

use "C:\Users\a0841\OneDrive\Canmbodia study\Study (Cambodian Microfinance)\CMAdata\2019q3-\2020q1-",clear

destring district_code,replace

drop if district_code==.
gen MFI_id=.
			
replace MFI_id=  1 if  RecodeFSPName==	"ACLEDA"
replace MFI_id=	201	if  RecodeFSPName==	"Active People"
replace MFI_id=	202	if  RecodeFSPName==	"AEON"
replace MFI_id=	311	if  RecodeFSPName==	"AMATAK"
replace MFI_id=	205	if  RecodeFSPName==	"AMK"
replace MFI_id=	203	if  RecodeFSPName==	"AMRET"
replace MFI_id=	251	if  RecodeFSPName==	"ANAKUT"
replace MFI_id=	252	if  RecodeFSPName==	"Asia Pacific"
replace MFI_id=	278	if  RecodeFSPName==	"ATOM"
replace MFI_id=	279	if  RecodeFSPName==	"Baitang Microheranhvatho"
replace MFI_id=	280	if  RecodeFSPName==	"Bamboo"
replace MFI_id=	313	if  RecodeFSPName==	"BAMC"
replace MFI_id=	236	if  RecodeFSPName==	"BAYON"
replace MFI_id=	253	if  RecodeFSPName==	"BNKC"
replace MFI_id=	237	if  RecodeFSPName==	"BORRIBO"
replace MFI_id=	401	if  RecodeFSPName==	"BORVOR"
replace MFI_id=	312	if  RecodeFSPName==	"BSP Finance"
replace MFI_id=	206	if  RecodeFSPName==	"Cam Capital"
replace MFI_id=	281	if  RecodeFSPName==	"Cambodia Labor Care"
replace MFI_id=	209	if  RecodeFSPName==	"CAMMA"
replace MFI_id=	255	if  RecodeFSPName==	"Chailease Royal Leasing"
replace MFI_id=	210	if  RecodeFSPName==	"CHAMROEUN"
replace MFI_id=	256	if  RecodeFSPName==	"CHOKCHEY"
replace MFI_id=	239	if  RecodeFSPName==	"City"
replace MFI_id=	239	if  RecodeFSPName==	"CITY"
replace MFI_id=	305	if  RecodeFSPName==	"CKLS Finance"
replace MFI_id=	403	if  RecodeFSPName==	"CMK"
replace MFI_id=	304	if  RecodeFSPName==	"CRED"
replace MFI_id=	304	if  RecodeFSPName==	"CRED "
replace MFI_id=	317	if  RecodeFSPName==	"Daikou"
replace MFI_id=	408	if  RecodeFSPName==	"DAKO"
replace MFI_id=	246	if  RecodeFSPName==	"DELTA"
replace MFI_id=	213	if  RecodeFSPName==	"EAP"
replace MFI_id=	411	if  RecodeFSPName==	"Family"
replace MFI_id=	214	if  RecodeFSPName==	"Farmer Finance"
replace MFI_id=	258	if  RecodeFSPName==	"FASMEC"
replace MFI_id=	216	if  RecodeFSPName==	"First Finance"
replace MFI_id=	259	if  RecodeFSPName==	"FUNAN"
replace MFI_id=	260	if  RecodeFSPName==	"FUTABA"
replace MFI_id=	319	if  RecodeFSPName==	"GB"
replace MFI_id=	284	if  RecodeFSPName==	"Golden Cash"
replace MFI_id=	261	if  RecodeFSPName==	"GROW"
replace MFI_id=	261	if  RecodeFSPName==	"GROW "
replace MFI_id=	218	if  RecodeFSPName==	"Hattha"
replace MFI_id=	285	if  RecodeFSPName==	"IDEMITSU"
replace MFI_id=	306	if  RecodeFSPName==	"iFinance"
replace MFI_id=	219	if  RecodeFSPName==	"IPR"
replace MFI_id=	303	if  RecodeFSPName==	"JC Finacne"
replace MFI_id=	286	if  RecodeFSPName==	"Jet Cash"
replace MFI_id=	288	if  RecodeFSPName==	"Khmer Capital"
replace MFI_id=	262	if  RecodeFSPName==	"KK Fund"
replace MFI_id=	263	if  RecodeFSPName==	"Kroursa Ennatean"
replace MFI_id=	314	if  RecodeFSPName==	"Kubota"
replace MFI_id=	264	if  RecodeFSPName==	"LBP"
replace MFI_id=	289	if  RecodeFSPName==	"LED"
replace MFI_id=	231	if  RecodeFSPName==	"LOLC"
replace MFI_id=	242	if  RecodeFSPName==	"LYHOUR"
replace MFI_id=	222	if  RecodeFSPName==	"MAXIMA"
replace MFI_id=	265	if  RecodeFSPName==	"MEGA Leasing"
replace MFI_id=	290	if  RecodeFSPName==	"MIA"
replace MFI_id=	316	if  RecodeFSPName==	"Mobility"
replace MFI_id=	266	if  RecodeFSPName==	"MOHANOKOR"
replace MFI_id=	291	if  RecodeFSPName==	"MOTHER Financial"
replace MFI_id=	247	if  RecodeFSPName==	"NIRON"
replace MFI_id=	226	if  RecodeFSPName==	"Nong Hyup"
replace MFI_id=	248	if  RecodeFSPName==	"ORO"
replace MFI_id=	292	if  RecodeFSPName==	"PG Development"
replace MFI_id=	212	if  RecodeFSPName==	"PHILLIP"
replace MFI_id=	212	if  RecodeFSPName==	"Phillip"
replace MFI_id=	224	if  RecodeFSPName==	"PRASAC"
replace MFI_id=	274	if  RecodeFSPName==	"Prasethpheap"
replace MFI_id=	308	if  RecodeFSPName==	"Preah Chan"
replace MFI_id=	225	if  RecodeFSPName==	"PRIME"
replace MFI_id=	240	if  RecodeFSPName==	"Queen"
replace MFI_id=	295	if  RecodeFSPName==	"ROYAL"
replace MFI_id=	296	if  RecodeFSPName==	"Sabay Credit"
replace MFI_id=	249	if  RecodeFSPName==	"SACHAK"
replace MFI_id=	269	if  RecodeFSPName==	"SAHAKA"
replace MFI_id=	270	if  RecodeFSPName==	"SAHAKRINPHEAP"
replace MFI_id=	298	if  RecodeFSPName==	"SAMBAT"
replace MFI_id=	227	if  RecodeFSPName==	"SAMRITHISAK"
replace MFI_id=	228	if  RecodeFSPName==	"SATHAPANA"
replace MFI_id=	229	if  RecodeFSPName==	"SEILANITHIH"
replace MFI_id=	300	if  RecodeFSPName==	"Serey Oudom"
replace MFI_id=	230	if  RecodeFSPName==	"SONATRA"
replace MFI_id=	301	if  RecodeFSPName==	"T&GO"
replace MFI_id=	271	if  RecodeFSPName==	"TBB"
replace MFI_id=	302	if  RecodeFSPName==	"Trop Khnom"
replace MFI_id=	272	if  RecodeFSPName==	"VITHEY"
replace MFI_id=	233	if  RecodeFSPName==	"WB Finance"
replace MFI_id=	217	if  RecodeFSPName==	"WELCOME"
replace MFI_id=	234	if  RecodeFSPName==	"YCP"
replace MFI_id= 320 if  RecodeFSPName=="ROLYA"

tab MFI_id,missing

tostring district_code, gen(district)
replace district= "0" + district if district_code<1000
gen Province_code=substr(district,1,2) 



gen Type=.
replace Type=1 if FSPType=="1.Bank"      
replace Type=2 if FSPType=="2.MDI"      
replace Type=3 if FSPType=="3.MFI"  
replace Type=4 if FSPType=="4.Leasing"      
replace Type=5 if FSPType=="5.RCI" 

save "CMA-NIX 2020q1-",replace 



use "CMA-NIX 2020q1-",clear

duplicates tag district_code MFI_id period Scale, generate(newvar)
sort newvar MFI_id district_code MFI_id period  
order newvar MFI_id district_code  period Scale  type_operation amount_loan
drop if district_code ==810 &  MFI_id==228 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==1904 &  MFI_id==228 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2201 &  MFI_id==228 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2204 &  MFI_id==228 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2205 &  MFI_id==228 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2204 &  MFI_id==236 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2107 &  MFI_id==259 &  period==tq(2020q2) & amount_loan<26 & Scale=="Small"
drop if district_code ==2204 &  MFI_id==316 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if district_code ==2204 &  MFI_id==213 &  period==tq(2020q3) & amount_loan==0 & Scale=="Small"
drop if MFI_id==270 &  period==tq(2020q3) &  amount_loan==0 
drop if MFI_id==270 &  period==tq(2020q2) &  amount_loan==0 
drop if MFI_id==270 &  period==tq(2020q2) &  amount_loan<100 & newvar==1 
drop if district_code ==1710 & MFI_id==270 &  period==tq(2020q2) &  total_num_borrowers==1


duplicates list district_code MFI_id period Scale





save "CMA-NIX 2020q1-(1)",replace

use "CMA-NIX 2020q1-(1)",clear
keep if Scale=="Large"

. rename total_num_borrowers total_num_borrowers_large

. rename amount_loan amount_loan_large
  rename num_female_loan num_female_loan_large

. rename num_male_loan num_male_loan_large

rename par_30  par_30_large
rename write_off write_off_large
rename reschedule_loan reschedule_loan_large



keep district_code MFI_id period total_num_borrowers_large amount_loan_large num_female_loan_large num_male_loan_large par_30_large write_off_large reschedule_loan_large num_male_loan_large num_female_loan_large
merge 1:m district_code MFI_id period using "CMA-NIX 2020q1-(1)"
drop if Scale=="Large"
drop _merge

save "CMA-NIX 2020q1-(2)",replace 

use "CMA-NIX 2014q4-2019q4",clear

rename name mfi_name

ap using "CMA-NIX 2020q1-(2)",force


destring Province_code,replace
format period %tq
foreach i in total_num_borrowers_large amount_loan_large num_female_loan_large num_male_loan_large par_30_large write_off_large reschedule_loan_large num_male_loan_large num_female_loan_large{
	replace `i'=0 if `i'==.
}


gen Type2=.
replace Type2=3 
replace Type2=1 if MFI_id==1 | MFI_id==228
replace Type2=2 if MFI_id==233 |  MFI_id==205 | MFI_id== 203 | MFI_id==231 | MFI_id==218 | MFI_id==231| MFI_id==212




drop Scale
save "Panel Data",replace

. export delimited using "Panel Data (CMA-NIX 2014-2020)", replace


