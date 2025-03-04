(
    SELECT
        job_id,
        job_title,
        'With Salary Info' AS salary_info
    FROM
        job_postings_fact
    WHERE
        salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL
)
UNION ALL
    (SELECT
        job_id,
        job_title,
        'With Salary Info' AS salary_info
    FROM
        job_postings_fact
    WHERE
        salary_year_avg IS NULL OR salary_hour_avg IS NULL
    )
ORDER BY 
    salary_info DESC,
    job_id;

SELECT
    job_postings_q1.job_id,
    job_postings_ql.job_title_short,
    job_postings_q1.job_location,
    job_postings_q1.job_via,
    job_postings_q1.salary_year_avg,
    skills_dim.skills,
    skills_dim.type
FROM
    (
        SELECT *
        FROM
            january_jobs
        UNION ALL
        SELECT *
        FROM
            february_jobs
        UNION ALL 
        SELECT *
        FROM
            march_jobs
    ) as job_postings_q1
LEFT JOIN skills_job_dim ON job_postings_q1.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_q1.salary_year_avg > 70000
ORDER BY
    job_postings_q1.job_id;