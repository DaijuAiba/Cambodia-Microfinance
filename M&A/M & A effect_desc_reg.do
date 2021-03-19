
clear matrix
clear mata
set emptycells drop 
cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
use "cleaned_merged2011_19.dta", clear


*********************************************************************
/* DESCRIPTIVE AND REGRESSIONAL ANALYSIS ON MFIs' M&A EFFECT */
*********************************************************************

/* GENERATING VARIABLES */

* M&A indicator from MFIs webpage and financial reports

gen MA0=0
replace MA0=1 if id_mfi==201 & year>=2011
replace MA0=1 if id_mfi==202 & year>=2016
replace MA0=1 if id_mfi==203 & year>=2015
replace MA0=1 if id_mfi==204 & year>=2010
replace MA0=1 if id_mfi==205 & year>=2018
replace MA0=1 if id_mfi==206 & year>=2012
replace MA0=1 if id_mfi==210 & year>=2018
replace MA0=1 if id_mfi==212 & year>=2019

replace MA0=1 if id_mfi==214 & year>=2017
replace MA0=1 if id_mfi==216 & year>=2009
replace MA0=1 if id_mfi==217 & year>=2016

replace MA0=1 if id_mfi==218 & year>=2016
replace MA0=1 if id_mfi==221 & year>=2018

replace MA0=1 if id_mfi==222 & year>=2014

replace MA0=1 if id_mfi==223 & year>=2014
replace MA0=1 if id_mfi==224 & year>=2017

replace MA0=1 if id_mfi==226 & year>=2018
replace MA0=1 if id_mfi==228 & year>=2015

replace MA0=1 if id_mfi==231 & year>=2017
replace MA0=1 if id_mfi==242 & year>=2019
replace MA0=1 if id_mfi==243 & year>=2013

replace MA0=1 if id_mfi==245 & year>=2017

replace MA0=1 if id_mfi==248 & year>=2013

replace MA0=1 if id_mfi==252 & year>=2015
replace MA0=1 if id_mfi==256 & year>=2017
replace MA0=1 if id_mfi==259 & year>=2017
replace MA0=1 if id_mfi==260 & year>=2016
replace MA0=1 if id_mfi==269 & year>=2011
replace MA0=1 if id_mfi==271 & year>=2015

replace MA0=1 if id_mfi==278 & year>=2016
replace MA0=1 if id_mfi==279 & year>=2016
replace MA0=1 if id_mfi==280 & year>=2015
replace MA0=1 if id_mfi==285 & year>=2016
replace MA0=1 if id_mfi==291 & year>=2015
replace MA0=1 if id_mfi==301 & year>=2017

tab MA0,m
sum MA0

* M&A indicator from MFI-NBC data
gen MA1=(foreign_share>0.0)
gen MA2=(foreign_share>=0.5)
gen MA3=foreign_share

sum MA0 MA1 MA2 MA3

/*
bys year: egen shareY=mean(foreign_share)
g change_share=shareY[_n]-shareY[_n-1]
bys id_mfi year: egen share=mean(change_share)
tab share if share>0 
br id_mfi year share
tabulate change_share id_mfi
g change_share=share[_n]-share[_n-1]
br id_mfi year foreign_share share change_share
*/

* Asset
rename m_asset1 total_asset
rename m_asset2 cash_bal

*Equity
rename m_liability11 paidup_cap
rename m_liability12 premium
rename m_liability13 hybrid_cap
rename m_liability14 reserves
rename m_liability15 retained

gen hybrid=hybrid_cap

browse if missing(real(hybrid_cap))
destring hybrid_cap, replace force 

*LIABILITY
rename m_liability4 interest_payment
rename m_liability1 total_liabLiq
rename m_operation2 int_exp


gen cap_asset=paidup_cap/total_asset
gen cash_asset=cash_bal/total_asset
gen retained_asset=retained/total_asset
gen equity1 = paidup_cap + premium + hybrid_cap + reserves + retained
gen equity2 = paidup_cap + retained
gen equity1_asset=equity1/total_asset
gen equity2_asset=equity2/total_asset
gen liability=total_liabLiq-equity1
destring int_exp, replace force
gen fundingP=int_exp/liability


destring district_code, replace

gen loan=amount_loan
replace loan=0 if amount_loan==.
drop amount_loan
rename loan amount_loan
gen log_loan=log(amount_loan)
gen log_borr=log(total_num_borrowers)
gen log_loan_borr=log(loan_size)
gen borr_f=num_female_loan/total_num_borrowers
gen log_borr_f=log(borr_f)


gen pop_density=pop_sizeC/land_areaC
br pop_sizeC land_areaC pop_density
gen log_popS=log(pop_sizeC)
gen log_popD=log(pop_density)

* Disastor indicators using number of persons affected
gen stormD=(storm!=0)
gen floodD=(flood!=0)
gen droughtD=(drought!=0)
gen disasterD=(storm!=0 | flood!=0 | drought!=0)

* Disastor indicators using number of families affected
gen stormDf=(stormF!=0)
gen floodDf=(floodF!=0)
gen droughtDf=(droughtF!=0)
gen disasterDf=(stormF!=0 | floodF!=0 | droughtF!=0)


/* DESCRIPTIVE ANALYSIS */

sum amount_loan total_num_borrowers borr_f loan_size MA0 MA1 MA2 MA3 pop_sizeC pop_density stormD floodD droughtD stormDf floodDf droughtDf disasterD disasterDf equity1_asset equity2_asset cap_asset cash_asset retained_asset fundingP year

bys year MA1: tabstat amount_loan
bys year MA2: tabstat amount_loan
bys year MA1: tabstat log_loan
bys year MA2: tabstat log_loan


tabstat foreign_share, by(year) stat(mean sd min max) nototal long format


cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"
bys year: egen loan_ma10=mean(amount_loan) if MA1==0
bys year: egen loan_ma11=mean(amount_loan) if MA1==1
bys year: egen loan_ma20=mean(amount_loan) if MA2==0
bys year: egen loan_ma21=mean(amount_loan) if MA2==1

line loan_ma10 loan_ma11 loan_ma20 loan_ma21 year, sort(year) title("Loan Amount by Period and M&A Status", size(medium)) ///
xtitle("Year", size(medium)) ytitle("Loan amount in KHR", size(medium)) ///
legend(pos(12) ring(0) col(1) lab(1 "MFIs with 0% foreign share") lab(2 "MFIs with > 0% foreign share ") lab(3 "MFIs with <50% foreign share") lab(4 "MFIs with >=50% foreign share")) scheme(s2mono)
graph save "loan_trend_ma1_ma2.gph", replace
graph export loan_trend_ma1_ma2.png, replace

* Using logarithm

bys year: egen loanL_ma10=mean(log_loan) if MA1==0
bys year: egen loanL_ma11=mean(log_loan) if MA1==1
bys year: egen loanL_ma20=mean(log_loan) if MA2==0
bys year: egen loanL_ma21=mean(log_loan) if MA2==1

line loanL_ma10 loanL_ma11 loanL_ma20 loanL_ma21 year, sort(year) title("Loan Amount by Period and M&A Status", size(medium)) ///
xtitle("Year", size(medium)) ytitle("log of Loan amount in KHR", size(medium)) ///
legend(pos(3) ring(0) col(1) lab(1 "MFIs with 0% foreign share") lab(2 "MFIs with > 0% foreign share ") lab(3 "MFIs with <50% foreign share") lab(4 "MFIs with >=50% foreign share")) scheme(s2mono)
graph save "loan_trendL_ma1_ma2.gph", replace
graph export loan_trendL_ma1_ma2.png, replace

bys year: egen m_foreign=mean(foreign_share)
line m_foreign year, sort(year) title("Foreign Share by Period", size(medium)) xtitle("Year", size(medium)) ytitle("Foreign share", size(medium)) 
graph save "foreignSH.gph", replace
graph export foreignSH.png, replace

/* REGRESSIONAL ANALYSIS */

* Generating interactions of merger and acquisition (M&A) Dummy with pop density, storm, flood, and drought

foreach m in 0 1 2 3 {
gen popSXma`m'=log_popS*MA`m'
gen popDXma`m'=log_popD*MA`m'
gen stormXma`m'=stormD*MA`m'
gen floodXma`m'=floodD*MA`m'
gen droughtXma`m'=droughtD*MA`m'
gen stormFXma`m'=stormDf*MA`m'
gen floodFXma`m'=floodDf*MA`m'
gen droughtFXma`m'=droughtDf*MA`m'
gen disasterXma`m'=disasterD*MA`m'
gen disasterFXma`m'=disasterDf*MA`m'
}

* Regression Analysis
local y log_loan log_borr log_loan_borr log_borr_f
local cov  equity2_asset cash_asset fundingP

* log_popS log_popD stormDf floodDf droughtDf disasterD disasterDf

foreach y in `y' {
	foreach m in 0 1 2 3 {
qui reg `y' MA`m' `cov' i.id_mfi i.district_code#i.year, cluster(district_code)
estimates store a1_`y'`m'
local output1 `output1' a1_`y'`m'
}
}
estimates table `output1', keep(MA0 MA1 MA2 MA3 `cov') b(%9.3f) se(%9.3f) stats(r2_a N)
*estimates table `output1', keep(MA0 MA1 MA2 MA3 `cov') star(.10 .05 .01) stats(r2_a N)

**********************************************************
local y log_loan log_borr log_loan_borr log_borr_f
local cov  equity2_asset cash_asset fundingP

foreach y in `y' {
	foreach m in 0 1 2 3 {
qui reg `y' MA`m' popSXma`m' popDXma`m' disasterFXma`m' floodFXma`m' droughtFXma`m' `cov' i.id_mfi i.district_code#i.year, cluster(district_code)
estimates store a1_`y'`m'
local output1 `output1' a1_`y'`m'
}
}
estimates table `output1', keep(MA0 MA1 MA2 MA3 popSXma0 popSXma1 popSXma2 popSXma3 popDXma0 popDXma1 popDXma2 popDXma3 disasterFXma0 disasterFXma1 disasterFXma2 disasterFXma3 `cov') b(%9.3f) se(%9.3f) stats(r2_a N)
*estimates table `output1', keep(MA0 MA1 MA2 MA3 popSXma0 popSXma1 popSXma2 popSXma3 popDXma0 popDXma1 popDXma2 popDXma3 disasterFXma0 disasterFXma1 disasterFXma2 disasterFXma3 `cov') star(.10 .05 .01) stats(r2_a N)

