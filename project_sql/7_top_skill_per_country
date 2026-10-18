-- Results do not include postings without related skill_id

WITH skill_demand AS (
    SELECT
        job_postings_fact.job_country AS country,
        skills_dim.skills AS skill,
        COUNT(DISTINCT job_postings_fact.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_postings_fact.job_country IS NOT NULL
          AND job_postings_fact.job_title_short = 'Data Analyst'
          AND salary_year_avg BETWEEN 30000 AND 336500
    GROUP BY
        job_postings_fact.job_country,
        skills_dim.skills
),
ranked_skills AS (
    SELECT
        country,
        skill,
        demand_count,
        RANK() OVER (
            PARTITION BY country
            ORDER BY demand_count DESC
        ) AS skill_rank
    FROM skill_demand
)
SELECT
    country,
    skill AS demanded_skill,
    demand_count
FROM ranked_skills
WHERE skill_rank = 1
ORDER BY demand_count DESC
LIMIT 10;
