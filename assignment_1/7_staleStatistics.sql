/*if (object_id('Product_b3z8', 'U') is not null)
  drop table Product_b3z8
go
create table Product_b3z8
 (
   ProductId int identity(1,1) not null
  ,ListPrice decimal(8,2) not null
  ,LastUpdate date not null default current_timestamp
  ,filler nchar(500) not null default '#'
)
go
alter table Product_b3z8 add constraint PK_Product_b3z8
  primary key clustered (ProductId)
go
  
create nonclustered index ix_Product_LastUpdate_b3z8 on Product_b3z8(LastUpdate)
go
insert Product_b3z8(LastUpdate, ListPrice)
 select dateadd(day, abs(checksum(newid())) % 3250,'20000101')
       ,0.01*(abs(checksum(newid())) % 20000)
   from Numbers_b3z8 where n <= 500000
go
update statistics Product_b3z8 with fullscan
*/
--drop table Product_b3z8

--insert Product_b3z8(LastUpdate,ListPrice)
--select '20100101', 100 from Numbers_b3z8 where n <= 100000
--select * from Product_b3z8 where LastUpdate = '20100101'
--select * from Product_b3z8 with (index=0)
 --where LastUpdate = '20100101'
--update statistics Product_b3z8 with fullscan
--select * from Product_b3z8 where LastUpdate = '20100101'
/*
6)
	d. We don't need to drop the index first.
7)
	a.
		i. Because it had stale statistics on that table, leading to poor a plan to run the query.
	c.
		First query:  1s,1s,0s,0s,...
		Second query: 4s,3s,2s,1s,1s,1s,...
		
		iii. No because we already have automaticaly created statistics on ListPrice.
	e.
		i.
			First Query:  2s,1s,0s,...
			Second query: 7s,4s,3s,3s...
		
*/
--create statistics s1_ListPrice_b3z8
--on Product_b3z8(ListPrice) with fullscan;
--update statistics Product_b3z8 with fullscan

--select count(*)
--from Product_b3z8;
select count(*)
from Product_b3z8 where ListPrice>100;

--insert Product_b3z8(LastUpdate,ListPrice)
--select '20100101', 100 from Numbers_b3z8 where n <= 100000;