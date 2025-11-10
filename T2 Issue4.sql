--Task 2 Question 4
--15% of revenue values missing

ALTER TABLE financials ADD COLUMN has_complete_data BOOLEAN;

UPDATE financials
SET
    has_complete_data = CASE
        WHEN revenue IS NOT NULL
        AND employees IS NOT NULL THEN TRUE
        ELSE FALSE
    END;