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



