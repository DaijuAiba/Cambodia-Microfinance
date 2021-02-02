clear all
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20190904_Training Report_modified2019.xlsx", sheet("SRP&KTH") firstrow

hist post_minus_pre
ttest post_minus_pre==0
clear all
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20190904_Training Report_modified2019.xlsx", sheet("BTB") firstrow

hist post_minus_pre
ttest post_minus_pre==0

clear all 
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20190904_Training Report_modified2019.xlsx", sheet("PST, PLN, BMC") firstrow

hist post_minus_pre
ttest post_minus_pre==0
clear all
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20200717_Training Report_modified2020.xlsx", sheet("Siem Reap") firstrow

hist post_minus_pre
ttest post_minus_pre==0

clear all
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20200717_Training Report_modified2020.xlsx", sheet("Battambang") firstrow

hist post_minus_pre
ttest post_minus_pre==0

clear all
import excel "C:\Users\phd14102\Google Drive\cma_nix\20200902_JICA_ AB Data Sharing\20200717_Training Report_modified2020.xlsx", sheet("Pailin+Pursat") firstrow

hist post_minus_pre
ttest post_minus_pre==0

