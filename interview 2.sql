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

-- inbulit functions 
select count(*) from emp_details;

-- using filtering 
select count(*) from emp_details where emp_id in(101,102,103);

-- avg
select avg(salary) from emp_details where emp_id not in ("HR manager" ,"Data Analyst");

select count(*) as count ,avg(salary) as avgerage from emp_details where emp_id < 106 and emp_id > 100;

-- sum 
select sum(salary) from emp_details where job_desc in ("HR manager" ,"Data Analyst"); 

select sum(emp_id) from emp_details where emp_id like "10%"; 

-- max 
select max(salary) as maximumsalary from emp_details; 

select max(emp_name) as maxcharstr from emp_details;

-- based on the ascii values
-- min  
select min(salary) as minsalary from emp_details; 

select min(emp_name) as minchar from emp_details;

-- standard deviation
select stddev(salary) from emp_details;

-- variance
select variance(salary) from emp_details; 

-- floor ,round ,ceil
select floor(salary) from emp_details where emp_id = 101; 
-- rounds off the number if 30.12 : 30 if it 30.98 : 30

select round(salary) from emp_details where emp_id = 102;
-- rounds of the number based on decimal value

select ceil(salary) from emp_details where emp_id = 102;
-- rounds the number wther greater then or equl to not less

-- string Functions

select * from emp_details;

-- ucase lcase

select ucase(emp_name) as emp_name from emp_details;   

select lcase(emp_name) as emp_name from emp_details;

-- using filtering ucase lcase in not in

select ucase(emp_name) as emp_name from emp_details where emp_id =102;
select lcase(emp_name) as emp_name from emp_details where emp_name  like ("%o%");
select lcase(emp_name) as emp_name from emp_details where emp_name  in ("john");
select lcase(emp_name) as emp_name from emp_details where emp_name  not in ("john");

-- char count
select emp_name, character_length(emp_name) as emp_len,ucase(emp_name) as caps from emp_details;
 
-- concat 
select emp_name,concat("emp  ",emp_name) as concatstr from emp_details; 
select emp_name,concat("RS.",salary,format(salary,0)) from emp_details limit 3;

-- trim
select ltrim(emp_name) as lefttrim from emp_details; 
select rtrim(emp_name) as lefttrim from emp_details; 

-- left and right
select left(emp_name,4) as emp_name from emp_details; 
select right(emp_name,4) as emp_name from emp_details;

-- replace
select replace(emp_name,"venky","kiruthi") from emp_details; 
-- substr
select instr(emp_name,"k") from emp_details where emp_name in("kiruthi");   


-- date 
alter table emp_details add column hire_date date ; 

update emp_details set hire_date = current_timestamp();

select * from emp_details;

select now();

 select current_timestamp(); 

select date(curdate());

select day(curdate());

select current_date();

select Date(now());

select date_format(current_date(),"%d/%m/%y") as Date;

select datediff(curdate(),"2020-10-10");

select day( date_format(current_date(),"%D/%M/%Y") )as Date;

select dayname( curdate());

select month(curdate());

select day(curdate());

select year(current_date());

select date_add(curdate(), interval 1 day) as "dateif" ;

select date_add(curdate(), interval 1 month) as "dateif" ;

select date_add(curdate(), interval 1 year) as "dateif" ;

select date_add(curdate(), interval 1 week) as "dateif" ;

update emp_details set job_desc ="HR" where emp_id between 101 and 103;


update emp_details set job_desc ="manager" where emp_id between 104 and 106;

select * from emp_details;

-- groupby
select job_desc , max(salary) as maximumsalary
from emp_details group by job_desc;


select job_desc , avg(salary) as avgsalary
from emp_details group by job_desc;

select job_desc, avg(salary) as count_emp 
from emp_details where emp_id in("101","102") group by job_desc;

select  job_desc,concat("RS." ,avg(salary)) as emp_avg_salary from
emp_details group by job_desc order by (case job_desc 
when "Data Scientist" then 1
else 100 end);

select job_desc,min(salary) from emp_details
group by job_desc order by (case job_desc
when "HR" then 1
when "Product Manager" then 2
else 100 end
);

select job_desc,count(salary) from emp_details 
where salary>50000 group by job_desc having count(salary)>1 order by 
count(salary) desc 
;

select job_desc,min(salary) as salary from emp_details
group by job_desc having min(salary)>50000
order by min(salary) desc
;