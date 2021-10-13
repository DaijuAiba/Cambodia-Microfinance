
 use "C:\2014-2015 Cambodia Survey\Economic Survey\ec2014_1.dta" ,clear
 
 
 
 collapse
 
 
 
 //capital structure
 
 use "C:\2014-2015 Cambodia Survey\Economic Survey\ec2014_1.dta" ,clear
 
 destring q19, replace 
 count if q19>0 & q19!=.
 
 destring q20, replace 
 count if q20>0 & q20!=.

 
 
 gen deb_asset = ( Q19+ Q20)/Q17
gen debt_ratio= ( Q19+ Q20)/(Q18+Q19+ Q20)
gen long_debt_ratio= ( Q19)/(Q18+Q19)
gen long_debt_ratio2= ( Q19)/(Q18+Q19+ Q20)

gen capital_adequecy=Q18/Q17



//Firm Creation by regions (Commune)

 use "C:\2014-2015 Cambodia Survey\Economic Survey\ec2014_1.dta" ,clear
 
 gen com_code= q1_1*10000+q1_2*100+q1_3
 
 collapse (count) num_new_firm_2009 = q1_1  if q7>=2009,by(com_code) 
 
 
 
 
 save "Firm_creation_com_2009",replace

 
 use "C:\2014-2015 Cambodia Survey\ec2011\MatrixData_V13.dta", clear
 cd "C:\2014-2015 Cambodia Survey\Result_ Enterprises_Cambodia"
 
 
 gen com_code= Q1_1*10000+Q1_2*100+Q1_3
 
 collapse (count) num_new_firm_2010 = Q1_1 if Q9>=2010,by(com_code) 
 save "Firm_creation_com_2010",replace

  
 use "C:\2014-2015 Cambodia Survey\ec2011\MatrixData_V13.dta", clear
 cd "C:\2014-2015 Cambodia Survey\Result_ Enterprises_Cambodia"
 
 
 gen com_code= Q1_1*10000+Q1_2*100+Q1_3
 
 collapse (count) num_new_firm_2011 = Q1_1 if Q9>=2011,by(com_code) 
 save "Firm_creation_com_2011",replace

 
 use "C:\2014-2015 Cambodia Survey\ec2011\MatrixData_V13.dta", clear
 cd "C:\2014-2015 Cambodia Survey\Result_ Enterprises_Cambodia"
 
 
 gen com_code= Q1_1*10000+Q1_2*100+Q1_3
 
 collapse (count) total_num_firm = Q1_1 ,by(com_code) 
 
 save "Total_num_firm_com",replace
 
 
 use  "Firm_creation_com_2009",clear
 merge 1:1 com_code using  "Firm_creation_com_2010"
 drop _merge
 
 merge 1:1 com_code using  "Total_num_firm_com"
 drop _merge
 
 
