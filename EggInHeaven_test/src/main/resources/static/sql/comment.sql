drop table commu_comment cascade constraints;

create table commu_comment(
comment_num        number primary key,
commu_num     number, 
member_id    varchar2(20),
comment_content    varchar2(200) not null,
comment_date date,
foreign key(member_id) references member(member_id) on delete cascade,
foreign key(commu_num) references community(commu_num) on delete cascade
);

drop sequence com_seq;
create sequence com_seq;