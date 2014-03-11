use StatisticsTest;
go
if (object_id('T1_b3z8', 'U') is not null)
  drop table T1_b3z8
go
create table T1_b3z8
 (
   x int not null
  ,a varchar(20) not null
  ,b int not null
  ,y char(20) null
)
go
insert T1_b3z8(x,a,b)
   select n % 1000,n%3000,n%5000
     from Numbers_b3z8
    where n <= 100000
go
create nonclustered index IxT1_x on T1_b3z8(x)