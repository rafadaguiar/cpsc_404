select c1, c2 from T0_b3z8 where c1=1000
select c1, c2 from T0_b3z8 where c1=2000
select c1, c2 from T0_b3z8 where c1=1500
/*
3)
b. Explain what a nonclustered index is.
	Is an unsorted index that contains a series of pointers pointing to physical data rows
c. In general, what are the kinds of column(s) on which to consider building a
   clustered index?
	Columns with data that will potentialy be requested sequentialy, frequently 
	and that are unique or contain many distinct values.
	
4)
a.
ii.
 For the first query, which will return 100000 rows, the optimizer chooses a Table Scan. #result_rows[estimated==actual] 
 The second query yields only one single row, so in this case, an Index Seek is very efficient. #result_rows[estimated == actual]
 The third query yiedls no result. An index seek was performed. #result_rows[estimated != actual] 
b. Table Scan: Scan all the entries in the table
   Index Scan: Scan all the entries in the index

*/