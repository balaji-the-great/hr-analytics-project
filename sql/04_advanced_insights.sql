-- ============================================================
-- HR Analytics Project by Balaji
-- File 04: Advanced Insights (Key Business Findings)
-- ============================================================

USE hr_analytics;

-- -----------------------------------------------
-- INSIGHT 1: High-Risk Employee Profile
-- Employees most likely to leave
-- -----------------------------------------------
SELECT
    Department,
    JobRole,
    OverTime,
    CASE
        WHEN MonthlyIncome < 3000  THEN 'Low (<3K)'
        WHEN MonthlyIncome < 6000  THEN 'Medium (3K-6K)'
        WHEN MonthlyIncome < 10000 THEN 'High (6K-10K)'
        ELSE 'Very High (10K+)'
    END                                                        AS salary_band,
    COUNT(*)                                                   AS total,
    SUM(Attrition = 'Yes')                                    AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)      AS attrition_rate_pct
FROM employees
GROUP BY Department, JobRole, OverTime, salary_band
HAVING total >= 10
ORDER BY attrition_rate_pct DESC
LIMIT 15;

-- -----------------------------------------------
-- INSIGHT 2: Salary vs Attrition Salary Bands
-- -----------------------------------------------
SELECT
    CASE
        WHEN MonthlyIncome < 3000  THEN '1. Below 3K'
        WHEN MonthlyIncome < 6000  THEN '2. 3K - 6K'
        WHEN MonthlyIncome < 10000 THEN '3. 6K - 10K'
        ELSE '4. Above 10K'
    END                                                        AS salary_band,
    COUNT(*)                                                   AS total,
    SUM(Attrition = 'Yes')                                    AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)      AS attrition_rate_pct
FROM employees
GROUP BY salary_band
ORDER BY salary_band;

-- -----------------------------------------------
-- INSIGHT 3: Department + Overtime Double Impact
-- -----------------------------------------------
SELECT
    Department,
    OverTime,
    COUNT(*)                                                   AS total,
    SUM(Attrition = 'Yes')                                    AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                              AS avg_income
FROM employees
GROUP BY Department, OverTime
ORDER BY Department, OverTime;

-- -----------------------------------------------
-- INSIGHT 4: Promotion Gap Analysis
-- Employees who haven't been promoted in a long time
-- -----------------------------------------------
SELECT
    CASE
        WHEN YearsSinceLastPromotion = 0  THEN 'Just Promoted'
        WHEN YearsSinceLastPromotion <= 2 THEN '1-2 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '3-5 Years'
        ELSE '5+ Years'
    END                                                        AS promotion_gap,
    COUNT(*)                                                   AS total,
    SUM(Attrition = 'Yes')                                    AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)      AS attrition_rate_pct
FROM employees
GROUP BY promotion_gap
ORDER BY attrition_rate_pct DESC;

-- -----------------------------------------------
-- INSIGHT 5: Education Field vs Attrition
-- -----------------------------------------------
SELECT
    EducationField,
    COUNT(*)                                                   AS total,
    SUM(Attrition = 'Yes')                                    AS attrited,
    ROUND(SUM(Attrition = 'Yes') * 100.0 / COUNT(*), 2)      AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0)                              AS avg_income
FROM employees
GROUP BY EducationField
ORDER BY attrition_rate_pct DESC;

-- -----------------------------------------------
-- INSIGHT 6: Tableau Export Query (All-in-one)
-- Use this query result to connect Tableau
-- -----------------------------------------------
SELECT
    e.*,
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS AgeGroup,
    CASE
        WHEN MonthlyIncome < 3000  THEN 'Low'
        WHEN MonthlyIncome < 6000  THEN 'Medium'
        WHEN MonthlyIncome < 10000 THEN 'High'
        ELSE 'Very High'
    END AS SalaryBand,
    CASE
        WHEN YearsAtCompany BETWEEN 0 AND 2  THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5  THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS TenureGroup,
    CASE JobSatisfaction
        WHEN 1 THEN 'Low' WHEN 2 THEN 'Medium'
        WHEN 3 THEN 'High' WHEN 4 THEN 'Very High'
    END AS JobSatisfactionLabel,
    CASE WorkLifeBalance
        WHEN 1 THEN 'Bad' WHEN 2 THEN 'Good'
        WHEN 3 THEN 'Better' WHEN 4 THEN 'Best'
    END AS WorkLifeBalanceLabel
FROM employees e;
