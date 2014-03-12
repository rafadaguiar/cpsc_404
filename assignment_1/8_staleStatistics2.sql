/*drop table Product_b3z8
if (object_id('Product_b3z8', 'U') is not null)
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
--insert Product_b3z8(LastUpdate,ListPrice)
--select '20100101', 100 from Numbers_b3z8 where n <= 100000
--go

--dbcc freeproccache
set statistics io on
--alter index ix_Product_LastUpdate_b3z8 on dbo.Product_b3z8 rebuild;
SELECT * FROM Product_b3z8 WHERE LastUpdate = '20100101';

/*
8)
	c.
		iii.
			1.
				c. A logical read is a read of a page in the buffer.
				   In physical reads the page is read from the disk.
				d. No significant change.	
					First time:
					6s
					logical reads 300127
					estimated(1) vs. actual rows(100000)
					Second time:
					8s
					logical reads 300127
					estimated(1) vs. actual rows(100000)
	e. It changes the number of logical reads 86035 and physical reads 109. 
	   The rest stays the same.
	d. It corrects the estimated number of rows and performs more I/Os, but
	   it takes about the same time.
	f. Not helpful either.					
*/
--update statistics Product_b3z8 with fullscan;
--select *
--from Product_b3z8 with (index=0) where LastUpdate = '20100101'