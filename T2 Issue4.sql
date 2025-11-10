-- Strategy 1: Flag for exclusion
ALTER TABLE financials ADD COLUMN has_complete_data BOOLEAN;

UPDATE financials
SET
    has_complete_data = CASE
        WHEN revenue IS NOT NULL
        AND employees IS NOT NULL THEN TRUE
        ELSE FALSE
    END;