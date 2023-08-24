CREATE TABLE Cases (
  CaseNo CHAR(7) NOT NULL,
  Entry_date DATE
  );

SELECT
  CaseNo,
  Entry_date,
  (SELECT MIN(Entry_date) FROM Cases subc WHERE subc.CaseNo=c.CaseNo GROUP BY CaseNo) AS MinEntryDate
FROM Cases c;

WITH CasesMinEntryDate(CaseNo, MinEntryDate) AS 
(
  SELECT CaseNo, MIN(Entry_date) FROM Cases GROUP BY CaseNo
)
SELECT
  c.CaseNo,
  Entry_date,
  MinEntryDate
FROM Cases c
INNER JOIN CasesMinEntryDate cmed ON c.CaseNo=cmed.CaseNo;

Select Min(Entry_date-1) from Cases;