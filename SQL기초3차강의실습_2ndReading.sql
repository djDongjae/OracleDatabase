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

--1. DDL 실습에서 생성된 DEPT3 테이블을 DEPARTMENTS 테이블을 이용하여 생성하라.
