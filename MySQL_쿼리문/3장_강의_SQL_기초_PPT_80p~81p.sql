/*
[문제]
실습용으로 주어진 lab_08_01.sql script을 수행하여 MY_EMPLOYEE table을 생성하라. 이 테이블에 대해 아래 작업들을 수행한다.
*/
CREATE TABLE my_employee
  (id  int NOT NULL,
   last_name VARCHAR(25),
   first_name VARCHAR(25),
   userid  VARCHAR(8),
   salary  int);

-- 1. 다음 그림의 첫번째 행을 입력하는 문장을 수행하라. 컬럼이름을 사용하지 말라.
insert into my_employee values (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 2. 두번째 행을 입력하는 문장을 수행하라. 컬럼이름을 사용한다.
insert into my_employee(id, last_name, first_name, userid, salary)
values (2, 'Dancs', 'Betty', 'bdancs', 860);

/*
3. 세번째, 네번째 행들을 입력하는 문장을 수행하라. 컬럼이름 사용 여부는 필요에 따라 결정하라. 5번째 행은 삽입하지 않는다.
*/
insert into my_employee
values (3, 'Biri', 'Ben', 'bbiri', 1100), (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4. 테이블에 데이터가 입력되었는지 확인할 수 있는 문장을 작성하여 수행하라.
select *
from my_employee;

-- 5. 데이터베이스에 영구적으로 반영되도록 보장하는 문장을 수행하라.
commit;

-- 6. 3번째 사원의 성을 Drexler로 수정하라.
update my_employee
set last_name = 'Drexler'
where id=3;

-- 7. $1000보다 적게 버는 사원의 급여를 $1000으로 수정하라.
update my_employee
set salary = 1000
where salary < 1000;

-- 8. 데이터가 제대로 수정되었는지 확인하라.
select *
from my_employee;

-- 9. Betty Dancs를 삭제하라. 수정된 내용을 확인하라. 데이터베이스에 영구적으로 반영되도록 보장하는 문장을 수행하라.
delete from my_employee
where first_name = 'Betty' and last_name = 'Dancs';

-- 10. 5번째 행을 삽입하라. 수정된 내용을 확인하라.
insert into my_employee
values(5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

select *
from my_employee;