select *
from book;

--����3-1: ��� ������ �̸��� ������ �˻��Ͻÿ�.
select bookname, price
from book;

--����3-2: ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻��Ͻÿ�.
select bookid, bookname, publisher, price
from book;

--����3-3: ���� ���̺� �ִ� ��� ���ǻ縦 �˻��Ͻÿ�.
select publisher
from book;

--�ߺ� ����
select distinct publisher
from book;

--����3-4: ������ 20,000�� �̸��� ������ �˻��Ͻÿ�.
select *
from book
where price < 20000;

--����3-5: ������ 10,000�� �̻� 20,000�� ������ ������ �˻��Ͻÿ�.
select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

--����3-6: ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.
select *
from book
where publisher in ('�½�����', '���ѹ̵��');

--���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ���ǻ縦 �˻��ϴ� SQL��
select *
from book
where publisher not in ('�½�����', '���ѹ̵��');

--����3-7: "�౸�� ����"�� �Ⱓ�� ���ǻ縦 �˻��Ͻÿ�.
select bookname, publisher
from book
where bookname like '�౸�� ����';

--����3-8: �����̸��� '�౸'�� ���Ե� ���ǻ縦 �˻��Ͻÿ�.
select bookname, publisher
from book
where bookname like '%�౸%';

--����3-9: �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ������ �˻��Ͻÿ�.
select *
from book
where bookname like '_��%';

--����3-10: �౸�� ���� ���� �� ������ 20,000�� �̻��� ������ �˻��Ͻÿ�.
select *
from book
where bookname like '%�౸%' and price >= 20000;

--����3-11: ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻��Ͻÿ�.
select *
from book
where publisher='�½�����' or publisher='���ѹ̵��';

--����3-12: ������ �̸������� �˻��Ͻÿ�.
select *
from book
order by bookname;

--����3-13: ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�.
select *
from book
order by price, bookname;

--����3-14: ������ ������ ������������ �˻��Ͻÿ�. ���� ������ ���ٸ� ���ǻ��� ������������ ����Ͻÿ�.
select *
from book
order by price desc, publisher asc;

--����3-15: ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice)
from orders;

select sum(saleprice) as �Ѹ���
from orders;

--2�� �迬�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as �Ѹ���
from orders
where custid = 2;

--����3-17: ���� �ֹ��� ������ ���Ǹž�, ��հ�, ������, �ְ��� ���Ͻÿ�.
select sum(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as minimum,
max(saleprice) as maximum
from orders;

--����3-18: ���缭���� ���� �Ǹ� �Ǽ��� ���Ͻÿ�.
select count(*)
from orders;

--����3-19: ������ �ֹ��� ������ �Ѽ����� ���Ǹž��� ���Ͻÿ�.
select custid, count(*) as ��������, sum(saleprice) as �Ѿ�
from orders
group by custid;

--����3-20: ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �Ѽ����� ���Ͻÿ�. ��, 2�� �̻� ������ ���� ���Ͻÿ�.
select count(*) as �Ѽ���
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;

--����3-21: ���� ���� �ֹ��� ���� �����͸� ��� ���̽ÿ�.
select *
from customer, orders
where customer.custid = orders.custid;

--����3-22: ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���̽ÿ�.
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid;

--����3-23: ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
select name, saleprice
from customer, orders
where customer.custid = orders.custid;

--����3-24: ������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
select customer.name, sum(orders.saleprice)
from customer, orders
where customer.custid = orders.custid
group by customer.name
order by customer.name; 
