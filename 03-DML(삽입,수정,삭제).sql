--����3-44: Book ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ 90,000���̴�.
insert into book(bookid, bookname, publisher, price)
values (11, '������ ����', '�Ѽ����м���', 90000);

select *
from book;

--����3-45: Book ���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�. ������ ������ �Ѽ����м������� �Ⱓ������ ������ �����̴�.
insert into book(bookid, bookname, publisher)
values (14, '������ ����', '�Ѽ����м���');

select *
from book;

--����3-46: ���Ե��� ���(Imported_book)�� Book ���̺� ��� �����Ͻÿ�.
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

--����3-47: Customer ���̺��� ����ȣ 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�.
update customer
set address='���ѹα� �λ�'
where custid=5;

--����3-48: Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
update customer
set address=
(select address
from customer
where name='�迬��')
where name='�ڼ���';

--����3-49: Customer ���̺��� ����ȣ�� 5�� ���� ������ �� ����� Ȯ���Ͻÿ�.
delete from customer
where custid=5;

select *
from customer;

--����3-50: ��� ���� �����Ͻÿ�.
delete from customer;

