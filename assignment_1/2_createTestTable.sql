use StatisticsTest;
go
-- Create a test table
if (object_id('T0_b3z8', 'U') is not null)
  drop table T0_b3z8;
go
create table T0_b3z8(c1 int not null, c2 nchar(200) not null default '#')
go
-- Insert 100000 rows. All rows contain the value 1000 for column c1
insert T0_b3z8(c1)
   select 1000 from Numbers_b3z8
    where n <= 100000
go
-- Now insert only one row with value 2000
insert T0_b3z8(c1) values(2000)
go
--create a nonclustered index on column c1
create nonclustered index ix_T0_1 on T0_b3z8(c1)