-- 수량(amount)
DROP TABLE tmp;
DROP TABLE mmp;

CREATE TABLE tmp AS 
SELECT d.department_name, e.department_id, o.amount, o.menu_id, o.order_date
FROM employees e, order_list o, departments d
WHERE e.employee_id = o.employee_id AND d.department_id = e.department_id;

CREATE TABLE mmp AS
SELECT tmp.menu_id, tmp.amount, tmp.department_id, menu.price
FROM menu, tmp
WHERE menu.menu_id = tmp.menu_id;

DROP view daily_stats;

CREATE view daily_stats AS
SELECT tmp.order_date, tmp.department_name, sum(tmp.amount) AS total_amount, sum(mmp.price * tmp.amount) AS total_price
FROM mmp, tmp
WHERE  mmp.department_id IN (SELECT mmp.department_id
                             FROM mmp)
GROUP BY tmp.order_date, tmp.department_name
ORDER BY tmp.order_date DESC;

SELECT * FROM daily_stats;