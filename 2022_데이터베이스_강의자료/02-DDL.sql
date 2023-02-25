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

--����3-37: NewBook ���̺� VARCHAR2(13)�� �ڷ����� ���� isbn �Ӽ��� �߰��Ͻÿ�.
alter table newbook add isbn varchar2(13);

--����3-38: NewBook ���̺��� isbn �Ӽ��� ������ Ÿ���� NUMBER������ �����Ͻÿ�.
alter table newbook modify isbn number;

--����3-39: NewBook ���̺��� isbn �Ӽ��� �����Ͻÿ�.
alter table newbook drop column isbn;

--����3-40: NewBook ���̺��� bookid �Ӽ��� NOT NULL ���������� �����Ͻÿ�.
alter table newbook modify bookid number not null;

--����3-41: NewBook ���̺��� bookid �Ӽ��� �⺻Ű�� �����Ͻÿ�.
alter table newbook add primary key(bookid);

--����3-42: NewBook ���̺��� �����Ͻÿ�.
drop table newbook;

--����3-43: NewCustomer ���̺��� �����Ͻÿ�. ���� ������ �����ȴٸ� ������ �ľ��ϰ� ���õ� ���̺��� ���� �����Ͻÿ�.
--(NewOrders ���̺��� NewCustomer�� �����ϰ� �ִ� �����̴�.)
drop table newcustomer;

drop table neworders;
drop table newcustomer;