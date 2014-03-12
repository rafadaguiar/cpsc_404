declare @x int
set @x = 2000
select c1,c2 from T0_b3z8
where c1 = @x

/*
5)
a. Note that the presence of the variable changes the behaviour: 
   a table scan is performed instead of a more efficient index seek. Why?
   The optimizer can't tell what value x has before executing the code.
   Thus, an asumption is made over the number of expected rows(50000.5), in
   which case is way better to do a full scan of the table than looking at the
   index.
*/