create table tbl_vote_202005(
    v_jumin char(13) not null primary key,
    v_name varchar2(20),
    m_no char(1),
    v_time char(4),
    v_area char(20),
    v_confirm char(1)
    );

insert into tbl_vote_202005 values(99010110001,'김유권',1,'0930','제1투표장','N');

insert into tbl_vote_202005 values(89010120002,'이유권',2,'0930','제1투표장','N');
insert into tbl_vote_202005 values(69010110003,'박유권',3,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(59010120004,'홍유권',4,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(79010110005,'조유권',5,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(89010120006,'최유권',1,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(59010110007,'지유권',1,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(49010120008,'장유권',3,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(79010110009,'정유권',3,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(89010120010,'강유권',4,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(99010110011,'신유권',5,'0930','제1투표장','Y');
insert into tbl_vote_202005 values(79010120012,'오유권',1,'1330','제1투표장','Y');

insert into tbl_vote_202005 values(69010110013,'현유권',4,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(89010110014,'왕유권',2,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(99010110015,'유유권',3,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(79010110016,'한유권',2,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(89010110017,'문유권',4,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(99010110018,'양유권',2,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(99010110019,'구유권',4,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(79010110020,'황유권',5,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(69010110021,'배유권',3,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(79010110022,'전유권',3,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(99010110023,'고유권',1,'1330','제2투표장','Y');
insert into tbl_vote_202005 values(59010110024,'권유권',3,'1330','제2투표장','Y');

select * from tbl_vote_202005;

create table tbl_member_202005(
    m_no char(1) not null primary key,
    m_name varchar2(20),
    p_code char(2),
    p_school char(1),
    m_jumin char(13),
    m_city varchar2(20)
);

insert into tbl_member_202005 values(1,'김후보','P1',1,'660311999991','수선화동');
insert into tbl_member_202005 values(2,'이후보','P2',3,'550311999992','민들래동');
insert into tbl_member_202005 values(3,'박후보','P3',2,'770311999993','나팔꽃동');
insert into tbl_member_202005 values(4,'조후보','P4',2,'880311999994','진달래동');
insert into tbl_member_202005 values(5,'최후보','P5',3,'990311999995','개나리동');
select * from tbl_member_202005;

create table tbl_party_202005(
    p_code char(2) not null primary key,
    p_name varchar2(20),
    p_indate date,
    p_reader varchar2(20),
    p_tel1 char(3),
    p_tel2 char(4),
    p_tel3 char(4)
);

insert into tbl_party_202005 values('P1','A정당','2010-01-01','위대표','02','1111','0001');
insert into tbl_party_202005 values('P2','B정당','2010-02-01','명대표','02','1111','0002');
insert into tbl_party_202005 values('P3','C정당','2010-03-01','기대표','02','1111','0003');
insert into tbl_party_202005 values('P4','D정당','2010-04-01','옥대표','02','1111','0004');
insert into tbl_party_202005 values('P5','E정당','2010-05-01','임대표','02','1111','0005');
commit;
select * from tbl_member_202005;
select * from tbl_party_202005;

-- sub1
select m_no,m_name,p_name,
    CASE WHEN p_school='1' then '고졸' 
    WHEN p_school='2' then '학사'
    WHEN p_school='3' then '석사'
    WHEN p_school='4' then '박사'
    END as p_school,
    substr(m_jumin,0,6)||'-'||substr(m_jumin,6) as m_jumin,
    m_city,
    trim(p_tel1)||'-'||p_tel2||'-'||p_tel3 as p_tel
    from tbl_member_202005 m , tbl_party_202005 p  where m.p_code=p.p_code;
-- sub2 투표하기
select * from tbl_vote_202005;
insert into tbl_vote_202005 values(?,?,?,?,?,?);

-- sub3 투표검수조회


select * from tbl_member_202005 m , tbl_party_202005 p  where m.p_code=p.p_code;
select p_code, p_tel1||'-'||p_tel2||'-'||p_tel3 as tel from tbl_party_202005;