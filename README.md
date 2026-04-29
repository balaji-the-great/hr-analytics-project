# HR Employee Attrition Analysis

Analyzing why employees leave — using SQL for data exploration and Tableau for visualization.

\---

## Tools Used

* **MySQL** — data storage \& querying
* **Tableau Public** — interactive dashboard (`.twb` file included)
* **Dataset** — 1,470 employees, 35 columns (IBM HR Analytics style)

\---

## Project Structure

```
hr-analytics-project/
│
├── dataset/
│   ├── HR\_Analytics.csv              # Raw dataset
│
├── sql/
│   ├── 01\_create\_table.sql           # Schema setup
│   ├── 02\_import\_data.sql            # Import CSV into MySQL
│   ├── 03\_eda\_analysis.sql           # Exploratory analysis (10 queries)
│   └── 04\_advanced\_insights.sql      # Business insights (6 deep-dive queries)
│
├── HR\_Attrition\_Dashboard.twb        # Tableau workbook (open with Tableau)
└── README.md
```

\---

## Key Findings

|Finding|Detail|
|-|-|
|Overall attrition rate|\~16% (above 10–12% industry benchmark)|
|Highest attrition dept|Sales at \~22%|
|Overtime employees|2× more likely to leave|
|Low salary band (<₹3K)|35%+ attrition rate|
|New joiners (≤2 years)|\~30% attrition — highest risk group|

\---

## How to Open the Tableau Dashboard

1. Download the repo
2. Open **Tableau Desktop** or **Tableau Public** (free)
3. Open `HR\_Attrition\_Dashboard.twb`
4. When prompted for data source → point it to `dataset/HR\_Analytics.csv`
5. All 10 sheets + dashboard will load automatically ✅

Pre-built calculated fields included:

* `Attrition Flag` — 1 for Yes, 0 for No
* `Attrition Rate %` — percentage per group
* `Age Group`, `Salary Band`, `Tenure Group` — custom segments
* `Job Satisfaction Label`, `Work Life Balance Label` — readable labels

\---

## How to Run SQL Queries

```sql
source sql/01\_create\_table.sql
source sql/02\_import\_data.sql
source sql/03\_eda\_analysis.sql
source sql/04\_advanced\_insights.sql
```

\---

## Tableau Public Dashboard

> 🔗 \[View live Dashboard](https://public.tableau.com/app/profile/balaji.balaji1098/viz/HREmployeeAttritionAnalysis\_17774765365830/Dashboard1)

## Business Recommendation

> Employees in Sales with low salary + overtime show the highest attrition. Prioritizing salary revision and overtime monitoring for this group could significantly reduce turnover.

\---

Made by [Balaji](https://github.com/balaji-the-great)

