--Task 2 Question 2
--Programme completion dates earlier than start dates

DELETE FROM programme_participation
WHERE
    completion_date < start_date
    AND completion_date IS NOT NULL;