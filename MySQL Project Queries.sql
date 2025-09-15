#Resolving key questions for Exploratory Data Analysis

-- 1. What is the total number of patients admitted to the hospital?
SELECT 
    COUNT(recordId) AS Total_Patients
FROM
    healthcare;
------------------------------------------
-- 2. How many patients are male vs female?
SELECT 
    gender, COUNT(recordId) AS Total_Patients
FROM
    healthcare
GROUP BY gender;
------------------------------------------
-- 3. List the count of patients by admission type
SELECT 
    admissionType, COUNT(recordId) AS Total_Patients
FROM
    healthcare
GROUP BY admissionType;
------------------------------------------
-- 4. Find the top 4 most common medical conditions among admitted patients.
SELECT 
    medicalCondition, COUNT(recordId) AS Total_Patients
FROM
    healthcare
GROUP BY medicalCondition
ORDER BY COUNT(recordId) DESC
LIMIT 4;
------------------------------------------
-- 5. Which insurance provider has the maximum number of patients covered?
SELECT 
    insuranceProvider, COUNT(recordId) AS Total_Patients_Covered
FROM
    healthcare
GROUP BY insuranceProvider
ORDER BY COUNT(recordId) DESC
LIMIT 1;
------------------------------------------
-- 6. What is the average age of patients admitted with each medical condition?
SELECT 
    medicalCondition, ROUND(AVG(age), 2) AS Average_Age
FROM
    healthcare
GROUP BY medicalCondition;
------------------------------------------
-- 7. Calculate the average billing amount for each type of admission.
SELECT 
    admissionType, ROUND(AVG(billingAmount), 2) AS Average_Bill
FROM
    healthcare
GROUP BY admissionType;
------------------------------------------
-- 8. Which hospital generated the highest total billing amount?
SELECT 
    hospital, SUM(billingAmount) AS Total_Bill
FROM
    healthcare
GROUP BY hospital
ORDER BY Total_Bill DESC
LIMIT 1;
------------------------------------------
-- 9. Find the average length of stay for patients across different admission types.
SELECT 
    admissionType,
    ROUND(AVG(DATEDIFF(dischargeDate, dateOfAdmission)),2)
    AS Average_Stay_Days
FROM
    healthcare
GROUP BY admissionType;
------------------------------------------
-- 10. Identify the doctor with the highest number of patients treated.
SELECT 
    doctor, COUNT(recordId) AS Total_Patients_Treated
FROM
    healthcare
GROUP BY doctor
ORDER BY Total_Patients_Treated DESC
LIMIT 2; #as there are two doctors at top who teareted equal number of patients
------------------------------------------
-- 11. Which medication is prescribed most frequently, and for which condition is it most common?
SELECT 
    medication,
    medicalCondition,
    COUNT(recordId) AS Prescription_Count
FROM
    healthcare
GROUP BY medication , medicalCondition
ORDER BY Prescription_Count DESC
LIMIT 1;
------------------------------------------
-- 12. Compare the average billing amount by gender.
SELECT 
    gender, ROUND(AVG(billingAmount), 2) AS Average_Bill
FROM
    healthcare
GROUP BY gender;
------------------------------------------
-- 13. Show the monthly patient admission trend (patients admitted per month).
SELECT 
    DATE_FORMAT(dateOfAdmission, '%M %Y') AS Admission_Month,
    COUNT(recordId) AS Total_Patients
FROM
    healthcare
GROUP BY Admission_Month
ORDER BY MIN(dateOfAdmission);
------------------------------------------
-- 14. Which blood type patients are most commonly associated with abnormal test results?
SELECT 
    bloodType, COUNT(*) Abnormal_Count
FROM
    healthcare
WHERE
    testResults = 'Abnormal'
GROUP BY bloodType
ORDER BY Abnormal_Count DESC
LIMIT 1;
------------------------------------------
-- 15. Rank hospitals based on their average billing amount per patient.
SELECT 
	hospital, ROUND(AVG(billingAmount),2) AS Average_Bill,
    RANK() OVER (ORDER BY AVG(billingAmount) DESC) AS `RANK`
FROM healthcare
GROUP BY hospital
ORDER BY `RANK`;
------------------------------------------
-- 16. Which insurance provider contributes the most in terms of total billing amount?
SELECT 
    insuranceProvider,
    ROUND(SUM(billingAmount), 2) AS Total_Bill
FROM
    healthcare
GROUP BY insuranceProvider
ORDER BY Total_Bill
LIMIT 1;
------------------------------------------
-- 17. Find the most expensive medical condition.
SELECT 
    medicalCondition,
    ROUND(AVG(billingAmount), 2) AS Average_Cost
FROM
    healthcare
GROUP BY medicalCondition
ORDER BY Average_Cost DESC
LIMIT 1;
------------------------------------------
-- 18. Identify the doctor–hospital pair that has generated the maximum revenue.
SELECT 
    doctor, hospital, SUM(billingAmount) AS Revenue
FROM
    healthcare
GROUP BY doctor , hospital
ORDER BY Revenue DESC
LIMIT 1;
------------------------------------------
-- 19. For each medical condition, calculate the average length of stay and see which one leads to the longest hospitalizations.
SELECT 
    medicalCondition,
    ROUND(AVG(DATEDIFF(dischargeDate, dateOfAdmission)),
            2) AS Average_Stay_Days
FROM
    healthcare
GROUP BY medicalCondition
ORDER BY Average_Stay_Days DESC;
------------------------------------------
-- 20. Compare the average billing difference between Emergency and Elective admissions.
SELECT 
    admissionType,
    ROUND(AVG(billingAmount), 2) AS Average_Bill_Amount
FROM
    healthcare
WHERE
    admissionType IN ('Emergency' , 'Elective')
GROUP BY admissionType;
------------------------------------------
-- 21. Find the average length of stay per medical condition, and rank them from longest to shortest.
SELECT medicalCondition, 
	   ROUND(AVG(DATEDIFF(dischargeDate, dateOfAdmission)),2)
       AS Avg_Stay_Days,
	   RANK() OVER(ORDER BY ROUND(AVG(DATEDIFF(dischargeDate, dateOfAdmission)),2) DESC)
       AS `Rank`
FROM healthcare
GROUP BY medicalCondition;
------------------------------------------
-- 22. Compare the average billing amount for patients with Normal vs Abnormal test results across all hospitals.
SELECT 
    hospital,
    testResults,
    ROUND(AVG(billingAmount), 2) AS Average_Bill
FROM
    healthcare
WHERE
    testResults IN ('Normal' , 'Abnormal')
GROUP BY hospital , testResults
ORDER BY hospital , testResults;
------------------------------------------
-- 23. Calculate the yearly trend of admissions and identify the peak year.
SELECT 
    YEAR(dateOfAdmission) AS `Year`,
    COUNT(recordId) AS Total_Patients
FROM
    healthcare
GROUP BY YEAR(dateOfAdmission)
ORDER BY Total_Patients DESC;
------------------------------------------
-- 24. Find the most common medication prescribed for each medical condition.
SELECT medicalCondition, medication, Total_Prescription_Count
FROM(
	SELECT medicalCondition, medication, COUNT(recordId) AS Total_Prescription_Count,
    RANK() OVER(PARTITION BY medicalCondition ORDER BY COUNT(recordId) DESC) AS `Rank`
    FROM healthcare
    GROUP BY medicalCondition, medication
    ) AS Ranked
WHERE `Rank` = 1
ORDER BY medicalCondition;
------------------------------------------
-- 25. Determine which admission type generates the highest revenue per patient.
SELECT 
    admissionType, ROUND(SUM(billingAmount), 2) AS Total_Revenue
FROM
    healthcare
GROUP BY admissionType
ORDER BY Total_Revenue DESC
LIMIT 1;
------------------------------------------
-- 26. Identify the top 3 insurance providers by number of patients, and calculate their average billing.
SELECT 
    insuranceProvider,
    COUNT(recordId) AS Total_Patients_Covered,
    ROUND(AVG(billingAmount), 2) AS Average_Bill
FROM
    healthcare
GROUP BY insuranceProvider
ORDER BY Total_Patients_Covered DESC
LIMIT 3;
------------------------------------------
-- 27. For each hospital, find the gender-wise distribution of patients and their corresponding average billing.
SELECT 
    hospital, gender, AVG(billingAmount) AS Average_Bill
FROM
    healthcare
GROUP BY hospital , gender
ORDER BY hospital , gender;
------------------------------------------
-- 28. Find the percentage of patients over 60 years old admitted for each medical condition.
SELECT medicalCondition, 
	   ROUND(((SUM(CASE WHEN age < 60 THEN 1 ELSE 0 END)
       /
       COUNT(recordId)) * 100),2)
       AS `%Patients_Over60Age`
FROM healthcare
GROUP BY medicalCondition;
------------------------------------------
-- 29. Identify the doctors who treated more than 1 medical condition and calculate their total billing share.
SELECT 
    doctor, SUM(billingAmount) AS Total_Bill
FROM
    healthcare
GROUP BY doctor
HAVING COUNT(DISTINCT (medicalCondition)) > 1;
------------------------------------------
-- 30. Segment patients into age groups (0–20, 21–40, 41–60, 61+) and calculate the average billing amount for each group to identify which age group contributes most to revenue. Show all age groups.
SELECT 
    CASE
        WHEN age BETWEEN 0 AND 20 THEN '0-20'
        WHEN age BETWEEN 21 AND 40 THEN '21-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+'
    END AS Age_Group,
    ROUND(AVG(billingAmount), 2) AS Average_Bill
FROM
    healthcare
GROUP BY Age_Group
ORDER BY Average_Bill DESC;


