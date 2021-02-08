

* TRENDS IN PAR-30 AND USING DATA "CMA-NIX"

cd "C:\Users\phd14102\Google Drive\cma_nix\cma_nix_new"
clear
append using "2015q4_n" "2016q4_n" "2017q4_n" "2018q4_n" "2019q4_n", force

gen urban=(strpos(district_name, "(Krong)")>0) /* "Krong" is city/town in Khmer */
tab urban
br par_30 amount_loan urban reschedule_loan write_off
sum par_30 reschedule_loan write_off
sum amount_loan if urban==0

bys year: egen m_par_30=mean(par_30)
bys year: egen m_rloan=mean(amount_loan) if urban==0
bys year: egen m_reschedule_loan=mean(reschedule_loan)
bys year: egen m_write_off=mean(write_off)

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"
line m_par_30 m_reschedule_loan m_write_off  year, xtitle("Year", size(small)) ytitle("Recent Trend in PAR-30, Reschedule Loan and Write-off", size(small)) ///
legend(pos(5) ring(0) col(1) lab(1 "PAR-30") lab(2 "Reschedule loan") lab(3 "Write-off")) scheme(s2mono)
graph save "PAR30_reSch_writeoff.gph", replace
graph export PAR30_reSch_writeoff.png, replace

line m_rloan year, xtitle("Year") ytitle("Recent Trend in Rural Loan")
graph save "rLoan.gph", replace
graph export rLoan.png, replace



* TRENDS IN NPL USING DATA "MFI-NBC"
clear
import excel "C:\Users\phd14102\Google Drive\cma_nix\MFI-NBC.xlsx", sheet("npl") firstrow
sum  year npl total_loan npl_r
distinct id  /* 94 distinct IDs*/

bys year: egen m_npl=mean(npl)
bys year: egen m_npl_r=mean(npl_r)

cd "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\graph_figure"
line m_npl year if year>=2015, xtitle("Year") ytitle("Recent Trend in NPLs")
graph save "npl.gph", replace
graph export npl.png, replace

line m_npl_r year if year>=2015, xtitle("Year") ytitle("Recent Trend in NPLs Ratio")
graph save "npl_r.gph", replace
graph export npl_r.png, replace

