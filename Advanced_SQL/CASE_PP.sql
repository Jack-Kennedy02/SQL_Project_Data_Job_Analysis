SELECT
    job_id,
    job_title,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High salary'
        WHEN salary_year_avg >= 60000 THEN 'Standard salary'
        WHEN salary_year_avg < 60000 THEN 'Low salary'
    END AS Type_of_Salary
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC

SELECT DISTINCT
   COUNT(
    DISTINCT CASE 
            WHEN job_work_from_home = TRUE THEN company_id
        END) AS wfh_companies,
    COUNT(
        DISTINCT CASE
            WHEN job_work_from_home = FALSE THEN company_id
        END) AS non_wfh_companies
FROM
    job_postings_fact;

SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Manager%' OR job_title ILIKE '%Lead%' THEN 'Manager/Lead'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home THEN 'Yes'
        ELSE 'No'
    END AS remote_option
FROM 
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL
ORDER BY
    job_id;