SELECT
    skills_dim.skills
FROM
    skills_dim
INNER JOIN(
    SELECT
        skill_id,
        COUNT(job_id) AS skill_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
    ORDER BY
        COUNT(job_id) DESC
    LIMIT 5
    ) AS top_skills ON skills_dim.skill_id = top_skills.skill_id
ORDER BY top_skills.skill_count DESC;

SELECT
    company_id,
    name,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size

FROM(
    SELECT
        company_dim.company_id,
        company_dim.name,
        COUNT(job_postings_fact.job_id) AS job_count
    FROM
        company_dim
    INNER JOIN
        job_postings_fact ON company_dim.company_id = job_postings_fact.company_id
    GROUP BY
        company_dim.company_id,
        company_dim.name
)
    AS company_job_count;

SELECT
    company_dim.name
FROM
    company_dim
INNER JOIN (
    SELECT
        company_id,
        AVG(salary_year_avg) AS avg_salary
    FROM
        job_postings_fact
    GROUP BY
        company_id
) AS company_salaries ON company_dim.company_id = company_salaries.company_id
WHERE
    company_salaries.avg_salary > (
        SELECT 
            AVG(salary_year_avg)
        FROM
            job_postings_fact
    );