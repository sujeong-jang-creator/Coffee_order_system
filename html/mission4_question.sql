/*
Mission 04

 부서별로 하루에 주문한 금액의 총 합을 기준으로 TOP3를 선별하세요. 
단, 주문수량도 함께 출력해 주세요.
*/

-- 개인적으로 문제에 view를 만들어라 라는게 들어갔으면 좋겠어요!
-- 그리고.. 문제에 order_list에 어떤값이 어떤값인줄 헷갈렸어요..(제 머리가 안좋아서 그런거 같아요 개인적으로)
-- 예를 들어 주문수량(amount) 이런식으로 문제에 있으면 이해하기 훨신 쉬울거 같았어요
-- 부서별로 하루에 주문한 금액의 총 합을 기준으로 top3를 선별하려면 제 생각은 rownum으로 asc 해야하지 않나요??(제가 직접해봤어야하는데 문제를 전부다 이해 못했어요..ㅠ) 

CREATE view order_list_v AS SELECT * FROM order_list;
SELECT order_date, department_id, amount
FROM departments, order_list
WHERE amount IN (SELECT department_id, sum(amount) 
FROM order_list
GROUP BY department_id);

