select * from all_tables;

create table bank(
	bnum int primary key,
	bname varchar(20) not null,
	money int not null
);
insert into bank values(1,'timo', 10000);
insert into bank values(2,'ari', 5000);




select * from bank;


drop table message;


	update bank set money=money+1000 where bnum=1;
	