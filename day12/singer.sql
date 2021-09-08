select * from all_tables;

create table singer(
   snum int primary key,
   name varchar(20) not null,
   age int not null,
   song varchar(30) not null
);


insert into singer values(1,'blackpink', 25, 'ddudu_ddudu');
insert into singer values(2,'bts', 30, 'butter');
insert into singer values(3,'migos', 30, 'straightenin');
select * from singer;
drop table singer;


select * from singer where snum = 1;

