select *
from book;

--질의3-1: 모든 도서의 이름과 가격을 검색하시오.
select bookname, price
from book;

--질의3-2: 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색하시오.
select bookid, bookname, publisher, price
from book;

--질의3-3: 도서 테이블에 있는 모든 출판사를 검색하시오.
select publisher
from book;

--중복 제거
select distinct publisher
from book;

--질의3-4: 가격이 20,000원 미만인 도서를 검색하시오.
select *
from book
where price < 20000;

--질의3-5: 가격이 10,000원 이상 20,000원 이하인 도서를 검색하시오.
select *
from book
where price between 10000 and 20000;

select *
from book
where price >= 10000 and price <= 20000;

--질의3-6: 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
select *
from book
where publisher in ('굿스포츠', '대한미디어');

--출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 출판사를 검색하는 SQL문
select *
from book
where publisher not in ('굿스포츠', '대한미디어');

--질의3-7: "축구의 역사"를 출간한 출판사를 검색하시오.
select bookname, publisher
from book
where bookname like '축구의 역사';

--질의3-8: 도서이름에 '축구'가 포함된 출판사를 검색하시오.
select bookname, publisher
from book
where bookname like '%축구%';

--질의3-9: 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
select *
from book
where bookname like '_구%';

--질의3-10: 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
select *
from book
where bookname like '%축구%' and price >= 20000;

--질의3-11: 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
select *
from book
where publisher='굿스포츠' or publisher='대한미디어';

--질의3-12: 도서를 이름순으로 검색하시오.
select *
from book
order by bookname;

--질의3-13: 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오.
select *
from book
order by price, bookname;

--질의3-14: 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 출력하시오.
select *
from book
order by price desc, publisher asc;

--질의3-15: 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice)
from orders;

select sum(saleprice) as 총매출
from orders;

--2번 김연아 고객이 주문한 도서의 총판매액을 구하시오.
select sum(saleprice) as 총매출
from orders
where custid = 2;

--질의3-17: 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오.
select sum(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as minimum,
max(saleprice) as maximum
from orders;

--질의3-18: 마당서점의 도서 판매 건수를 구하시오.
select count(*)
from orders;

--질의3-19: 고객별로 주문한 도서의 총수량과 총판매액을 구하시오.
select custid, count(*) as 도서수량, sum(saleprice) as 총액
from orders
group by custid;

--질의3-20: 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총수량을 구하시오. 단, 2권 이상 구매한 고객만 구하시오.
select count(*) as 총수량
from orders
where saleprice >= 8000
group by custid
having count(*) >= 2;

--질의3-21: 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
select *
from customer, orders
where customer.custid = orders.custid;

--질의3-22: 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 보이시오.
select *
from customer, orders
where customer.custid = orders.custid
order by customer.custid;

--질의3-23: 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
select name, saleprice
from customer, orders
where customer.custid = orders.custid;

--질의3-24: 고객별로 주문한 모든 도서의 총판매액을 구하고, 고객별로 정렬하시오.
select customer.name, sum(orders.saleprice)
from customer, orders
where customer.custid = orders.custid
group by customer.name
order by customer.name; 
