SET SERVEROUTPUT ON;

-- Insert Procedure
CREATE OR REPLACE PROCEDURE insert_emp IS
    p_emp_id NUMBER := 11;
    p_position_id NUMBER := 1;
    p_address_id NUMBER := 1;
    p_first_name VARCHAR(25):= 'Manaf';
    p_last_name VARCHAR(30):= 'Agaev';
    p_email VARCHAR(40) := 'MANAFAGAEV@GMAIL.COM';
    p_birthdate DATE := to_date('12/03/2000','dd/mm/yyyy');
    p_gender CHAR(1) := 'M';
    check_email VARCHAR(40);
BEGIN
    INSERT INTO employee VALUES(p_emp_id, p_first_name, p_last_name, p_birthdate, p_gender, p_email, p_position_id, p_address_id);
END insert_emp;
/


CREATE OR REPLACE PROCEDURE inc_salary IS
BEGIN
    UPDATE employment_history
    SET salary = (salary * 25)/100 + salary
    WHERE salary < 2000;
END inc_salary;
/


-- Procedure call
EXEC insert_emp;
/
EXEC inc_salary;
/

-- DML Trigger
CREATE OR REPLACE TRIGGER alter_emp
   BEFORE INSERT OR DELETE OR UPDATE ON employee
   FOR EACH ROW 
   DECLARE
   date_diff_in_years number;
   v_user varchar2(20);
   BEGIN  
    SELECT (sysdate-:new.birth_date)/365.0, user into date_diff_in_years, v_user from dual;
    IF date_diff_in_years < 18 THEN
        RAISE_APPLICATION_ERROR (num => -20000,msg => 'The Age should be greater than 18');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('DML Trigger called. One Row Deleted By ' ||v_user);
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('DML Trigger called. One Row Updated By ' ||v_user);
    ELSE
        DBMS_OUTPUT.PUT_LINE('DML Trigger called. One Row Inserted By ' ||v_user);
    END IF;
   END;


-- DDL Trigger
CREATE OR REPLACE TRIGGER audit_tr 
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit VALUES (
sysdate, 
sys_context('USERENV','CURRENT_USER'), 
ora_dict_obj_type, 
ora_dict_obj_name, 
ora_sysevent);
END;
/



-- UPDATE employee SET email= 'MANAFAGAEV@GMAIL.COM' WHERE employee_id = 11;
-- DELETE FROM employee WHERE employee_id = 11;
-- CREATE TABLE temp (temp NUMBER);
-- DROP TABLE temp;
-- SELECT * FROM employment_history;
-- DELETE FROM address;
-- DROP SEQUENCE SEQ_ADDRESS;
-- ALTER TABLE employee DROP CONSTRAINT position_pk;
-- DROP TRIGGER alter_emp;

