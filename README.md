# 🏥 Healthcare Data Analysis Project (SQL)

## 📌 Project Overview
This project demonstrates the use of **SQL for Data Analytics** on a healthcare dataset. The dataset originally contained **55,000+ rows**, but for ease of use, it was trimmed to **500 rows** for loading into MySQL.  
The analysis explores **patient demographics, hospital operations, billing trends, insurance coverage, and medical insights** through structured SQL queries.

---
## 📂 Dataset Details

**Dataset Name:** Healthcare Dataset  
**Source:** [Dataset](https://github.com/manishrajpurohit1108/SQL-Project/blob/main/healthcare_dataset_updated.csv) (Original dataset from [Kaggle](https://www.kaggle.com/datasets/prasad22/healthcare-dataset))

**Columns (15 total):**  

- **Name** → Full name of the patient  
- **Age** → Age of the patient at the time of admission (in years)  
- **Gender** → Gender of the patient (Male/Female)  
- **BloodType** → Blood group of the patient (e.g., A+, O-, B+, etc.)  
- **MedicalCondition** → Primary diagnosis or medical condition (e.g., Diabetes, Hypertension, Asthma, Obesity, Cancer)  
- **DateOfAdmission** → Date the patient was admitted to the hospital  
- **Doctor** → Name of the doctor responsible for the patient’s treatment  
- **Hospital** → Name of the healthcare facility/hospital where the patient was admitted  
- **InsuranceProvider** → Patient’s insurance provider (e.g., Aetna, Blue Cross, Cigna, UnitedHealthcare, Medicare)  
- **BillingAmount** → Amount billed for the patient’s admission and treatment (float value with decimals)  
- **RoomNumber** → Room number where the patient was accommodated during admission  
- **AdmissionType** → Type of admission (Emergency, Elective, Urgent)  
- **DischargeDate** → Date the patient was discharged from the hospital  
- **Medication** → Medication prescribed/administered during admission (e.g., Aspirin, Ibuprofen, Penicillin, Paracetamol, Lipitor)  
- **TestResults** → Outcome of medical tests conducted (Normal, Abnormal, Inconclusive)  
---

## 🗃️ Files in this Repository
- **`healthcare_dataset_updated.csv`** → Healthcare dataset (500 rows, cleaned from original 55,000+).  
- **`Project_Table_Schema.sql`** → SQL script to create the database table structure, load data and data preparation.  
- **`MySQL_Project_Queries.sql`** → All SQL queries used for analysis.  
- **`Healthcare Analytics Project.pdf`** → PDF version of the project PPT (contains questions, queries, and screenshots of query results).  

---

## 🛠 Tools Used
- **MySQL** – Database engine  
- **MySQL Workbench** – Query editor and result viewer  
- **MS PowerPoint** – Project presentation  
- **Excel/CSV** – Dataset preparation  

---

## 📊 Key Insights
- **Gender Distribution** → Fairly balanced across patients.  
- **Age & Revenue** → Patients above **60 years old** contribute significantly to hospital revenue.  
- **Admissions & Billing** → **Emergency admissions** are more frequent and associated with higher billing amounts.  
- **Length of Stay** → Varies by admission type and condition, with chronic illnesses leading to longer hospitalizations.  
- **Doctor & Hospital Share** → A few doctors and hospitals are responsible for a large share of patients and revenue.  
- **Common Conditions** → **Diabetes, Hypertension, Cancer, and Asthma** dominate patient admissions.  
- **Test Results** → **Abnormal results** are more common in certain blood types and conditions.  
- **Medication Trends** → Some medications (e.g., **Paracetamol, Aspirin**) are prescribed frequently for common illnesses.  
- **Billing Variation** → Billing amounts vary widely across admission types and medical conditions.  
- **Insurance Coverage** → Providers differ in their role – some cover more patients, while others handle higher-cost cases.  
- **Hospital Performance** → Certain hospitals stand out with higher **average billing per patient**, not just higher patient volumes.  

---

## 🚀 How to Use
1. Clone the repository:  
   ```bash
   git clone https://github.com/manishrajpurohit1108/SQL-Project.git
   ```

   OR download all the files manually from the repository.

2. Import [Project_Table_Schema.sql](https://github.com/manishrajpurohit1108/SQL-Project/blob/main/Project%20Table%20Schema.sql) into MySQL to create the database.
3. Load [healthcare_dataset_updated.csv](https://github.com/manishrajpurohit1108/SQL-Project/blob/main/healthcare_dataset_updated.csv) into the created table.
4. Run queries from [MySQL_Project_Queries.sql](https://github.com/manishrajpurohit1108/SQL-Project/blob/main/MySQL%20Project%20Queries.sql) to reproduce the analysis.
5. Refer to [Healthcare Analytics Project.pdf](https://github.com/manishrajpurohit1108/SQL-Project/blob/main/Healthcare%20Analytics%20Project.pdf) for insights, screenshots, and results.

---

## 🎯 Conclusion

This project showcases how SQL can transform raw healthcare data into actionable insights. By applying queries involving grouping, aggregation, ranking, and filtering, we extracted trends in patients, billing, medical conditions, and hospital performance.
