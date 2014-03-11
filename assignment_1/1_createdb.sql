-- Create Database and Table Numbers

if db_id('StatisticsTest') is null
  create database StatisticsTest;
go
alter database StatisticsTest set recovery simple
go
use StatisticsTest
go

-- Create a Numbers table
create table Numbers_b3z8(n int not null primary key);
go
insert Numbers_b3z8(n)
     select rn from (select row_number()
                            over(order by current_timestamp) as rn
                      from sys.trace_event_bindings as b1
                          ,sys.trace_event_bindings as b2) as rd
      where rn <= 5000000
