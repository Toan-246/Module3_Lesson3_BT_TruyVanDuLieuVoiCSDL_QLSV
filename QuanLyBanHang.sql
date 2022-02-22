use quanlybanhang;
insert into customers (cName, cAge)
values ('Minh Quan', 10),
       ('Ngoc Oanh', 20),
       ('Hong Ha', 50);

insert into orders
values (1, 1, '2006-03-21', null),
       (2, 2, '2006-03-23', null),
       (3, 1, '2006-03-16', null);

insert into products
values (1, 'May Giat', 3),
       (2, 'Tu Lanh', 5),
       (3, 'Dieu Hoa', 7),
       (4, 'Quat', 1),
       (5, 'Bep Dien', 2);

insert into orderdetails
values (1, 1, 3);
insert into orderdetails
values (1, 3, 7);
insert into orderdetails
values (1, 2, 2);
insert into orderdetails
values (2, 1, 1);
insert into orderdetails
values (3, 1, 8);
insert into orderdetails
values (2, 3, 4);
insert into orderdetails
values (5, 3, 3);

/* Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order */
select oID, oDate, oTotalPrice
from orders;

/* Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách */

select C.cName, P.pName, OD.odQTY
from customers C
         join orders O on C.cID = O.cID
         join orderdetails OD on O.oID = OD.oID
         join products P on P.pID = OD.pID;

/* Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào */

select cName
from customers
         left join orders o on customers.cID = o.cID
where oID IS null;

SELECT DISTINCT customers.cName
FROM customers
WHERE customers.cID NOT IN (SELECT cID FROM orders);

/* Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
Giá bán của từng loại được tính = odQTY*pPrice) */

select O.oID, c.cName, O.oDate, sum(OD.odQTY * p.pPrice) as Tổng
from orders O
         join orderdetails OD on O.oID = OD.oID
         join products p on p.pID = OD.pID
         join customers c on c.cID = O.cID
GROUP BY O.oID, O.oDate;
