-- INSTR function example
DECLARE
  main_string VARCHAR2(100) := 'Hello, my name is John.';
  substring VARCHAR2(20) := 'name';
  position NUMBER;
BEGIN
  position := INSTR(main_string, substring);
  DBMS_OUTPUT.PUT_LINE('Position of the substring: ' || position);
END;
/

-- SUBSTR function example
DECLARE
  source_string VARCHAR2(100) := 'Hello, my name is John.';
  start_position NUMBER := 13;
  substring_length NUMBER := 4;
  extracted_substring VARCHAR2(100);
BEGIN
  extracted_substring := SUBSTR(source_string, start_position, substring_length);
  DBMS_OUTPUT.PUT_LINE('Extracted substring: ' || extracted_substring);
END;
