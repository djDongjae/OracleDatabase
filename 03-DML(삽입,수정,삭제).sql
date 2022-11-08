--질의3-44: Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,000원이다.
insert into book(bookid, bookname, publisher, price)
values (11, '스포츠 의학', '한솔의학서적', 90000);

select *
from book;

--질의3-45: Book 테이블에 새로운 도서 '스포츠 의학'을 삽입하시오. 스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
insert into book(bookid, bookname, publisher)
values (14, '스포츠 의학', '한솔의학서적');

select *
from book;

--질의3-46: 수입도서 목록(Imported_book)을 Book 테이블에 모두 삽입하시오.
insert into book(bookid, bookname, price, publisher)
select bookid, bookname, price, publisher
from imported_book;

--질의3-47: Customer 테이블에서 고객번호 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
update customer
set address='대한민국 부산'
where custid=5;

--질의3-48: Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
update customer
set address=
(select address
from customer
where name='김연아')
where name='박세리';

--질의3-49: Customer 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인하시오.
delete from customer
where custid=5;

select *
from customer;

--질의3-50: 모든 고객을 삭제하시오.
delete from customer;

