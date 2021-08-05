# Report of Effect of M&A on Lending Behavior of Microfinance Institutions

## 1. Objective and methodology of the study
We aim to empirically estimate the effect of merger and acquisition (M&A) cases of Microfinance institutions (MFIs) on loan amount and size, the total number of borrowers, and the ratio of female borrowers. For this purpose, we use a difference-in-difference approach whereby we exploit the variation in loan provision across MFIs and periods. To investigate the M&A effect, we employ MFIs data from the National Bank of Cambodia (MFI-NBC).  

<br>


## 2. Empirical Methodology 
### 2.1 Empirical Model


<img src="https://render.githubusercontent.com/render/math?math=y_{ijt} = \Sigma_{k=-4}^{-1} \beta_{k} \times treat_{ik}%2B \Sigma_{k=0}^{4} \beta_{k} \times treat_{ik} %2B \gamma X_{it} %2B \mu_i %2B \nu_{jt} %2B \epsilon_{ijt}"><br>




$$ y_{ijt} = \Sigma_{k=-4}^{-1} \beta_{k} \times treat_{ik} + \Sigma_{k=0}^{4} \beta_{k} \times treat_{ik}+\gamma X_{it} + \mu_i+\nu_{jt} + \epsilon_{ijt} $$


$treat_{ik}$ is a dummy variable, equaling 1 if the observation’s periods relative to the group 
g
’s first treated period is the same value as k; 0 otherwise (and 0 for all never-treated groups).
Estimation is  performed with standard errors clustered at a district level.
<br><br>

### 2.2 Data
For the estimation, we constrcuted the dataset from three sources. Firstly, the data relating to MFI lending is extracted from the CMA-NIX database. Secondly, the data represeting MFI's financial condition is extracted from the NBC Supervision Annual Report. Thirdly, we also collected the data of M&A in the Cambodian MFI sector via website of each MFI and local newspapers.
<br>
Our dependent variables include the loan amount, total number of borrowers, loan size (ratio of the loan amount to the total number of borrowers), and ratio of female to the total number of borrowers. We take the logarithm form of all the outcome variables in our regression analysis.
<br><br>

### 2.3 Definition of M&A
The policy variables include indicators for M&A cases of MFIs. To empirically examine the effect of M&A, we employ three dummy and one share (fraction) indicators. We generate a dummy variable (MA0) with a value of 1 for MFIs in which foreign countries participate as shareholders based on the data from MFIs’ webpages and financial reports. Further, we construct two dummy indicators (MA1 and MA2), one taking 1 if the foreign share is non-zero and the other if the foreign share equals or exceeds 50 percent based on MFI-NBC data. Additionally, we take the ratio of foreign share directly as an alternative measure of M&A cases (MA3).
<br><br>

## 3. Results 
Table 1 shows the results of the estimation.



<figure>
    <img src="Graph_Event_Study/EventStudy.png" alt="Table 1" title="Table 1" />
    Note: A red-colored line in each panel represents the average of coefficients before the event.
</figure>



