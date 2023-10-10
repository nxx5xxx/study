create index idx_col on exam(no,name,money);

select * from exam;

select idx_col from exam;
drop index idx_col;


SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM ALL_IND_COLUMNS
WHERE TABLE_NAME = 'EXAM';
-- 인덱스를 사용하는지 확인
explain plan for select no,name,money from exam where 1=1 and no = 10001;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
  FROM ALL_IND_COLUMNS
 WHERE TABLE_NAME = 'exam';
 
 explain plan for select * from tbl_class;
 
select * from exam;
-- 새로운 컬럼을 추가하면 인덱스 풀스캔이 풀린다
alter table exam add addcol varchar2(20);
alter table exam drop column addcol;


-- 풀아우터 조인

create table tb1(a varchar2(10) ,n number);
create table tb2(b varchar2(10) ,n number);

insert into tb1 values('a1',1);
insert into tb1 values('a2',2);
insert into tb1 values('a3',3);
commit;
insert into tb2 values('b1',2);
insert into tb2 values('b2',4);
insert into tb2 values('b3',5);

select * from tb1 FULL OUTER JOIN tb2 ON tb1.n = tb2.n where tb1.a is null or tb2.b is null;

select n from tb1 minus select n from tb2;