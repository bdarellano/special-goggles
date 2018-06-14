/*Analyst: Frances Miller; fmiller@air.org; 414.745.1783
TASK: Examine first round of TEA data recieved on July 31, 2017 - TX 21st CCLC Y1
	- Check that all files contain the data requested per 
	"L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Data Tracking and Analysis Plan\"

	Last Modified: 06 November 2017 - exported staffing data for site profiles (Gibson)

	Guidance from TEA:
	- Grantee IDs: The grantee ID is cycle-specific. For example, there is no “cycle” indicator in the center-level table. If you wanted to link center to cycle, you would map back to the cycle indicator in the grantee-level data using the grantee ID associated with that particular cycle. 
	- Center IDs: Center IDs cannot be shared between cycles or grantees. 
				  That is, a unique center ID is linked to only one grantee, and therefore only one cycle. 
	- “Term” Status: Federal reporting cycle (and Term ID in TX 21st)  summer (term 1); fall (term 2); spring (term 3)
					  State reporting cycle  fall; spring; summer. i.e., the summer term in the state reports refers to the 1st term in the federal cycle
	- Data Submission Requirements: Site coordinators are required to record student and adult attendance at each event. 
*/

//Set up
global rpath "L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Raw\Downloaded 07312017\CSV Files\"
global spath "L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Raw\Downloaded 07312017\StataVersions\"

global date "$S_DATE"

log using "L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Log Files\ ${date}_TEADataChecking_Y1.txt", replace

set more off

**Import data and save as .dta files for quicker examination

//begin with attendance files
insheet using "${rpath}attend15.csv", clear
	save "${spath}attend15.dta", replace
/*vars included: cycle clc_center_id year term_id activity_id activity_date 
				 activity_start_time activity_end_time clc_student_id
  records included: 13,046,374
*/

*check for duplicates

duplicates report

codebook,c	
/*Variable           Obs Unique      Mean     Min      Max  Label
------------------------------------------------------------------------------------
cycle         1.30e+07      2  7.398057       7        8  CYCLE
clc_center~d  1.30e+07    473  3766.184    3346     4505  CLC_CENTER_ID
year          1.30e+07      1      2015    2015     2015  YEAR
term_id       1.30e+07      2  2.580364       2        3  TERM_ID
activity_id   1.30e+07  20493  149932.4   76148   189598  ACTIVITY_ID
activity_d~e  1.30e+07    301         .       .        .  ACTIVITY_DATE
activity_s~e  1.30e+07     75         .       .        .  ACTIVITY_START_TIME
activity_e~e  1.30e+07     82         .       .        .  ACTIVITY_END_TIME
clc_studen~d  1.30e+07 115162   1185896  123236  1474176  CLC_STUDENT_ID
---------------------------------------------------------------------------------
*/

insheet using "${rpath}attend16.csv", clear
	save "${spath}attend16.dta", replace
/*vars included: cycle clc_center_id year term_id activity_id activity_date 
				 activity_start_time activity_end_time clc_student_id
  records included: 13, 378,218
*/

*check for duplicates
duplicates report

codebook,c	

insheet using "${rpath}attend17.csv", clear
	save "${spath}attend17.dta", replace
/*vars included: cycle clc_center_id year term_id activity_id activity_date 
				 activity_start_time activity_end_time clc_student_id
  records included: 4,595,279
*/

*check for duplicates
duplicates report

codebook,c	


***********************************************************************************
***********************************************************************************

//Move on to activity details files
insheet using "${rpath}activity_details15.csv", clear
	save "${spath}activity_details15.dta", replace
/*vars included: clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				 innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				 reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other certification 
				 certification_other activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag 
				 thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date non_recurring_days time_slots
  records included: 34,057
*/

*check for duplicates
duplicates report

codebook,c	

insheet using "${rpath}activity_details16.csv", clear
	save "${spath}activity_details16.dta", replace
/*vars included: clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				 innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				 reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other 
				 certification certification_other activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag 
				 thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date non_recurring_days time_slots
  records included: 32,496
*/
*check for duplicates
duplicates report

codebook,c	

insheet using "${rpath}activity_details17.csv", clear
	save "${spath}activity_details17.dta", replace
/*vars included: clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				 innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				 reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other 
				 certification certification_other activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag 
				 thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date non_recurring_days time_slots
  records included: 25,085
*/

*check for duplicates
duplicates report

codebook,c

***********************************************************************************
***********************************************************************************

//Move on to other files (center_ops, center_staff, centers, feeders, grantees, and partners)

insheet using "${rpath}center_ops.csv", clear
	save "${spath}center_ops.dta", replace
/*vars included: clc_grantee_id cycle clc_center_id cycle_year term_id term num_weeks days_per_week hours_per_week 
				 hours_before_school hours_during_school hours_after_school hours_weekend hours_weekday_summer hours_weeknight_
				 summer hours_weekend_summer sunday monday tuesday wednesday thursday friday saturday start_date end_date 
				 days_open regular_count non_regular_count 
			     student_activity_count adult_activity_count required_student_year required_weeks_term required_hours_term
  records included: 2,336
*/

*check for duplicates
duplicates report

codebook,c

insheet using "${rpath}center_staff.csv", clear
	save "${spath}center_staff.dta", replace
/*vars included: cycle_year clc_center_id sy_paid_teacher sy_paid_college sy_paid_high sy_paid_parent sy_paid_youth_dev 
				 sy_paid_comm sy_paid_staff sy_paid_other_no_college sy_paid_center_admin sy_paid_other sy_paid_total 
				 sy_vol_teacher sy_vol_college sy_vol_high sy_vol_parent sy_vol_yd sy_vol_comm sy_vol_staff sy_vol_other_no_college 
				 sy_vol_center_admin sy_vol_other sy_vol_total su_paid_teacher su_paid_college su_paid_high su_paid_parent 
				 su_paid_youth_dev su_paid_comm su_paid_staff su_paid_other_no_college su_paid_center_admin su_paid_other 
				 su_paid_total su_vol_teacher su_vol_college su_vol_high su_vol_parent su_vol_youth_dev su_vol_comm su_vol_staff 
				 su_vol_other_no_college su_vol_center_admin su_vol_other su_vol_total other non_funded_staff 
				 staff_replaced
  records included: 1,416
*/

*check for duplicates
duplicates report

codebook,c

insheet using "${rpath}centers.csv", clear
	save "${spath}centers.dta", replace
/*vars included: cycle_year clc_grantee_id clc_center_id host_site_name center_type_id center_type_short 
				 center_type_long center_address_1 center_address_2 
				 center_city center_zip center_contact_name center_contact_phone center_contact_email
  records included: 1,679
*/

*check for duplicates
duplicates report

codebook,c

insheet using "${rpath}feeders.csv", clear
	save "${spath}feeders.dta", replace
/*vars included: cycle_year clc_center_id clc_feeder_id cdn
  records included: 1,575
*/

*check for duplicates
duplicates report

codebook,c

insheet using "${rpath}grantees.csv", clear
	save "${spath}grantees.dta", replace
/*vars included: clc_grantee_id grantee_name grantee_address_1 grantee_address_2 grantee_city grantee_zip 
				 grantee_contact_name grantee_contact_phone grantee_contact_email cycle month_grant_awarded 
				 year_grant_awarded award_length grant_amt_year1 grant_amt_year2 grant_amt_year3 grant_amt_year4 
				 grant_amt_year5 clc_grantee_type_id grantee_type_short grantee_type_long project_description
  records included: 109
*/

*check for duplicates
duplicates report

codebook,c

insheet using "${rpath}partners.csv", clear
	save "${spath}partners.dta", replace
/*vars included: granteename cycleid cycleyear tx_partnerid partnername activesy activesummer partnertype 
				 subcontractor monetaryvalue subcontractoramt evalcontribution fundscontribution 
				 servicescontribution goodscontribution volunteercontribution paidcontribution othercontribution
  records included: 2,848
*/

*check for duplicates
duplicates report

codebook,c

tab cycleyear

*********************************************
///Explore files downloaded September 26, 2017
global rpath "L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Raw\Downloaded 09262017\CSV Versions\"
global spath "L:\TX21st CCLC Evaluation 2017_2020\T3_Data management and analysis\Yr1\Raw\Downloaded 09262017\Stata Versions\"


//2016-17
insheet using "${rpath}RAW_activity_details17s.csv", clear
	save "${spath}activity_details17s.dta", replace
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				// innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				// reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other certification certification_other 
				// activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date 
				// non_recurring_days time_slots
  records included: 7,024
*/
drop v1
*check for duplicates
duplicates report
	
insheet using "${rpath}RAW_activity_details17sp.csv", clear
	save "${spath}activity_details17sp.dta", replace	
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				// innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				// reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other certification certification_other 
				// activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date 
				// non_recurring_days time_slots
  records included: 13,338
*/	
drop v1
	*check for duplicates
duplicates report
	
insheet using "${rpath}RAW_adult_student17.csv", clear
	save "${spath}adult_student17.dta", replace	
/*vars included: v1 cycle clc_center_id year term_id clc_adult_id clc_student_id
  records included: 136,821
*/	
drop v1
	*check for duplicates
duplicates report	
		
insheet using "${rpath}RAW_adult_attend17.csv", clear
	save "${spath}adult_attend17.dta", replace	
/*vars included: cycle clc_center_id year term_id activity_id activity_date activity_start_time activity_end_time clc_adult_id
  records included: 114,288
*/	
drop v1	
	*check for duplicates
duplicates report	

insheet using "${rpath}RAW_attend17s.csv", clear
	save "${spath}attend17s.dta", replace	
/*vars included: 
  records included: 1,119,406
*/	

//add var names
rename v2 cycle	
rename v3 clc_center_id	
rename v4 year	
rename v5 term_id	
rename v6 activity_id	
rename v7 activity_date	
rename v8 activity_start_time	
rename v9 activity_end_time	
rename v10 clc_student_id

drop v1	
	*check for duplicates
duplicates report

save "${spath}attend17s.dta", replace	

	
insheet using "${rpath}RAW_attend17sp.csv", clear
	save "${spath}attend17sp.dta", replace		
/*vars included: v1 cycle clc_center_id year term_id activity_id activity_date activity_start_time activity_end_time clc_student_id
  records included: 6,837,044
*/	
//add var names
drop v1	
	*check for duplicates
duplicates report

use "${spath}center_staff2v2.dta", clear	
/*vars included: CYCLE_YEAR CLC_CENTER_ID SY_PAID_TEACHER SY_PAID_COLLEGE SY_PAID_HIGH SY_PAID_PARENT SY_PAID_YOUTH_DEV SY_PAID_COMM SY_PAID_STAFF 
				// SY_PAID_OTHER_NO_COLLEGE SY_PAID_CENTER_ADMIN SY_PAID_OTHER SY_PAID_TOTAL SY_VOL_TEACHER SY_VOL_COLLEGE SY_VOL_HIGH SY_VOL_PARENT 
				// SY_VOL_YD SY_VOL_COMM SY_VOL_STAFF SY_VOL_OTHER_NO_COLLEGE SY_VOL_CENTER_ADMIN SY_VOL_OTHER SY_VOL_TOTAL SU_PAID_TEACHER SU_PAID_COLLEGE 
				// SU_PAID_HIGH SU_PAID_PARENT SU_PAID_YOUTH_DEV SU_PAID_COMM SU_PAID_STAFF SU_PAID_OTHER_NO_COLLEGE SU_PAID_CENTER_ADMIN SU_PAID_OTHER 
				// SU_PAID_TOTAL SU_VOL_TEACHER SU_VOL_COLLEGE SU_VOL_HIGH SU_VOL_PARENT 
				// SU_VOL_YOUTH_DEV SU_VOL_COMM SU_VOL_STAFF SU_VOL_OTHER_NO_COLLEGE SU_VOL_CENTER_ADMIN SU_VOL_OTHER SU_VOL_TOTAL other 
				// NON_FUNDED_STAFF STAFF_REPLACED
  records included: 1416
*/	
	*check for duplicates
duplicates report
	save "${spath}center_staff2.dta", replace	
	
	
insheet using "${rpath}RAW_ctr_ops17s.csv", clear
	save "${spath}ctr_ops17s.dta", replace		
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term num_weeks days_per_week hours_per_week 
	// hours_before_school hours_during_school hours_after_school hours_weekend hours_weekday_summer hours_weeknight_summer 
	// hours_weekend_summer sunday monday tuesday wednesday thursday friday saturday start_date end_date 
	// days_open regular_count non_regular_count student_activity_count adult_activity_count required_student_year 
	// required_weeks_term required_hours_term
  records included: 472
*/	
	drop v1
	*check for duplicates
duplicates report
save "${spath}ctr_ops17s.dta", replace	

insheet using "${rpath}RAW_ctr_ops17sp.csv", clear
	save "${spath}ctr_ops17sp.dta", replace		
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term num_weeks days_per_week hours_per_week 
	// hours_before_school hours_during_school hours_after_school hours_weekend hours_weekday_summer hours_weeknight_summer 
	// hours_weekend_summer sunday monday tuesday wednesday thursday friday saturday start_date end_date 
	// days_open regular_count non_regular_count student_activity_count adult_activity_count required_student_year 
	// required_weeks_term required_hours_term 
  records included: 460
*/	
	drop v1
	*check for duplicates
duplicates report
	save "${spath}ctr_ops17sp.dta", replace	
	
insheet using "${rpath}RAW_partners.csv", clear
	save "${spath}partners2.dta", replace	
/*vars included: v1 tx_granteeid granteename cycleid cycleyear tx_partnerid partnername activesy activesummer partnertype subcontractor monetaryvalue 
	// subcontractoramt evalcontribution fundscontribution servicescontribution goodscontribution volunteercontribution paidcontribution othercontribution
  records included: 2916
*/	
	drop v1
	*check for duplicates
duplicates report
		save "${spath}partners2.dta", replace	

insheet using "${rpath}RAW_feeders17s.csv", clear
	save "${spath}feeders17s.dta", replace		
/*vars included: v1 cycle_year clc_center_id clc_feeder_id cdn
  records included: 526
*/	
	drop v1
	*check for duplicates
duplicates report
	save "${spath}feeders17s.dta", replace		

insheet using "${rpath}RAW_feeders17sp.csv", clear
	save "${spath}feeders17sp.dta", replace		
	/*vars included: v1 cycle_year clc_center_id clc_feeder_id cdn
  records included: 508
*/	
	drop v1
	*check for duplicates
duplicates report
	save "${spath}feeders17sp.dta", replace		
	
//////////////////////////////////////////////////////////////////////////
/////////////////
//2015-16
insheet using "${rpath}RAW_activity_details16s.csv", clear
	save "${spath}activity_details16s.dta", replace
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term activity_id activity_name activity_description 
				// innovative activity_target primary_category second_category category_other low_performing special_needs lep target_other 
				// reading math science art_music entrepreneur telecom_tech culture_social health_nutrition subject_other certification certification_other 
				// activity_start_date activity_end_date daily_flag monday_flag tuesday_flag wednesday_flag thursday_flag friday_flag saturday_flag sunday_flag monthly_day_date 
				// non_recurring_days time_slots
  records included: 7,024
*/
drop v1
*check for duplicates
duplicates report
	save "${spath}activity_details16s.dta", replace
	
	//start here
use "${spath}attend16s.dta", clear
/*vars included: cycle CLC_CENTER_ID year TERM_ID ACTIVITY_ID ACTIVITY_DATE ACTIVITY_START_TIME ACTIVITY_END_TIME CLC_STUDENT_ID
  records included: 1,155,405
*/	
//make var names lower case

 foreach v of varlist _all {
      capture rename `v' `=lower("`v'")'
 }

	*check for duplicates
duplicates report

save "${spath}attend16s.dta", replace	

insheet using "${rpath}RAW_ctr_ops16s.csv", clear
	save "${spath}ctr_ops16s.dta", replace		
/*vars included: v1 clc_grantee_id cycle clc_center_id cycle_year term_id term num_weeks days_per_week hours_per_week 
	// hours_before_school hours_during_school hours_after_school hours_weekend hours_weekday_summer hours_weeknight_summer 
	// hours_weekend_summer sunday monday tuesday wednesday thursday friday saturday start_date end_date 
	// days_open regular_count non_regular_count student_activity_count adult_activity_count required_student_year 
	// required_weeks_term required_hours_term
  records included: 473
*/	
	drop v1
	*check for duplicates
duplicates report
save "${spath}ctr_ops16s.dta", replace		

insheet using "${rpath}RAW_feeders16s.csv", clear
	save "${spath}feeders16s.dta", replace		
/*vars included: v1 cycle_year clc_center_id clc_feeder_id cdn
  records included: 528
*/	
	drop v1
	*check for duplicates
duplicates report
	save "${spath}feeders16s.dta", replace	
	
insheet using "${rpath}RAW_adult_student16.csv", clear
	save "${spath}adult_student16.dta", replace	
/*vars included: v1 cycle clc_center_id year term_id clc_adult_id clc_student_id
  records included: 172,947
*/	
drop v1
	*check for duplicates
duplicates report		
	save "${spath}adult_student16.dta", replace	

//////////////////////////////////////////////////////////////////////////
/////////////////
//2014-15
	
use"${spath}attend15s.dta", clear
/*vars included: cycle clc_center_id year term_id activity_id activity_date activity_start_time activity_end_time clc_student_id
  records included: 1,117,841
  */	

//make var names lowercase

 foreach v of varlist _all {
      capture rename `v' `=lower("`v'")'
   }

	*check for duplicates
duplicates report

save "${spath}attend15s.dta", replace			
	
insheet using "${rpath}RAW_adult_student15.csv", clear
	save "${spath}adult_student15.dta", replace	
/*vars included: v1 cycle clc_center_id year term_id clc_adult_id clc_student_id
  records included: 143, 493
*/	
drop v1
	*check for duplicates
duplicates report		
	save "${spath}adult_student15.dta", replace	

//////////////////////////////////////////////////////////////////////////
/////////////////
//2013-14

insheet using "${rpath}RAW_attend14s.csv", clear
	save "${spath}attend14s.dta", replace	
/*vars included: 
  records included: 755,613
*/	

//add var names
rename v2 cycle	
rename v3 clc_center_id	
rename v4 year	
rename v5 term_id	
rename v6 activity_id	
rename v7 activity_date	
rename v8 activity_start_time	
rename v9 activity_end_time	
rename v10 clc_student_id

drop v1	
	*check for duplicates
duplicates report

save "${spath}attend14s.dta", replace	


