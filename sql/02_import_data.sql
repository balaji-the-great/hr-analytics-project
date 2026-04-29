-- ============================================================
-- HR Analytics Project by Balaji
-- File 02: Import Data
-- ============================================================

USE hr_analytics;

-- Option 1: Load from CSV using LOAD DATA (fastest)
-- Update the file path to match your local system
LOAD DATA INFILE '/path/to/HR_Analytics.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(EmployeeID, Age, Attrition, BusinessTravel, DailyRate, Department,
 DistanceFromHome, Education, EducationField, EmployeeCount,
 EnvironmentSatisfaction, Gender, HourlyRate, JobInvolvement, JobLevel,
 JobRole, JobSatisfaction, MaritalStatus, MonthlyIncome, MonthlyRate,
 NumCompaniesWorked, Over18, OverTime, PercentSalaryHike, PerformanceRating,
 RelationshipSatisfaction, StandardHours, StockOptionLevel, TotalWorkingYears,
 TrainingTimesLastYear, WorkLifeBalance, YearsAtCompany, YearsInCurrentRole,
 YearsSinceLastPromotion, YearsWithCurrManager);

-- Verify import
SELECT COUNT(*) AS total_employees FROM employees;
SELECT * FROM employees LIMIT 5;
