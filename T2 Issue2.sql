DELETE FROM programme_participation
WHERE
    completion_date < start_date
    AND completion_date IS NOT NULL;