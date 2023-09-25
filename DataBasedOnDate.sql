-- for specified date only
SELECT * FROM beverage WHERE TRUNC(UPDATEDDATE) = TO_DATE('21-09-2023', 'DD-MM-YYYY');

-- for >= specified date
SELECT * FROM beverage WHERE UPDATEDDATE >= TO_DATE('23-09-21', 'YY-MM-DD');

-- for <= specified date
SELECT * FROM beverage WHERE TRUNC(UPDATEDDATE) <= TO_DATE('23-09-21', 'YY-MM-DD');