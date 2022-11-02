--����3-34: ������ ���� �Ӽ��� ���� NewBook ���̺��� �����Ͻÿ�.(���� ����)
create table NewBook(
bookid number,
bookname varchar2(20),
publisher varchar2(20),
price number);

--����3-35: ������ ���� �Ӽ��� ���� NewCustomer ���̺��� �����Ͻÿ�.
create table newcustomer(
custid  number   primary key,
name    varchar2(40),
address varchar(40),
phone   varchar(30));

--����3-36: ������ ���� �Ӽ��� ���� NewOrders ���̺��� �����Ͻÿ�.
create table    neworders(
orderid     number,
custid      number      not null,
bookid      number      not null,
saleprice   number,
orderdate   date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);



