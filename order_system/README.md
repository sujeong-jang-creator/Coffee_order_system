## coffee_order_system - order.csv 
다음과 같이 데이터가 들어있는 csv 파일
```csv
order_id,employee_id,menu_id,amount,order_date
1,147,1,3,2021. 4. 1
2,109,2,3,2021. 4. 2
3,203,2,2,2021. 4. 3
4,104,6,5,2021. 4. 4
5,115,5,5,2021. 4. 5
...
```

## input_table.txt
csv파일의 데이터를 order_list table로 import하는 control 파일
```txt
options(load=-1, errors=-1)     # 모든 파일을 로드하고(load=-1) 발생하는 모든 에러를 실행해라(error=-1)
load data                       # 데이터를 로드해라
infile 'C:\Users\Playdata\Desktop\Mini Project\order_system\coffee_order_system - order.csv'   
                                # 원하는 파일(coffee_order_system - order.csv)을 로드하는 명령어, 각자 local의 디렉토리를 적으면 된다.
append into table order_list    # order_list 테이블에 데이터를 추가해라
fields terminated by ','        # 각 필드는 , 기호로 구분한다.
(                               # order_list 테이블의 컬럼 지정, csv의 데이터를 어떤 순서대로 어떤 컬럼에 넣을지 지정
    order_id,
    employee_id,
    menu_id,
    amount,
    order_date DATE "YYYY.MM.DD"
)
```

## cmd 창에서 실행 방법
1. csv파일과 컨트롤 파일이 존재하는 디렉토리로 이동한다.
2. order_list가 존재하는 id/pw를 이용하여 다음의 명령문을 실행한다.
> sqlldr 'user id/qw' control='input_table.txt' log='coffee_order_system-order.csv'
<br>
<br>

참고 사이트
- [지니의디비디비딥](https://geniusjo.tistory.com/entry/SQLLoader-csv%ED%8C%8C%EC%9D%BC-import)
