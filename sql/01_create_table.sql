-- ============================================================
-- HR Analytics Project by Balaji
-- File 01: Create Database & Table
-- ============================================================

CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    EmployeeID          INT PRIMARY KEY,
    Age                 INT,
    Attrition           VARCHAR(5),
    BusinessTravel      VARCHAR(30),
    DailyRate           INT,
    Department          VARCHAR(50),
    DistanceFromHome    INT,
    Education           INT,          -- 1=Below College, 2=College, 3=Bachelor, 4=Master, 5=Doctor
    EducationField      VARCHAR(50),
    EmployeeCount       INT,
    EnvironmentSatisfaction INT,      -- 1=Low, 2=Medium, 3=High, 4=Very High
    Gender              VARCHAR(10),
    HourlyRate          INT,
    JobInvolvement      INT,          -- 1=Low, 2=Medium, 3=High, 4=Very High
    JobLevel            INT,
    JobRole             VARCHAR(50),
    JobSatisfaction     INT,          -- 1=Low, 2=Medium, 3=High, 4=Very High
    MaritalStatus       VARCHAR(15),
    MonthlyIncome       INT,
    MonthlyRate         INT,
    NumCompaniesWorked  INT,
    Over18              VARCHAR(3),
    OverTime            VARCHAR(5),
    PercentSalaryHike   INT,
    PerformanceRating   INT,          -- 1=Low, 2=Good, 3=Excellent, 4=Outstanding
    RelationshipSatisfaction INT,
    StandardHours       INT,
    StockOptionLevel    INT,
    TotalWorkingYears   INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance     INT,          -- 1=Bad, 2=Good, 3=Better, 4=Best
    YearsAtCompany      INT,
    YearsInCurrentRole  INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
