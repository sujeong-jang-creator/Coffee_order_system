-- 1번 
create table menu (
    menu_id number(3) primary key,
    menu_name varchar2(20) not null,
    price number(5) not null
);

insert all
    into menu (menu_id, menu_name, price) values(1,'아메리카노', 4000)
    into menu (menu_id, menu_name, price) values(2,'아이스티', 3500)
    into menu (menu_id, menu_name, price) values(3,'말차라떼', 5500)
    into menu (menu_id, menu_name, price) values(4,'핫초코', 5000)
    into menu (menu_id, menu_name, price) values(5,'헤이즐넛', 4500)
    into menu (menu_id, menu_name, price) values(6,'바닐라 라떼', 4500)
select * from dual;

create table order_list (
    order_id number(3) primary key,
    employee_id number(6) references employees(employee_id),
    menu_id number(3) references menu(menu_id),
    amount number(3) not null,
    order_date date
);

-- 4번
CREATE view order_list_v AS SELECT * FROM order_list;
SELECT order_date, department_id, amount
FROM departments, order_list_v
WHERE amount IN (SELECT department_id, sum(amount) 
                 FROM order_list
                 GROUP BY department_id);