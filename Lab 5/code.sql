create database employee_211;
use employee_211;

create table project_211(
	pno int primary key,
	ploc varchar(20),
	pname varchar(20)
);
create table dept_211(
	deptno int primary key,
	dname varchar(30),
	dloc varchar(30)
);
create table employee_211(
	empno int primary key,
	ename varchar(20),
	mgr_no int,
	hiredate date,
	sal double,
	deptno int,
	foreign key(deptno) references dept_211(deptno)
);

create table assigned_to_211(
	empno int,
	pno int,
	job_role varchar(20),
	primary key(empno,pno),
	foreign key(empno) references employee_211(empno),
	foreign key(pno) references project_211(pno)
);
create table incentives_211(
	empno int,
	incentive_date date,
	incentive_amount double,
	primary key(incentive_date),
	foreign key(empno) references employee_211(empno)
);
insert into project_211 values
	(1,"bengaluru","abcd"),
	(2,"hyderabad","bcda"),
	(3,"bengaluru","abab"),
	(4,"bengaluru","baba"),
	(5,"hyderabad","cdcd"),
    (6,"mysuru","retr");
insert into dept_211 values
	(1,"cse","bengaluru"),
	(2,"ise","hyderabad"),
	(3,"ece","bengaluru"),
	(4,"ete","bengaluru"),
	(5,"ime","bengaluru");
insert into employee_211 values 
	(1,"a",null,"2023-11-9",70000,1),
	(2,"b",2,"2023-8-9",70000,1),
	(3,"c",3,"2023-6-8",70000,2),
	(4,"d",null,"2023-8-6",70000,2),
	(5,"e",null,"2023-5-4",70000,3),
    (6,"f",null,"2023-11-7",80000,4);
insert into assigned_to_211 values
	(1,1,"employee"),
	(2,1,"manager"),
	(3,2,"manager"),
	(4,3,"employee"),
	(5,4,"employee"),
    (6,6,"employee");

insert into incentives_211 values
	(1,"2023-12-9",10000),
	(2,"2023-8-9",10000),
	(3,"2023-6-8",10000),
	(4,"2023-5-4",10000),
	(5,"2023-12-8",10000);

select empno from employee_211 
where deptno in (select deptno from dept_211 where dloc in ("bengaluru","hyderabad","mysuru"));

select empno from employee_211 
where empno not in (select empno from incentives_211);


select a.empno,c.empno,a.ename,a.deptno,c.job_role,b.dloc,d.ploc from employee_211 a,dept_211 b,assigned_to_211 c,project_211 d
where a.deptno=b.deptno and d.pno=c.pno and b.dloc=d.ploc and a.empno=c.empno;
