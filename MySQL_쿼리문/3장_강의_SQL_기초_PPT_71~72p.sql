-- [문제] 제한 조건 연습

/*
1. DDL 실습에서 생성된 DEPT3 테이블을 DEPARTMENTS 테이블을 이용하여 생성하라.
데이터도 포함하여야 한다. ID열을 사용하여 DEPT3 테이블에 대한 PRIMARY KEY 제약조건을 생성한다. 제약조건의 이름은 my_dept_id_pk로 지정한다.
*/
create table dept3 as
select department_id id, department_name name
from departments;

alter table dept3
add primary key(id);

/*
2. DDL 실습2번 문제에 따라 EMP3 테이블을 생성하라. 단, 테이블 생성시 ID 컬럼을 기본키로 설정하라.
외래키는 설정하지 않는다. 만약 테이블이 존재한다면 삭제한 후 생성하라. 기본키 제한조건 이름은 EMP3_ID_PK로 하라.
*/
create table emp3 (
id int,
last_name varchar(25),
first_name varchar(25),
dept_id int UNSIGNED
);

alter table emp3
add PRIMARY KEY(id);

/*
3. 존재하지 않는 부서(DEPT3)에 사원이 할당되지 않도록 하는 외래키 참조를 EMP3 테이블에 추가한다.
제약 조건 이름은 my_emp_dept_id로 한다. 부서가 삭제되면, 해당 부서에 소속되었던 사원의 소속부서의 정보는 NULL로 설정되도록 하라.
*/
alter table emp3
add constraint my_emp_dept_id foreign key(dept_id) references dept3(id) on delete set null;

/*
4. DEPT3 테이블에 MANAGER_ID 컬럼을 추가하라. 이 컬럼은 EMP3 테이블의 ID를 참조한다.
존재하지 않는 사원이 할당되지 않도록 보장하라.
*/
alter TABLE dept3
add manager_id int references emp3(id);

/*
5. EMP3 테이블을 수정한다. 데이터유형이 NUMBER이고 전체 자릿수 2, 소수점 이하 자릿수가 2인 COMMISSION 열을 추가한다.
COMMISSION 열 값은 항상 0보다 크거나 같도록 제한 조건을 설정한다.
*/
alter table emp3
add commission numeric(2,2) check(commission >= 0);

-- 6. DEPT3 테이블을 삭제하라. 삭제 가능한가? 삭제할 수 없다면 그 이유를 써라.
drop table dept3; -- 참조 무결성

/*
7. DEPT3의 Primary key 제한조건의 이름을 확인하여, 이 제한조건을 삭제하라.
삭제 가능한가? 삭제할 수 없다면 그 이유를 써라.MY_DEPT_ID_PK
*/
alter table dept3
drop primary key; -- 참조 무결성

-- 8. EMP3에 설정되어 있는 외래키 제한조건을 삭제하라.
alter table emp3
drop constraint my_emp_dept_id;

-- 9. DEPT3의 Primary key 제한조건을 삭제하라. 이제는 삭제 가능한가?
alter table dept3
drop primary key;

-- 10. DEPT3 테이블을 삭제하라. 이제는 삭제가 가능한가?
drop table dept3;
drop table emp3;