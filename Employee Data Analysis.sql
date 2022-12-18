create database emp_data;
use emp_data;

/* create an employee table */
create table emp_table(
		employee_id varchar(10),
        emp_first_name varchar(15),
        emp_last_name varchar(15),
        job_id varchar(10),
        salary int,
        manager_id char(5),
        department_id char(5));
        
/* first name and salary of the employee whose salary is higher than the employee with the last name Kumar */
select emp_first_name, salary
from emp_data.emp_table
where salary>( select salary 
				from emp_data.emp_table
                where emp_last_name ='kumar');
                
/*employee id and last name of the employee whose salary is greater than the average salary */
select employee_id, emp_last_name
from emp_data.emp_table
where salary > (select avg(salary) from emp_data.emp_table);

/*employee id, first name, and salary of the employees who earn a salary that is higher than the salary
of all the shipping clerks (JOB_ID = HP122). Sort the results of the salary in ascending order.*/
select employee_id, emp_first_name, salary
from emp_data.emp_table
where salary > (select salary 
				from emp_data.emp_table
                where job_id ='HP122')
                order by salary asc;

/*Write a query to display the first name, employee id, and salary of the first three employees with highest salaries.*/
select emp_first_name, employee_id, salary
from emp_data.emp_table
order by salary desc 
limit 3;
