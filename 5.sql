USE pandemic;

DROP FUNCTION IF EXISTS calculate_year_difference;

DELIMITER //

CREATE FUNCTION calculate_year_difference(input_year INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE diff_years INT;
    SET diff_years = TIMESTAMPDIFF(YEAR, MAKEDATE(input_year, 1), CURDATE());
    RETURN diff_years;
END //

DELIMITER ;

SELECT 
    Year,
    MAKEDATE(Year, 1) AS start_of_year_date,
    CURDATE() AS current_date_val,
    calculate_year_difference(Year) AS year_difference
FROM infectious_cases_normalized;
