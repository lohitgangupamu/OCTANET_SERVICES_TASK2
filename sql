-- 1. Add new employee John Doe to IT (dept_id = 60)
INSERT INTO employees (
  employee_id, first_name, last_name, email, phone_number,
  hire_date, job_id, salary, department_id
) VALUES (
  300, 'John', 'Doe', 'JDOE', '123.456.7890',
  SYSDATE, 'IT_PROG', 6000, 60
);
ROLLBACK;

-- 2. Give 10% raise to IT Programmers
UPDATE employees
SET salary = salary * 1.1
WHERE job_id = 'IT_PROG';
ROLLBACK;

-- 3. Move employee 103 to Sales (dept_id = 80)
UPDATE employees
SET department_id = 80
WHERE employee_id = 103;
ROLLBACK;

-- 4. Remove all Interns
DELETE FROM employees
WHERE job_id = 'INTERN';
ROLLBACK;

-- 5. Fix email for employee 100
UPDATE employees
SET email = 'SKING@oracle.com'
WHERE employee_id = 100;
ROLLBACK;

-- 6. Add new department: Cloud Services (dept_id = 300)
INSERT INTO departments (
  department_id, department_name, manager_id, location_id
) VALUES (
  300, 'Cloud Services', 101, 1700
);
ROLLBACK;

-- 7. Remove unused department 240 (only if no employees)
DELETE FROM departments
WHERE department_id = 240
  AND NOT EXISTS (
    SELECT 1 FROM employees WHERE department_id = 240
  );
ROLLBACK;

-- 8. Set commission_pct to NULL for dept 50
UPDATE employees
SET commission_pct = NULL
WHERE department_id = 50;
ROLLBACK;

-- 9. Raise salary 15% for earners < ₹5000
UPDATE employees
SET salary = salary * 1.15
WHERE salary < 5000;
ROLLBACK;

-- 10. Insert duplicate email to test constraint
INSERT INTO employees (
  employee_id, first_name, last_name, email,
  hire_date, job_id, salary, department_id
) VALUES (
  301, 'Anna', 'Smith', 'JDOE', SYSDATE,
  'IT_PROG', 5000, 60
);
ROLLBACK;

-- 11. Update phone number of employee 104
UPDATE employees
SET phone_number = '999.888.7777'
WHERE employee_id = 104;
ROLLBACK;

-- 12. Delete all employees hired in 2020
DELETE FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2020';
ROLLBACK;

-- 13. Fill missing commissions (set to 0)
UPDATE employees
SET commission_pct = 0
WHERE commission_pct IS NULL;
ROLLBACK;

-- 14. Add new department Training (no manager)
INSERT INTO departments (
  department_id, department_name, location_id
) VALUES (
  301, 'Training', 1700
);
ROLLBACK;

-- 15. Reassign dept 90 employees to 100
UPDATE employees
SET department_id = 100
WHERE department_id = 90;
ROLLBACK;

-- 16. Delete top-earning employee
DELETE FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
ROLLBACK;

-- 17. Promote all sales reps to managers
UPDATE employees
SET job_id = 'SA_MAN'
WHERE job_id = 'SA_REP';
ROLLBACK;

-- 18. Nullify manager_id for dept 60
UPDATE departments
SET manager_id = NULL
WHERE department_id = 60;
ROLLBACK;

-- 19. Insert Meena Rao into Finance (dept 100)
INSERT INTO employees (
  employee_id, first_name, last_name, email, phone_number,
  hire_date, job_id, salary, department_id
) VALUES (
  302, 'Meena', 'Rao', 'MRAO', '987.654.3210',
  SYSDATE, 'FI_ACCOUNT', 7000, 100
);
ROLLBACK;

-- 20. Reduce salary by 5% in Marketing (dept 20)
UPDATE employees
SET salary = salary * 0.95
WHERE department_id = 20;
ROLLBACK;
