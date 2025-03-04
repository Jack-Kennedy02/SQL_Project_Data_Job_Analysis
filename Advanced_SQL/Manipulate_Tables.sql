CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied
            (job_id,
            application_sent_date,
            custom_resume,
            resume_file_name,
            cover_letter_sent,
            cover_letter_file_name,
            status
            )
VALUES     (1, 
            '2025-02-20', 
            TRUE, 
            'resume_tech.pdf', 
            TRUE, 
            'cover_tech.pdf', 
            'Applied'),
            (2, 
            '2025-02-18',
             FALSE, 
             'resume_general.pdf', 
             FALSE, 
             NULL, 
             'Rejected'),
             (3, 
             '2025-02-15', 
             TRUE, 
             'resume_finance.pdf', 
             TRUE, 
             'cover_finance.pdf', 
             'Interview'),
             (4, 
             '2025-02-10', 
             FALSE, 
             'resume_general.pdf', 
             FALSE, 
             NULL, 
             'No Response'),
             (5, 
             '2025-02-05', 
             TRUE, 
             'resume_data.pdf', 
             TRUE, 
             'cover_data.pdf', 
             'Offer Received'
             );

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied 
SET contact = 'John Doe - HR'
WHERE job_id = 1;

UPDATE job_applied 
SET contact = 'Jane Smith - Recruiter'
WHERE job_id = 2;

UPDATE job_applied 
SET contact = 'Mike Johnson - Hiring Manager'
WHERE job_id = 3;

UPDATE job_applied 
SET contact = 'Emily Davis - Talent Acquisition'
WHERE job_id = 4;

UPDATE job_applied 
SET contact = 'Sarah Wilson - Department Head'
WHERE job_id = 5;

ALTER TABLE job_applied
ALTER COLUMN contact TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact;

SELECT *
FROM job_applied

