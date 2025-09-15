# Database creation
-- Created Database
CREATE DATABASE sql_project_healthcare;

-- Making sure to use correct database
USE sql_project_healthcare;

--------------------------------------------------------------------------------
# Created Table 'healthcare'

CREATE TABLE healthcare(
    recordId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    bloodType VARCHAR(5),
    medicalCondition VARCHAR(100),
    dateOfAdmission DATE,
    doctor VARCHAR(100),
    hospital VARCHAR(100),
    insuranceProvider VARCHAR(100),
    billingAmount DECIMAL(10,2),
    roomNumber VARCHAR(10),
    admissionType VARCHAR(20),
    dischargeDate DATE,
    medication VARCHAR(200),
    testResults VARCHAR(50)
);
--------------------------------------------------------------------------------
# Imported Data

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/healthcare_dataset_updated.csv'
INTO TABLE project_dataset
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(name, @age, gender, bloodType, medicalCondition, @dateOfAdmission, doctor, hospital, 
insuranceProvider, @billingAmount, roomNumber, admissionType, @dischargeDate, medication, testResults)
SET
    age = NULLIF(TRIM(@age), ''),
    billingAmount = NULLIF(TRIM(@billingAmount), ''),
    dateOfAdmission = STR_TO_DATE(TRIM(@dateOfAdmission), '%d-%m-%Y'),
    dischargeDate = STR_TO_DATE(TRIM(@dischargeDate), '%d-%m-%Y');

--------------------------------------------------------------------------------
# Data exploration
-- Checking if complete data has been imported/loaded successfully
SELECT COUNT(*) from healthcare;

-- Checked first few rows of dataset
SELECT * from healthcare limit 10;

--------------------------------------------------------------------------------
# Data cleaning and preparation
-- Checked column types and nullability
DESCRIBE healthcare;

-- Checked if dataset has any NULLs 
SELECT 
CASE WHEN COUNT(*) > 0 THEN 'Dataset has NULLs' 
ELSE 'No NULLs in dataset' 
END AS null_status
FROM healthcare
WHERE recordId IS NULL
   OR `name` IS NULL
   OR age IS NULL
   OR gender IS NULL
   OR bloodType IS NULL
   OR medicalCondition IS NULL
   OR dateOfAdmission IS NULL
   OR doctor IS NULL
   OR hospital IS NULL
   OR insuranceProvider IS NULL
   OR billingAmount IS NULL
   OR roomNumber IS NULL
   OR admissionType IS NULL
   OR dischargeDate IS NULL
   OR medication IS NULL
   OR testResults IS NULL;

-- (no nulls found)
   
--------------------------------------------------------------------------------
