create user fox identified by 1111;

grant dba to fox;

create table users(
    id varchar2(40) primary key,
    password varchar2(30) not null,
    name varchar2(18) not null,
    gender char(1) check (gender in ('m','f')),
    birth date not null,
    hobby varchar2(30),
    email varchar2(50),
    phone varchar2(20),
    regdate date
);

create table visit(
    id number primary key,
    u_id varchar2(40) references users(id) on delete cascade,
    content clob,
    regdate timestamp
);

create table photo(
    id number primary key,
    u_id varchar2(40) references users(id) on delete cascade,
    content clob,
    uri varchar2(30) not null,
    regdate timestamp,
    good number not null,
    bad number not null
    
);

create sequence seq_visit_id;
create sequence seq_photo_id;

drop sequence seq_visit_id;
drop sequence seq_photo_id;
drop sequence seq_users_id;

drop table visit;
drop table photo;
drop table users;

select * from users;

select * from visit;

insert into visit
    values ( seq_visit_id.nextval,
              'second',
              '6 방명록입니다.',
              systimestamp
            );
commit;            

select * from photo;
select * from visit;
select * from users;
update users set login_fail_count = 0;
commit;

/*
delete from photo;
delete from visit;
delete from users 
    where id in  ('first','second','third');
*/  
commit;

alter table users modify password varchar2(70);
alter table users add login_fail_count number(1);
alter table users add login_fail_time timestamp;


select * from users;
rollback;
update users set login_fail_count = 2
			where id = 'admin';
            
select * from users
			where id = 'admin' and (select count(*) from users);