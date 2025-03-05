# Introduction
Dive into the data job market! Focusing on the top paying jobs, top paying skills, and which skills people shoud be learning with optimality considered.

SQL queries? Check them out here:  [project_sql folder](/Project_SQL/)

# Background
Driven by the a question to find the top-paid and in-demand skills, making it easier for others to view the skills they may need to learn for higher salaries.

Data hails from the [SQL Course](https://lukebarousse.com/sql). It's packed with insights on job titles, salaries, locations, and essential skills.

### The questions this investigation answers:

1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in deamnd for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I used
For the examination of the data analyst job market, the tools used were as follows:

- **SQL:** The backbone of the analysis, allowing the quering of the database and present critical insights.
- **PostgreSQL:**** The chose database management system, ideal for handling the job postings data.
- **Visual Studio Code:** Database management and executing SQL queries.
- **Git & Github:** Essential for version control and sharing SQL scripts, making it available for the public to view and collaboration with peers.

# The Analysis

Each query for this project aimed at investiating specific aspects of the job market.
Here's the approachment method for each question:

### 1. Top Paying Data Analyst Jobs
To identify the top 10 highest-paying Data Analyst roles that are available remotely. Focuses on job postings with specified salaries. Highlighting the top-paying opportunities for Data Analysts, offering insights into employment.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
     salary_year_avg DESC
LIMIT 10;
```
INCLUDE RESULTS


# What I learned

Throughout this porject, I

# Conclusion