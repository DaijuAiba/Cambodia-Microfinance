
cd

clear 
 
odbc query "CMA-NIX", dialog(complete)
 
odbc desc "CMA_NIX_2014q4_2019q2"

odbc load, table("CMA_NIX_2014q4_2019q4")

split time,parse("q")


tab time2
gen year=time1
destring year,replace

drop if MFI_id ==233 & time=="2016q4"
replace time2="4" if MFI_id ==233 & time=="2016q3"

keep if time2=="4"
drop if scale =="Large"
save "Data\CMAdata.dta",replace