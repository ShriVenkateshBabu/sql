create database if not exists emp ;

use emp;

create table if not exists emp_details(
emp_id int not null,
emp_name varchar(40) not null,
salary int null,
job_desc varchar(40) null
);

desc emp_details;


INSERT INTO emp_details (emp_id, emp_name, salary, job_desc) 
VALUES 
(101, 'John Doe', 50000, 'Software Engineer'),
(102, 'Jane Smith', 60000, 'HR Manager'),
(103, 'Alice Brown', 55000, 'Data Analyst'),
(104, 'Bob White', 70000, 'Project Manager');

INSERT INTO emp_details (emp_id, emp_name, salary, job_desc) 
VALUES 
(105, 'Alice Green', 60000, 'Data Scientist'),
(106, 'Michael Blue', 70000, 'Product Manager'),
(107, 'Sophia Brown', 65000, 'UI/UX Designer'),
(108, 'Emma White', 55000, 'Marketing Manager'),
(109, 'Liam Black', 75000, 'Sales Executive')
on duplicate key update emp_id=values(emp_id) , emp_name = values(emp_name),salary= values(salary),
job_desc = values(job_desc);
 

alter table emp_details add constraint primary key(emp_id);

select * from emp_details;

select emp_id from emp_details ;

select emp_name from emp_details;

select * from emp_details where salary >= 50000;

select emp_name from emp_details where salary >=50000;

select emp_name from emp_details where salary >=20000 and salary<=90000;

select emp_id,emp_name from emp_details where emp_id > 101 or emp_id <108;

select emp_name from emp_details where emp_id != 102;

select * from emp_details where job_desc in("HR Manager");

select * from emp_details where job_desc not in("HR Manager");

select * from emp_details where salary between 20000 and 70000;

select * from emp_details where salary between 20000 and 70000 limit 2;

select emp_id,emp_name from emp_details where emp_id !=103;

-- like pattern filtering and wildcard % , _ : %(zero or more) ,_(complusory one)
-- check \ whtehter wilcards itseld is present  
select * from emp_details where emp_name like "%e";
select * from emp_details where emp_name like "a%";
select * from emp_details where emp_name like "%o%";
select emp_name from emp_details where emp_name like"__b%";

-- only shows unique values; 
select distinct emp_name from emp_details;

select * from  emp_details order by emp_name;

select * from emp_details order by salary;

select * from emp_details order by salary,emp_name;

-- after comma if we have some duplicates values in my salary then i say order by emp_name;
select * from emp_details where salary>50000 order by salary,emp_name;

select distinct salary,emp_name as employee_name from emp_details order by salary;

select * from emp_details where salary >20000 or salary <90000 order by emp_id;

select emp_name from emp_details where job_desc="HR Manager";

select * from emp_details where emp_name like "%a%" order by emp_name;
-- based on my preferred order;
select * from emp_details order by (
case salary 
when 50000 then 1
when 55000 then 2
when 60000 then 3
else 100 end
),emp_name;
alter table emp_details rename to emp;

alter table emp  rename to emp_details;

alter table emp_details change column emp_name emp_Name varchar(40);

select * from emp_details;

alter table emp_details change column emp_Name emp_name varchar(40);

alter table emp_details modify column emp_name varchar(50);

truncate table emp_details;

show tables;

desc emp_details;

update  emp_details set emp_name = "venky" where emp_id =103;

DELETE FROM  emp_details where emp_id =109;

show databases like "%p";
show databases like "e_%";
SELECT USER();
