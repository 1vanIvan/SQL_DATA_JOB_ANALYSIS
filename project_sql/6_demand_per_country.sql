SELECT
    job_postings_fact.job_country,
    COUNT(job_postings_fact.job_id) AS demand_count
FROM
    job_postings_fact
WHERE
    job_postings_fact.job_country IS NOT NULL
    AND job_postings_fact.job_title_short = 'Data Analyst'
    AND salary_year_avg BETWEEN 30000 AND 336500
GROUP BY
    job_postings_fact.job_country
ORDER BY
    demand_count DESC;
