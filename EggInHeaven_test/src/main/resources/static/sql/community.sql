drop table community cascade constraints;

create table community(
commu_num     number, 
member_id    varchar2(20), 
commu_pass    varchar2(20) not null,
commu_subject varchar2(100) not null, 
commu_content varchar2(1000) not null, 
commu_img     varchar2(50),     
commu_readcount number not null,     
commu_date date not null,    
foreign key(member_id) references member(member_id) on delete cascade,
primary key(commu_num)
);

select * from community
delete from community

select*from member;
insert into MEMBER
values ('admin', '1', 'admin@nate.com', '홍길동', '여');

select * from
		( select rownum rnum, c.*
			from (select*from community where member_id= 'admin' order by commu_num desc) c
		)
		where rnum >=1 and rnum <=10

		delete community
	where commu_num = '1'