/* 
Objective : Write a SQL to get max of salary for each department in separate column


Expected output:
-----------------------------------------------------------------------------------------
MAX_SALARY_DEPTNO_10 | MAX_SALARY_DEPTNO_20 | MAX_SALARY_DEPTNO_30 | MAX_SALARY_DEPTNO_40
-----------------------------------------------------------------------------------------
5000    			 | 3000    				| 2850    			   | 0
-----------------------------------------------------------------------------------------
 */


create table dept(  
  deptno     number(2,0),  
  dname      varchar2(14),  
  loc        varchar2(13),  
  constraint pk_dept primary key (deptno)  
);

-- Insert row into DEPT table using named columns.
insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK');

-- Insert a row into DEPT table by column position.
insert into dept  
values(20, 'RESEARCH', 'DALLAS');

insert into dept  
values(30, 'SALES', 'CHICAGO');

insert into dept  
values(40, 'OPERATIONS', 'BOSTON');


create table emp(  
  empno    number(4,0),  
  ename    varchar2(10),  
  job      varchar2(9),  
  mgr      number(4,0),  
  hiredate date,  
  sal      number(7,2),  
  comm     number(7,2),  
  deptno   number(2,0),  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
);

-- Insert EMP row, using TO_DATE function to cast string literal into an oracle DATE format.
insert into emp  
values(  
 7839, 'KING', 'PRESIDENT', null,  
 to_date('17-11-1981','dd-mm-yyyy'),  
 5000, null, 10  
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-JUL-87','dd-mm-rr') - 85,  
 3000, null, 20  
);

insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-JUL-87', 'dd-mm-rr') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);


/*
__Step by Step Solution__
__Step 1:__
	"dept" LEFT JOIN with "emp" to get sal infromation.
	"dept" table as driving table, because I am interested on every deptno.

__Step 2:__
	using CASE statement derived 4 different columns with respect to deptno.
SELECT 
	 CASE WHEN dept.deptno = 10 THEN sal ELSE 0 END AS salary_deptno_10
	,CASE WHEN dept.deptno = 20 THEN sal ELSE 0 END AS salary_deptno_20
	,CASE WHEN dept.deptno = 30 THEN sal ELSE 0 END AS salary_deptno_30
	,CASE WHEN dept.deptno = 40 THEN sal ELSE 0 END AS salary_deptno_40

FROM dept LEFT JOIN emp  --inner join
	ON emp.deptno = dept.deptno
ORDER BY dname

__Step 3:__
	aggregated previous step result.
 */	

/* Answer */
SELECT 
     MAX(CASE WHEN dept.deptno = 10 THEN sal ELSE 0 END) AS max_salary_deptno_10
    ,MAX(CASE WHEN dept.deptno = 20 THEN sal ELSE 0 END) AS max_salary_deptno_20
    ,MAX(CASE WHEN dept.deptno = 30 THEN sal ELSE 0 END) AS max_salary_deptno_30
    ,MAX(CASE WHEN dept.deptno = 40 THEN sal ELSE 0 END) AS max_salary_deptno_40

FROM dept LEFT JOIN emp  --inner join
    ON emp.deptno = dept.deptno
	
/* 
__Output__
-----------------------------------------------------------------------------------------
MAX_SALARY_DEPTNO_10 | MAX_SALARY_DEPTNO_20 | MAX_SALARY_DEPTNO_30 | MAX_SALARY_DEPTNO_40
-----------------------------------------------------------------------------------------
5000    			 | 3000    				| 2850    			   | 0
-----------------------------------------------------------------------------------------
 */