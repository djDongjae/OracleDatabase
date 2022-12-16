--질의3-34: 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오.(이하 생략)
create table NewBook(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number);

--질의3-35: 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오.
create table newcustomer(
custid  number   primary key,
name    varchar2(40),
address varchar(40),
phone   varchar(30));

--질의3-36: 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
create table    neworders(
orderid     number,
custid      number      not null,
bookid      number      not null,
saleprice   number,
orderdate   date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

--질의3-37: NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오.
alter table newbook add isbn varchar2(13);

--질의3-38: NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오.
alter table newbook modify isbn number;

--질의3-39: NewBook 테이블의 isbn 속성을 삭제하시오.
alter table newbook drop column isbn;

--질의3-40: NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
alter table newbook modify bookid number not null;

--질의3-41: NewBook 테이블의 bookid 속성을 기본키로 변경하시오.
alter table newbook add primary key(bookid);

--질의3-42: NewBook 테이블을 삭제하시오.
drop table newbook;

--질의3-43: NewCustomer 테이블을 삭제하시오. 만약 삭제가 거절된다면 원인을 파악하고 관련된 테이블을 같이 삭제하시오.
--(NewOrders 테이블이 NewCustomer를 참조하고 있는 상태이다.)
drop table newcustomer;

drop table neworders;
drop table newcustomer;