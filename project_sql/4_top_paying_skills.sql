SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = TRUE AND
      salary_year_avg BETWEEN 31500 AND 524000
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 25

/*
High-paying skills lean toward data engineering: PySpark, Databricks, Airflow, Kubernetes, and cloud technologies are strongly represented, suggesting that higher salaries are associated with working with large-scale data and infrastructure.
Python and advanced analytics are important: Pandas, NumPy, Jupyter, Scikit-learn, and PySpark show that programming and data-science skills are prominent among higher-paying roles.
The highest-paid roles go beyond traditional analytics: Skills such as Tableau, Excel, and Power BI are common in data analyst jobs, but they don't appear in this top-25 list. The highest salaries are more closely associated with programming, big data, cloud, and engineering technologies.
*/