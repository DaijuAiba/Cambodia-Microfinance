

cd "G:\My Drive\cma_nix\Disaster_HH finance\Disaster_since202204"

use ".\GPCC2019pp.dta", clear
merge m:1 comm_code using "disaster2011_comm"
drop _merge

merge m:1 comm_code using loan_2011flood2
drop _merge

gen exposedD=(no_floodF!=0) if no_floodF!=.

gen exposedR=no_floodF/no_familiesV

gen exposedR2=no_floodF/no_familiesV
replace exposedR2=. if no_floodF==0

gen expDXloanR=exposedD*Ratio_LoanTOhhs
gen expRXloanR=exposedR*Ratio_LoanTOhhs
gen expR2XloanR=exposedR2*Ratio_LoanTOhhs
gen expDXloanD=exposedD*loan_status
gen expRXloanD=exposedR*loan_status
gen expR2XloanD=exposedR2*loan_status

gen age2=age^2

sum no_floodF GrantUSD loan_status no_familiesV Ratio_LoanTOhhs Ratio_Loan_staTOhhs exposedD exposedR exposedR2

***********************************************************************
local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
reg `y' exposedD Ratio_LoanTOhhs expDXloan `covars' if age>18, cluster(comm_code)
estimates store `y'	
}
estimates table `depvar', keep(exposedD Ratio_LoanTOhhs expDXloan `covars') b(%9.5f) se(%9.5f) stats(r2_a N)

**********************************************************************

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
reg `y' exposedR Ratio_LoanTOhhs expRXloanR `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR Ratio_LoanTOhhs expRXloanR `covars') b(%9.4f) se(%9.4f) stats(r2_a N)

************************************************************************

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR2 Ratio_LoanTOhhs expR2XloanR `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR2 Ratio_LoanTOhhs expR2XloanR `covars') b(%9.4f) se(%9.4f) stats(r2_a N)

*********************************************************************
encode comm_code, gen(comm_code1)
gen dist_code=substr(comm_code, 1,4)
encode dist_code, gen(dist_code1)
gen ceb_3more=(ceb>=3 & ceb<=25) if ceb!=.

*******************************************************************
/* Dummy Loan   */
*******************************************************************
local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
reg `y' exposedD loan_status expDXloanD `covars' if age>18, cluster(comm_code)
estimates store `y'	
}
estimates table `depvar', keep(exposedD loan_status expDXloanD `covars') b(%9.5f) se(%9.5f) stats(r2_a N)

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
reg `y' exposedR loan_status expRXloanD `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR loan_status expRXloanD `covars') b(%9.4f) se(%9.4f) stats(r2_a N)


local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR2 loan_status expR2XloanD `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR2 loan_status expR2XloanD `covars') b(%9.4f) se(%9.4f) stats(r2_a N)
*******************************************************************


/* Restricting to those districts having communes with affected families   */
*********************************************************************
drop exposedD exposedR exposedR2 expDDXloanR expRXloan expR2XloanR expDXloan expRXloanD expR2XloanD
drop exposedD exposedR exposedR2 expDXloan expRXloanR expR2XloanR expDDXloan expR2DXloanR expDXloanD expRXloanD expR2XloanD


drop if dist_code=="0106" | dist_code=="0110" | dist_code=="0204" | dist_code=="0205" | dist_code=="0211" | dist_code=="0302" | dist_code=="0304" | dist_code=="0307" | dist_code=="0401" | dist_code=="0402" | dist_code=="0403" | dist_code=="0404" | dist_code=="0408" | dist_code=="0501" | dist_code=="0502" | dist_code=="0503" | dist_code=="0504" | dist_code=="0505" | dist_code=="0506" | dist_code=="0507" | dist_code=="0508" | dist_code=="0603" | dist_code=="0605" | dist_code=="0701" | dist_code=="0703" | dist_code=="0707" | dist_code=="0708" | dist_code=="0805" | dist_code=="0809" | dist_code=="0901" | dist_code=="0902" | dist_code=="0903" | dist_code=="0904" | dist_code=="0905" | dist_code=="0906" | dist_code=="0907" | dist_code=="1102" | dist_code=="1103" | dist_code=="1104" | dist_code=="1105" | dist_code=="1307" | dist_code=="1308" | dist_code=="1406" | dist_code=="1407" | dist_code=="1411" | dist_code=="1601" | dist_code=="1602" | dist_code=="1603" | dist_code=="1604" | dist_code=="1605" | dist_code=="1606" | dist_code=="1607" | dist_code=="1608" | dist_code=="1714" | dist_code=="1801" | dist_code=="1803" | dist_code=="1804" | dist_code=="1903" | dist_code=="1904" | dist_code=="2002" | dist_code=="2008" | dist_code=="2202" | dist_code=="2204" | dist_code=="2301" | dist_code=="2302" 


gen exposedD=(no_floodF!=0) if no_floodF!=.

gen exposedR=no_floodF/no_familiesV

gen exposedR2=no_floodF/no_familiesV
replace exposedR2=. if no_floodF==0

gen expDXloanR=exposedD*Ratio_LoanTOhhs
gen expRXloanR=exposedR*Ratio_LoanTOhhs
gen expR2XloanR=exposedR2*Ratio_LoanTOhhs
gen expDXloanD=exposedD*loan_status
gen expRXloanD=exposedR*loan_status
gen expR2XloanD=exposedR2*loan_status
	
**************************************************************
local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedD Ratio_LoanTOhhs expDXloanR `covars' if age>18, cluster(comm_code)
estimates store `y'	
}
estimates table `depvar', keep(exposedD Ratio_LoanTOhhs expDXloanR `covars') b(%9.5f) se(%9.5f) stats(r2_a N)

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR Ratio_LoanTOhhs expRXloanR `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR Ratio_LoanTOhhs expRXloanR `covars') b(%9.4f) se(%9.4f) stats(r2_a N)


local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR2 Ratio_LoanTOhhs expR2XloanR `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR2 Ratio_LoanTOhhs expR2XloanR `covars') b(%9.4f) se(%9.4f) stats(r2_a N)

*******************************************************************
/* Dummy Loan  */
*******************************************************************

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedD loan_status expDXloanD `covars' if age>18, cluster(comm_code)
estimates store `y'	
}
estimates table `depvar', keep(exposedD loan_status expDXloanD `covars') b(%9.5f) se(%9.5f) stats(r2_a N)

local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR loan_status expRXloanD `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR loan_status expRXloanD `covars') b(%9.4f) se(%9.4f) stats(r2_a N)


local covars female ever_married low_secMore employed age age2 impairment 
local depvar moved mig_workTransfer mig_empSearch mig_marriage mig_famMoved mig_lostLandHome mig_naturalCal mig_otherReason
foreach y in `depvar' {
qui reg `y' exposedR2 loan_status expR2XloanD `covars' if age>18, cluster(comm_code)
estimates store `y'
}
estimates table `depvar', keep(exposedR2 loan_status expR2XloanD `covars') b(%9.4f) se(%9.4f) stats(r2_a N)
*******************************************************************

***********************************************************
