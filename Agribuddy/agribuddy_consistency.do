
/*
******************************
MISSING AND OUTLIER CHECKING FOR AGRIBUDDY DATA
**********************************
I removed the word "KHR" infront of income and expenditure variables from Agribuddy data in excel before importing it to Stata

*/

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 1") firstrow

* Computing the missing proportion for each variable in BTB 1


mdesc  /* Computing missing proportion  */

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_BTB1_box.gph", replace
graph export `var'_BTB1_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_BTB1_hist.gph", replace
graph export `var'_BTB1_hist.png, replace
}

graph combine q2_2_BTB1_box.gph q2_4c_BTB1_box.gph q3_1_BTB1_box.gph q3_2_BTB1_box.gph q3_3_BTB1_box.gph q3_4_BTB1_box.gph q3_5_BTB1_box.gph q3_6_BTB1_box.gph q3_7_BTB1_box.gph q3_8_BTB1_box.gph q3_9_BTB1_box.gph q3_10_BTB1_box.gph q5_1c_BTB1_box.gph q5_1d_BTB1_box.gph q5_1e_BTB1_box.gph q8_1_BTB1_box.gph, scale(0.7)
graph save "outliers_BTB1_box.gph", replace
graph export outliers_BTB1_box.png, replace

graph combine q2_2_BTB1_hist.gph q2_4c_BTB1_hist.gph q3_1_BTB1_hist.gph q3_2_BTB1_hist.gph q3_3_BTB1_hist.gph q3_4_BTB1_hist.gph q3_5_BTB1_hist.gph q3_6_BTB1_hist.gph q3_7_BTB1_hist.gph q3_8_BTB1_hist.gph q3_9_BTB1_hist.gph q3_10_BTB1_hist.gph q5_1c_BTB1_hist.gph q5_1d_BTB1_hist.gph q5_1e_BTB1_hist.gph q8_1_BTB1_hist.gph, scale(0.7)
graph save "outliers_BTB1_hist.gph", replace
graph export outliers_BTB1_hist.png, replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("BTB 2") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_BTB2_box.gph", replace
graph export `var'_BTB2_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_BTB2_hist.gph", replace
graph export `var'_BTB2_hist.png, replace
}

graph combine q2_2_BTB2_box.gph q2_4c_BTB2_box.gph q3_1_BTB2_box.gph q3_2_BTB2_box.gph q3_3_BTB2_box.gph q3_4_BTB2_box.gph q3_5_BTB2_box.gph q3_6_BTB2_box.gph q3_7_BTB2_box.gph q3_8_BTB2_box.gph q3_9_BTB2_box.gph q3_10_BTB2_box.gph q5_1c_BTB2_box.gph q5_1d_BTB2_box.gph q5_1e_BTB2_box.gph q8_1_BTB2_box.gph, scale(0.7)
graph save "outliers_BTB2_box.gph", replace
graph export outliers_BTB2_box.png, replace

graph combine q2_2_BTB2_hist.gph q2_4c_BTB2_hist.gph q3_1_BTB2_hist.gph q3_2_BTB2_hist.gph q3_3_BTB2_hist.gph q3_4_BTB2_hist.gph q3_5_BTB2_hist.gph q3_6_BTB2_hist.gph q3_7_BTB2_hist.gph q3_8_BTB2_hist.gph q3_9_BTB2_hist.gph q3_10_BTB2_hist.gph q5_1c_BTB2_hist.gph q5_1d_BTB2_hist.gph q5_1e_BTB2_hist.gph q8_1_BTB2_hist.gph, scale(0.7)
graph save "outliers_BTB2_hist.gph", replace
graph export outliers_BTB2_hist.png, replace


******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP1") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_SRP1_box.gph", replace
graph export `var'_SRP1_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_SRP1_hist.gph", replace
graph export `var'_SRP1_hist.png, replace
}

graph combine q2_2_SRP1_box.gph q2_4c_SRP1_box.gph q3_1_SRP1_box.gph q3_2_SRP1_box.gph q3_3_SRP1_box.gph q3_4_SRP1_box.gph q3_5_SRP1_box.gph q3_6_SRP1_box.gph q3_7_SRP1_box.gph q3_8_SRP1_box.gph q3_9_SRP1_box.gph q3_10_SRP1_box.gph q5_1c_SRP1_box.gph q5_1d_SRP1_box.gph q5_1e_SRP1_box.gph q8_1_SRP1_box.gph, scale(0.7)
graph save "outliers_SRP1_box.gph", replace
graph export outliers_SRP1_box.png, replace

graph combine q2_2_SRP1_hist.gph q2_4c_SRP1_hist.gph q3_1_SRP1_hist.gph q3_2_SRP1_hist.gph q3_3_SRP1_hist.gph q3_4_SRP1_hist.gph q3_5_SRP1_hist.gph q3_6_SRP1_hist.gph q3_7_SRP1_hist.gph q3_8_SRP1_hist.gph q3_9_SRP1_hist.gph q3_10_SRP1_hist.gph q5_1c_SRP1_hist.gph q5_1d_SRP1_hist.gph q5_1e_SRP1_hist.gph q8_1_SRP1_hist.gph, scale(0.7)
graph save "outliers_SRP1_hist.gph", replace
graph export outliers_SRP1_hist.png, replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SRP2") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_SRP2_box.gph", replace
graph export `var'_SRP2_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_SRP2_hist.gph", replace
graph export `var'_SRP2_hist.png, replace
}

graph combine q2_2_SRP2_box.gph q2_4c_SRP2_box.gph q3_1_SRP2_box.gph q3_2_SRP2_box.gph q3_3_SRP2_box.gph q3_4_SRP2_box.gph q3_5_SRP2_box.gph q3_6_SRP2_box.gph q3_7_SRP2_box.gph q3_8_SRP2_box.gph q3_9_SRP2_box.gph q3_10_SRP2_box.gph q5_1c_SRP2_box.gph q5_1d_SRP2_box.gph q5_1e_SRP2_box.gph q8_1_SRP2_box.gph, scale(0.7)
graph save "outliers_SRP2_box.gph", replace
graph export outliers_SRP2_box.png, replace

graph combine q2_2_SRP2_hist.gph q2_4c_SRP2_hist.gph q3_1_SRP2_hist.gph q3_2_SRP2_hist.gph q3_3_SRP2_hist.gph q3_4_SRP2_hist.gph q3_5_SRP2_hist.gph q3_6_SRP2_hist.gph q3_7_SRP2_hist.gph q3_8_SRP2_hist.gph q3_9_SRP2_hist.gph q3_10_SRP2_hist.gph q5_1c_SRP2_hist.gph q5_1d_SRP2_hist.gph q5_1e_SRP2_hist.gph q8_1_SRP2_hist.gph, scale(0.7)
graph save "outliers_SRP2_hist.gph", replace
graph export outliers_SRP2_hist.png, replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PLN(Done)") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_PLN_box.gph", replace
graph export `var'_PLN_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_PLN_hist.gph", replace
graph export `var'_PLN_hist.png, replace
}

graph combine q2_2_PLN_box.gph q2_4c_PLN_box.gph q3_1_PLN_box.gph q3_2_PLN_box.gph q3_3_PLN_box.gph q3_4_PLN_box.gph q3_5_PLN_box.gph q3_6_PLN_box.gph q3_7_PLN_box.gph q3_8_PLN_box.gph q3_9_PLN_box.gph q3_10_PLN_box.gph q5_1c_PLN_box.gph q5_1d_PLN_box.gph q5_1e_PLN_box.gph q8_1_PLN_box.gph, scale(0.7)
graph save "outliers_PLN_box.gph", replace
graph export outliers_PLN_box.png, replace

graph combine q2_2_PLN_hist.gph q2_4c_PLN_hist.gph q3_1_PLN_hist.gph q3_2_PLN_hist.gph q3_3_PLN_hist.gph q3_4_PLN_hist.gph q3_5_PLN_hist.gph q3_6_PLN_hist.gph q3_7_PLN_hist.gph q3_8_PLN_hist.gph q3_9_PLN_hist.gph q3_10_PLN_hist.gph q5_1c_PLN_hist.gph q5_1d_PLN_hist.gph q5_1e_PLN_hist.gph q8_1_PLN_hist.gph, scale(0.7)
graph save "outliers_PLN_hist.gph", replace
graph export outliers_PLN_hist.png, replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("SML(Done)") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_SML_box.gph", replace
graph export `var'_SML_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_SML_hist.gph", replace
graph export `var'_SML_hist.png, replace
}

graph combine q2_2_SML_box.gph q2_4c_SML_box.gph q3_1_SML_box.gph q3_2_SML_box.gph q3_3_SML_box.gph q3_4_SML_box.gph q3_5_SML_box.gph q3_6_SML_box.gph q3_7_SML_box.gph q3_8_SML_box.gph q3_9_SML_box.gph q3_10_SML_box.gph q5_1c_SML_box.gph q5_1d_SML_box.gph q5_1e_SML_box.gph q8_1_SML_box.gph, scale(0.7)
graph save "outliers_SML_box.gph", replace
graph export outliers_SML_box.png, replace

graph combine q2_2_SML_hist.gph q2_4c_SML_hist.gph q3_1_SML_hist.gph q3_2_SML_hist.gph q3_3_SML_hist.gph q3_4_SML_hist.gph q3_5_SML_hist.gph q3_6_SML_hist.gph q3_7_SML_hist.gph q3_8_SML_hist.gph q3_9_SML_hist.gph q3_10_SML_hist.gph q5_1c_SML_hist.gph q5_1d_SML_hist.gph q5_1e_SML_hist.gph q8_1_SML_hist.gph, scale(0.7)
graph save "outliers_SML_hist.gph", replace
graph export outliers_SML_hist.png, replace



******************************************************************************

clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\JICA Data Collection_Modified 20200910.xlsx", sheet("PST(Done)") firstrow

mdesc

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"

local q2_2 "Non-agricultural Income"
local q2_4c "Remittance Amount Received"
local q3_1 "Daily Food Expenditure"
local q3_2 "Electricity and Water Expenditure"
local q3_3 "Monthly Expenditure for Top-up"
local q3_4 "Monthly Expenditure for Travel"
local q3_5 "Monthly Expenditure for Health"
local q3_6 "Last Month Loan Payment"
local q3_7 "Expenditure for Motorcycle"
local q3_8 "Expenditure for Education"
local q3_9 "Expenditure for Gambling"
local q3_10 "Expenditure for Social Life"
local q5_1c "Amount of MFI Loan"
local q5_1d "Interest for MFI Loan"
local q5_1e "Monthly Payment for MFI Loan"
local q8_1 "Monthly Saving"

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
graph box `var', ytitle("``var''")
graph save "`var'_PST_box.gph", replace
graph export `var'_PST_box.png, replace
}

foreach var in q2_2 q2_4c q3_1 q3_2 q3_3 q3_4 q3_5 q3_6 q3_7 q3_8 q3_9 q3_10 q5_1c q5_1d q5_1e q8_1 {
destring `var', replace force
hist `var', xtitle("``var''")
graph save "`var'_PST_hist.gph", replace
graph export `var'_PST_hist.png, replace
}

graph combine q2_2_PST_box.gph q2_4c_PST_box.gph q3_1_PST_box.gph q3_2_PST_box.gph q3_3_PST_box.gph q3_4_PST_box.gph q3_5_PST_box.gph q3_6_PST_box.gph q3_7_PST_box.gph q3_8_PST_box.gph q3_9_PST_box.gph q3_10_PST_box.gph q5_1c_PST_box.gph q5_1d_PST_box.gph q5_1e_PST_box.gph q8_1_PST_box.gph, scale(0.7)
graph save "outliers_PST_box.gph", replace
graph export outliers_PST_box.png, replace

graph combine q2_2_PST_hist.gph q2_4c_PST_hist.gph q3_1_PST_hist.gph q3_2_PST_hist.gph q3_3_PST_hist.gph q3_4_PST_hist.gph q3_5_PST_hist.gph q3_6_PST_hist.gph q3_7_PST_hist.gph q3_8_PST_hist.gph q3_9_PST_hist.gph q3_10_PST_hist.gph q5_1c_PST_hist.gph q5_1d_PST_hist.gph q5_1e_PST_hist.gph q8_1_PST_hist.gph, scale(0.7)
graph save "outliers_PST_hist.gph", replace
graph export outliers_PST_hist.png, replace


