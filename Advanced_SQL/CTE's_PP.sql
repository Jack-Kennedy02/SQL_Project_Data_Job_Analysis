WITH title_diversity AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS unique_titles
    FROM
        job_postings_fact
    GROUP BY
        company_id
)
SELECT
    company_dim.name,
    title_diversity.unique_titles
FROM
    title_diversity
        INNER JOIN
            company_dim ON title_diversity.company_id = company_dim.company_id
        
ORDER BY
    unique_titles DESC
LIMIT 10;

WITH avg_salaries AS (
    SELECT
        job_country,
        AVG(salary_year_avg) AS avg_salary
    FROM
        job_postings_fact
    GROUP BY
        job_country
)

SELECT
    job_postings.job_id,
    companies.name AS company_name,
    job_postings.salary_year_avg AS salary_rate,
    CASE
        WHEN job_postings.salary_year_avg > avg_salaries.avg_salary THEN 'Above Average'
        ELSE 'Below Aveage'
    END AS salary_category,
    EXTRACT(MONTH FROM job_postings.job_posted_date) AS posting_month
FROM
    job_postings_fact as job_postings
INNER JOIN
    company_dim as companies ON job_postings.company_id = companies.company_id
INNER JOIN
    avg_salaries ON job_postings.job_country = avg_salaries.job_country
ORDER BY
    posting_month DESC;