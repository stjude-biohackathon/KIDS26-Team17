proc import datafile="\\fs.stjude.sjcrh.local\common\PSY\Data Science\BioHackathon26\Patients - Survey and demographics data.xls" 
		out=work.biohac26_1 dbms=xls replace;
	sheet="FINAL";
run;
proc import datafile="\\fs.stjude.sjcrh.local\common\PSY\Data Science\BioHackathon26\Patients - Spatial data Study ID ONLY.xls" 
		out=work.biohac26_2 dbms=xls replace;
	sheet="US_only_ExportTable_Geocoded_Ex";
run;
proc sort data=biohac26_1;
	by stdyid;
run;
proc sort data=biohac26_11;
	by stdyid;
run;
data biohac26;
	merge biohac26_1 biohac26_11;
	by stdyid;
run;
proc contents data=biohac26 position;
run;
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with 'NLCD 23 Developed Urban 0.75 mil'n 'NLCD 23 Developed Green 0.75 mil'n 
		'NLCD 23 Forest 0.75 mile buffer'n 'NLCD 23 Crops 0.75 mile buffer'n 
		'NLCD 23 Other Vegetation 0.75 mi'n 'NLCD 23 Wetlands 0.75 mile buffe'n 
		'PM2.5 pollution annual average 0'n 'PM2.5 pollution annual average 2'n 
		'SO2 pollution annual average 0.7'n 'SO2 pollution annual average 2 m'n 
		'NO2 pollution annual average 0.7'n 'NO2 pollution annual average 2 m'n 
		'CO pollution annual average dail'n 'CO pollution annual average dai1'n 
		'CO pollution annual average dai2'n 'CO pollution annual average dai3'n 
		Noise_Pollution 'AQI Air Quality Index 2023 by CB'n 
		'2020 Rural-Urban Commuting Area'n;
run;
/*********************Correlations*****/

/*********************Set1*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with 'NLCD 23 Developed Urban 0.75 mil'n 'NLCD 23 Developed Green 0.75 mil'n 
		'NLCD 23 Forest 0.75 mile buffer'n 'NLCD 23 Crops 0.75 mile buffer'n 
		'NLCD 23 Other Vegetation 0.75 mi'n 'NLCD 23 Wetlands 0.75 mile buffe'n 
		'PM2.5 pollution annual average 0'n 'PM2.5 pollution annual average 2'n 
		'SO2 pollution annual average 0.7'n 'SO2 pollution annual average 2 m'n 
		'NO2 pollution annual average 0.7'n 'NO2 pollution annual average 2 m'n 
		'CO pollution annual average dail'n 'CO pollution annual average dai1'n 
		'CO pollution annual average dai2'n 'CO pollution annual average dai3'n 
		Noise_Pollution 'AQI Air Quality Index 2023 by CB'n 
		'2020 Rural-Urban Commuting Area'n;
run;

/*********************Set2*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with Child_O_Index1 Child_O_Index2 Child_O_Index3 Child_O_Index4 
		Child_O_Index5 Child_O_Index6 Child_O_Index7 Child_O_Index8 Child_O_Index9 
		Child_O_Index10 Child_O_Index11 Child_O_Index12 Child_O_Index13 
		Child_O_Index14 Child_O_Index15 Child_O_Index16 Child_O_Index17 
		Child_O_Index18;
run;
/*********************Set3*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with Var1 Var2 Var3 Var4 Var5 Var6 Var7 Var8 Var9;
run;
/*********************Set4*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with Var11 Var13 Var15 Var17 Var19 Var21 Var35 Var37;
run;

/*********************Set5*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with Var39 Var40 Var42 Var44 Var46;
run;

/*********************Set6*****/
proc corr data=biohac26;
	var ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum;
	with Var58 Var61 Var62 Var63 Var64 Var65 Var66 Var68;
run;
proc import datafile="\\fs.stjude.sjcrh.local\common\PSY\Data Science\BioHackathon26\Patients - Survey and demographics data - With new categorical.xls" 
		out=work.biohac26_2 dbms=xls replace;
	sheet="Final";
run;

proc contents data=biohac26_2 position;
run;
/*********************ANOVA for Greengrp & Tapestry segment*****/

proc anova data=biohac26_2;
	class greengrp4;
	model ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc=greengrp4;
	run;
quit;
proc anova data=biohac26_2;
	class PollExpsGrp2;
	model ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc=PollExpsGrp2;
	run;
quit;

proc anova data=biohac26_2;
	class greengrp4;
	model ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum=greengrp4;
	run;
quit;

proc anova data=biohac26_2;
	class PollExpsGrp2;
	model ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum=PollExpsGrp2;
	run;
quit;
proc anova data=biohac26_2;
	class PollExpsGrp2;
	model ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum=PollExpsGrp2;
	run;
quit;
proc anova data=biohac26_2;
	class greengrp4;
	model ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum=greengrp4;
	run;
quit;
proc anova data=biohac26_2;
	class 'TAPESTRY FINAL CODE'N;
	model ptMSPSS_sumScore ptMSPSS_sigothSum ptMSPSS_familySum 
		ptMSPSS_friendSum='TAPESTRY FINAL CODE'N;
	;
	run;
quit;
proc anova data=biohac26_2;
	class 'TAPESTRY FINAL CODE'N;
	model ptPROMIS_combAnxTsc ptPROMIS_combDepTsc ptPROMIS_combPhyTsc 
		ptPROMIS_combPInTsc='TAPESTRY FINAL CODE'N;
	;
	run;
quit;
/*********************ANOVA by Gender and Agegrp*****/

proc import datafile="\\fs.stjude.sjcrh.local\common\PSY\Data Science\BioHackathon26\Patients - Spatial data Study ID ONLY.xls" 
		out=work.biohac26_3 dbms=xls replace;
	sheet="US_only_Export_Geocode limited";
run;
proc contents data=biohac26_3 position;
run;

data biohac26_3;
	set biohac26_3;

	if Gender=1 then
		Gender2=1;
	else if Gender=2 then
		Gender2=2;
	else
		Gender2=.;
run;

proc anova data=biohac26_3;
	class Gender2;
	model 'NLCD Proportion Classified Land'n 'COI Overall'n 'COI Education'n 
		'COI Health & Environment'n 'COI Social & Economic'n 
		'COI Early Childhood Education'n 'COI Elementary Education'n 
		'COI Educational Resources'n 'COI Secondary And PostSec Educat'n 
		'COI Pollution'n 'COI Health Resources'n 'COI Safety-Related Resources'n 
		'COI Healthy Environments'n 'COI Concentrated Socio-Economic'n 
		'COI Employment'n 'COI Economic Resources'n 'COI Housing Resources'n 
		'COI Social Resources'n 'COI Wealth'n '2025 HH Owns Any Pet: Percent'n 
		'2025 Per Capita Income'n '2025 Average Home Value'n 
		'2025 Average Household Income'n '2025 Median Age'n 
		'2025 Total Housing Units'n '2025 Renter Occupied HUs'n 
		'2025 Renter Occupied HUs: Percen'n=Gender2;
	run;
quit;
proc freq data=biohac26_3;
	table Gender2*'TAPESTRY_FINAL_CODE'n/chisq expected;
run;
proc anova data=biohac26_3;
	class Agegrp;
	model 'NLCD Proportion Classified Land'n 'COI Overall'n 'COI Education'n 
		'COI Health & Environment'n 'COI Social & Economic'n 
		'COI Early Childhood Education'n 'COI Elementary Education'n 
		'COI Educational Resources'n 'COI Secondary And PostSec Educat'n 
		'COI Pollution'n 'COI Health Resources'n 'COI Safety-Related Resources'n 
		'COI Healthy Environments'n 'COI Concentrated Socio-Economic'n 
		'COI Employment'n 'COI Economic Resources'n 'COI Housing Resources'n 
		'COI Social Resources'n 'COI Wealth'n '2025 HH Owns Any Pet: Percent'n 
		'2025 Per Capita Income'n '2025 Average Home Value'n 
		'2025 Average Household Income'n '2025 Median Age'n 
		'2025 Total Housing Units'n '2025 Renter Occupied HUs'n 
		'2025 Renter Occupied HUs: Percen'n=Agegrp;
	run;
quit;
proc freq data=biohac26_3;
	table Agegrp*'TAPESTRY_FINAL_CODE'n/chisq expected;
run;