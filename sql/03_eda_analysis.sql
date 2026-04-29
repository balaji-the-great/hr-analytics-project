-- ============================================================
-- HR Analytics Project by Balaji
-- File 03: Exploratory Data Analysis (EDA)
-- ============================================================

USE hr_analytics;

-- -----------------------------------------------
-- 1. OVERALL COMPANY SNAPSHOT
-- -----------------------------------------------
SELECT
    COUNT(*)                                          AS total_employees,
    SUM(Attrition = 'Yes')                           AS total_attrition,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(Age), 1)                               AS avg_age,
    ROUND(AVG(MonthlyIncome), 0)                     AS avg_monthly_income,
    ROUND(AVG(YearsAtCompany), 1)                    AS avg_years_at_company
FROM employees;

-- -----------------------------------------------
-- 2. ATTRITION BY DEPARTMENT
-- -----------------------------------------------
SELECT
    Department,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- -----------------------------------------------
-- 3. ATTRITION BY JOB ROLE
-- -----------------------------------------------
SELECT
    JobRole,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate_pct DESC;

-- -----------------------------------------------
-- 4. SALARY ANALYSIS BY DEPARTMENT
-- -----------------------------------------------
SELECT
    Department,
    ROUND(MIN(MonthlyIncome), 0)   AS min_salary,
    ROUND(AVG(MonthlyIncome), 0)   AS avg_salary,
    ROUND(MAX(MonthlyIncome), 0)   AS max_salary
FROM employees
GROUP BY Department
ORDER BY avg_salary DESC;

-- -----------------------------------------------
-- 5. GENDER DISTRIBUTION
-- -----------------------------------------------
SELECT
    Gender,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                             AS avg_salary
FROM employees
GROUP BY Gender;

-- -----------------------------------------------
-- 6. AGE GROUP ANALYSIS
-- -----------------------------------------------
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END                                                       AS age_group,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY age_group
ORDER BY age_group;

-- -----------------------------------------------
-- 7. OVERTIME IMPACT ON ATTRITION
-- -----------------------------------------------
SELECT
    OverTime,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY OverTime;

-- -----------------------------------------------
-- 8. JOB SATISFACTION ANALYSIS
-- -----------------------------------------------
SELECT
    JobSatisfaction,
    CASE JobSatisfaction
        WHEN 1 THEN 'Low'
        WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High'
        WHEN 4 THEN 'Very High'
    END                                                       AS satisfaction_label,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- -----------------------------------------------
-- 9. WORK LIFE BALANCE VS ATTRITION
-- -----------------------------------------------
SELECT
    WorkLifeBalance,
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad'
        WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better'
        WHEN 4 THEN 'Best'
    END                                                       AS balance_label,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- -----------------------------------------------
-- 10. YEARS AT COMPANY VS ATTRITION
-- -----------------------------------------------
SELECT
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2  THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5  THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END                                                       AS tenure_group,
    COUNT(*)                                                  AS total,
    SUM(Attrition = 'Yes')                                   AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)     AS attrition_rate_pct
FROM employees
GROUP BY tenure_group
ORDER BY attrition_rate_pct DESC;
