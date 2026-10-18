-- Bottom 1% and Top 1% quartile for remote data analyst postings
SELECT Q.salary_quartile, MAX(Q.salary_year_avg) AS quartile_break
FROM
    (SELECT *,
        NTILE(100) OVER (ORDER BY job_postings_fact.salary_year_avg) AS salary_quartile
     FROM job_postings_fact
     WHERE job_postings_fact.salary_year_avg IS NOT NULL AND
           job_postings_fact.job_work_from_home = TRUE AND
           job_postings_fact.job_title_short = 'Data Analyst') AS Q
WHERE Q.salary_quartile IN (1,99)
GROUP BY Q.salary_quartile;



-- Bottom 1% and Top 1% quartile for data analyst postings (remote/non-remote)
SELECT Q.salary_quartile, MAX(Q.salary_year_avg) AS quartile_break
FROM
    (SELECT *,
        NTILE(100) OVER (ORDER BY job_postings_fact.salary_year_avg) AS salary_quartile
     FROM job_postings_fact
     WHERE job_postings_fact.salary_year_avg IS NOT NULL AND
           job_postings_fact.job_title_short = 'Data Analyst') AS Q
WHERE Q.salary_quartile IN (1,99)
GROUP BY Q.salary_quartile;

-- remote
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND
      job_work_from_home = TRUE AND
      salary_year_avg BETWEEN 31500 AND 524000
ORDER BY salary_year_avg DESC;


-- remote/non-remote
SELECT *
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND
      salary_year_avg BETWEEN 30000 AND 336500
ORDER BY salary_year_avg DESC;