select object_name(object_id) as table_name
      ,name as stats_name
      ,stats_date(object_id, stats_id) as last_update
  from sys.stats
 where objectproperty(object_id, 'IsUserTable') = 1
 order by last_update

 DBCC SHOW_STATISTICS('dbo.T1_b3z8', IxT1_x)--WITH HISTOGRAM
/*
9)
ii. It took me a while to understand the histogram, but at the end I
	was quite impressed with what we can infer from it.
	The results were consistent with the table.
iv. As Holger mentions, histograms are extremely useful to determine 
    the expected number of resulting rows for a given query.   
*/


select * from T1_b3z8 where x=100
select * from T1_b3z8 where a='100'
select * from T1_b3z8 where a='234' and b=1234
/*
11)
b. A table scan will be performed, instead of an index scan (why?), for: i. select * from T1_userid where a = '100';
	Because we don't have an index on the column 'a'.
c. The following query [using statistics on both columns] will qualify on two attributes. What do you expect the query plan to be like?
	Still a scan though all the table.
d.
	ii. Yes, we get a way better estimation to the number of expected rows.	
*/
 --create statistics s1_b3z8 on T1_b3z8(b,a)
 DBCC SHOW_STATISTICS('dbo.T1_b3z8', s1_b3z8)WITH HISTOGRAM
 --create statistics s2_b3z8 on T1_b3z8(a)where b=1234
 --drop statistics T1_b3z8.s2_b3z8;
 /*
 12)
 b. Yes, the estimation now is exactly equal to the actual value.
 d. Filtered statistics are statistics to a particular subset of table's rows.
	They can be useful, for example, to get tailored statistics to a especific query.
 */