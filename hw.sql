--1 task 
WITH a as(
select  FIRST_NAME,  SALARY, RANK () OVER (order by salary desc ) rankSal
from HR.EMPLOYEES
where FIRST_NAME like 'A%'
)

select a.FIRST_NAME, a.SALARY from a
where a.rankSal <= 2;


--2 task
with b as(
select  FIRST_NAME, SALARY, DEPARTMENT_NAME, rank()over(PARTITION BY DEPARTMENT_NAME order by SALARY desc) rnk
from hr.EMPLOYEES  q join HR.DEPARTMENTS y on q.DEPARTMENT_ID=y.DEPARTMENT_ID
)
select salary, b.DEPARTMENT_NAME
from b
where rnk=3;

--3 task
select REGIONS.REGION_NAME from REGIONS
minus
select REGIONS.REGION_NAME from REGIONS
where REGION_ID in (
select REGION_ID from COUNTRIES where country_id in (
select country_id from locations where location_id in (
select location_id from DEPARTMENTS where DEPARTMENTS.DEPARTMENT_ID in (
select department_id FROM employees
      WHERE EMPLOYEES.JOB_ID like '%MAN' or EMPLOYEES.JOB_ID like '%MGR'
)
)
)
);


--4 task

with f as(
select a.EMPLOYEE_ID mng , count(a.MANAGER_ID) qty 
from EMPLOYEES a join EMPLOYEES b on a.EMPLOYEE_ID=b.MANAGER_ID
group by a.EMPLOYEE_ID 
)
select REGIONS.REGION_NAME from REGIONS
where REGION_ID in (
select REGION_ID from COUNTRIES where country_id in (
select country_id from locations where location_id in (
select location_id from DEPARTMENTS where DEPARTMENTS.DEPARTMENT_ID in (
select department_id FROM employees where EMPLOYEES.EMPLOYEE_ID in (
select f.mng
from f 
where f.qty in (select MAX(qty)from f))))));









 



