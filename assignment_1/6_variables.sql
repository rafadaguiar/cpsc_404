--rename this file to predicates


--create procedure getT0Values_b3z8(@y int) as
 --select c1,c2 from T0_b3z8
--where c1 = @y
--exec getT0Values_b3z8 1000

--declare @x int
--set @x = 2000 select c1,c2 from T0_b3z8 where c1 = @x

/*
2)
a.	estimated(50000.5) vs. actual number of rows(1)
b.
	iii.	estimated(1) vs. actual number of rows(1)
	iv.		Yes, it uses the same estimative(now performing poorly).
	v.		stored procedures are essentialy subroutines of sql statements 
			stored in the db and called upon an 'exec' statement.
c.	
	i.		A way of writing SQL statements that are created and compiled in runtime.	
d.	We get a wrong answer for 1000 as in 'iv.'.
*/

--declare @x int
--       ,@cmd nvarchar(300)
--set @x = 1000
--set @cmd = 'select c1,c2 from T0_b3z8 where c1='
--+ cast(@x as nvarchar(8))
--exec (@cmd)

--exec sp_executesql N'select c1,c2 from T0_b3z8 where c1=@x'
--                  ,N'@x int'
--,@x = 1000


--select c1, c2
--from t0_b3z8
--where sqrt(c1*10)=100;

--select c1, c2
--from t0_b3z8
--where c1 = 10000 / 10;

--select c1, c2
--from t0_b3z8
--where power(c1,2) <= 1000000;

/*
3)	All three queries above performe poorly(ignoring index)due to the expresions on the predicates.
	A calculated column is a column that results from an expression involving other column(s). We
	can use to store the result of an expression in a way that we don't have to use this expression
	on the predicate. 
*/

--create procedure _getT0Values_b3z8(@x int) as
--	set @x = @x * 2
--select c1,c2 from T0_b3z8 where c1 = @x
--exec _getT0Values_b3z8 500
--drop procedure _getT0Values_b3z8