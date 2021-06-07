--mission 2                                --  제 수준으로 이해하기에는 복잡해서 확실하지 않을 수 있지만, 제가 이해한 것이 맞다면
create sequence seq_order_no1;             -- begin절에 잇는 seq_order_no1.nextval이 실행되려면 sequence를 먼저 만들어야 하는 것이 아닌가요?

create or replace function make_order(
    v_emp_id order_list.employee_id%type,
    v_menu menu.menu_name%type,
    v_amount order_list.amount%type);

return order_list.order_id%type
is
    v_order_id order_list.order_id%type;
    v_date order_list.order_date%type;
    v_menu_id order_list.menu_id%type;

begin
    select seq_order_no1.nextval, sysdate    -- 답안에는 seq_order_no1이라는 sequence가 생성되어 있지 않습니다.
        into v_order_id, v_date
    from dual;

    select menu_id
        into v_menu_id
    from menu
    where menu_name = v_menu;
    insert into order_list values(v_order_id, v_emp_id, v_menu_id, v_amount, v_date);
    return v_emp_id;

end;
/