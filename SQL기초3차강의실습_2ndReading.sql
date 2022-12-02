/*
1-3 : salary number(8, 2)를 하지 않음. (-0.2) 1-7 : 테이블 명 오류. (-0.2) 3-2, 3-10 : salary 값 오류(각 -0.2) 3-9 : commit을 하지 않음.(-0.2)
*/

--3.4 연습(DDL)
--1. 다음 테이블 instance 차트를 기반으로 DEPT3 테이블을 생성한다.
create table dept3(
    id number(7) primary key,
    name varchar2(25)
);

--2. 다음 테이블 instance 차트를 기반으로 EMP3 테이블을 생성한다.
create table emp3(
    id number(7),
    last_name varchar(25),
    first_name varchar(25),
    dept_id number(7),
    foreign key(dept_id) references dept3(id)
);

/* 3. employees 테이블의 구조를 기반으로 employees2 테이블을 생성한다. 
employee_id, first_name, last_name, salary, department_id 만 포함시키며
열 이름을 각각 id, first_name, last_name, salary, dept_id로 지정한다. 테이블 구조만 생성하고 데이터를 가져오지 않는다.*/
create table employees2(
    id number(6),
    first_name varchar2(20),
    last_name varchar2(25),
    salary number(8, 2),
    dept_id number(4)
);

--4. 다음과 같이 긴 성을 입력할 수 있도록 emp3 테이블을 수정한다.
alter table emp3 modify last_name varchar2(50);

/*5. emp3 테이블에 loc라는 컬럼을 추가하라. varchar2 데이터 타입이어야 하며, 최대 길이 10을 가진다.
디폴트 값으로 'LA' 값을 입력한다.*/
alter table emp3 add loc varchar2(10) default 'LA';

--6. emp3의 loc 컬럼이름을 loc2로 변경하라.
alter table emp3 rename column loc to loc2;

--7. employees2 테이블에서 first_name 열을 삭제한다. 삭제되었음을 확인한다.
alter table employees2 drop column first_name;

--8. dept3 테이블의 id 컬럼을 삭제한다. 삭제가 불가능하다면, 가능하도록 해라.
alter table emp3 drop column dept_id;
alter table dept3 drop column id;

--9. emp3 테이블을 삭제한다.
drop table emp3;
drop table dept3;
--[문제] 제한 조건 연습

/*
1. DDL 실습에서 생성된 DEPT3 테이블을 DEPARTMENTS 테이블을 이용하여 생성하라.
데이터도 포함하여야 한다. ID열을 사용하여 DEPT3 테이블에 대한 PRIMARY KEY 제약조건을 생성한다. 제약조건의 이름은 my_dept_id_pk로 지정한다.
*/
create table dept3 as
select department_id id, department_name name
from departments;

alter table dept3 add constraints my_dept_id_pk primary key(id);

/*
2. DDL 실습2번 문제에 따라 EMP3 테이블을 생성하라. 단, 테이블 생성시 ID 컬럼을 기본키로 설정하라.
외래키는 설정하지 않는다. 만약 테이블이 존재한다면 삭제한 후 생성하라. 기본키 제한조건 이름은 EMP3_ID_PK로 하라.
*/
create table emp3(
    id number(7) constraints emp3_id_pk primary key,
    last_name varchar(25),
    first_name varchar(25),
    dept_id number(7)
);

/*
3. 존재하지 않는 부서(DEPT3)에 사원이 할당되지 않도록 하는 외래키 참조를 EMP3 테이블에 추가한다.
제약 조건 이름은 my_emp_dept_id로 한다. 부서가 삭제되면, 해당 부서에 소속되었던 사원의 소속부서의 정보는 NULL로 설정되도록 하라.
*/
alter table emp3
add constraints my_emp_dept_id foreign key(dept_id) references dept3(id) on delete set null;

/*
4. DEPT3 테이블에 MANAGER_ID 컬럼을 추가하라. 이 컬럼은 EMP3 테이블의 ID를 참조한다.
존재하지 않는 사원이 할당되지 않도록 보장하라.
*/
alter table dept3 add manager_id references emp3(id);

/*
5. EMP3 테이블을 수정한다. 데이터유형이 NUMBER이고 전체 자릿수 2, 소수점 이하 자릿수가 2인 COMMISSION 열을 추가한다.
COMMISSION 열 값은 항상 0보다 크거나 같도록 제한 조건을 설정한다.
*/
alter table emp3
add commission number(2, 2) check(0<=commission);

-- 6. DEPT3 테이블을 삭제하라. 삭제 가능한가? 삭제할 수 없다면 그 이유를 써라.
drop table dept3;
--참조 무결성 제약조건

/*
7. DEPT3의 Primary key 제한조건의 이름을 확인하여, 이 제한조건을 삭제하라.
삭제 가능한가? 삭제할 수 없다면 그 이유를 써라.MY_DEPT_ID_PK
*/
alter table dept3
drop constraints MY_DEPT_ID_PK;--참조무결성

-- 8. EMP3에 설정되어 있는 외래키 제한조건을 삭제하라.
alter table emp3
drop constraints MY_EMP_DEPT_ID;

-- 9. DEPT3의 Primary key 제한조건을 삭제하라. 이제는 삭제 가능한가?
alter table dept3
drop constraints MY_DEPT_ID_PK;

-- 10. DEPT3 테이블을 삭제하라. 이제는 삭제가 가능한가?
drop table dept3;