-- 1. 다음 테이블 instance 차트를 기반으로 DEPT3 테이블을 생성한다.
create table dept3 (
	id integer primary key,
    name varchar(25)
);

-- 2. 다음 테이블 instance 차트를 기반으로 EMP3 테이블을 생성한다.
create table emp3 (
	id integer,
    last_name varchar(25),
    first_name varchar(25),
    dept_id integer,
    foreign key(dept_id) references dept3(id)
);

/* 3. employees 테이블의 구조를 기반으로 employees2 테이블을 생성한다. 
employee_id, first_name, last_name, salary, department_id 만 포함시키며
열 이름을 각각 id, first_name, last_name, salary, dept_id로 지정한다. 테이블 구조만 생성하고 데이터를 가져오지 않는다.*/
create table employees2 (
	id integer,
    first_name VARCHAR(25),
    last_name varchar(25),
    salary varchar(25),
    department_id integer
);

-- 4. 다음과 같이 긴 성을 입력할 수 있도록 emp3 테이블을 수정한다.
alter table emp3
modify last_name varchar(50);

/*5. emp3 테이블에 loc라는 컬럼을 추가하라. varchar2 데이터 타입이어야 하며, 최대 길이 10을 가진다.
디폴트 값으로 'LA' 값을 입력한다.*/
alter table emp3
add column loc varchar(10) default 'LA';

-- 6. emp3의 loc 컬럼이름을 loc2로 변경하라.
alter table emp3
rename column loc to loc2;

-- 7. employees2 테이블에서 first_name 열을 삭제한다. 삭제되었음을 확인한다.
alter table employees2
drop column first_name;

-- 8. dept3 테이블의 id 컬럼을 삭제한다. 삭제가 불가능하다면, 가능하도록 해라.
alter table emp3
drop CONSTRAINT emp3_ibfk_1;

alter table dept3 drop column id;

-- 9. emp3 테이블을 삭제한다.
drop table emp3;