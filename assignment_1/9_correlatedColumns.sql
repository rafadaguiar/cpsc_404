set statistics io on
/*
create table RentalCar_b3z8
 (
  RentalCarID int not null identity(1,1)
      primary key clustered
 ,CarType nvarchar(20) not null
 ,DailyRate decimal(6,2)
 ,MoreColumns nchar(200) not null default '#'
)

create nonclustered index Ix_RentalCar_CarType_DailyRate_b3z8
   on RentalCar_b3z8(CarType, DailyRate)
*/   
/*
with CarTypes(minRate, maxRate, carType) as
 (
  select 20, 39, 'Compact'
   union all select 40, 59, 'Medium'
   union all select 60, 89, 'FullSize'
   union all select 90, 140, 'Luxory'
 )

insert RentalCar_b3z8(CarType, DailyRate)
  select carType, minRate+abs(checksum(newid()))%(maxRate-minRate)
    from CarTypes
         inner join Numbers_b3z8 on n <= 25000
update statistics RentalCar_b3z8 with fullscan
*/
--select * from RentalCar_b3z8
-- where CarType='Luxory'
--  and DailyRate < 90
   
/*
9)
	e.
		i. UNION removes duplicate records (where all columns in the results are the same),
		   UNION ALL does not. No, it would not.
		ii. Is a new unique idenfifier.
		iii.The INNER JOIN keyword selects all rows from both tables as long as there is a 
		    match between the columns in both tables.
10)
	i.Query plan: Clustered Index Scan
	  estimated(37500) vs. actual rows(0)
	  I/O cost:8.23
	  CPU cost:0.22
	ii. Because the optimizer taking the product of densities that are not independent to
		calculate the total probability.
11)
	1. Right Estimative and right plan(nonclustered index scan)
	2. Right Estimative and right plan(nonclustered index scan)
	3. Wrong estimative and Right plan(nonclustered index seek).
12)
	a. No positive impact.
	b. No positive impact.
	c. No positive impact.
	d. Slightly I/O improvement and simplification of the path(no key lookups or joins).
	
*/

--select CarType, count(*)
--FROM RentalCar_b3z8
--GROUP BY CarType
--go

--SELECT count(*) 
--FROM RentalCar_b3z8 WITH (index=0)
--WHERE DailyRate < 90

--create nonclustered index Ix_RentalCar_LuxuryCar_DailyRate_b3z8 on RentalCar_b3z8(DailyRate)
--where CarType='Luxury';

--drop index Ix_RentalCar_LuxuryCar_DailyRate_b3z8 on RentalCar_b3z8;
--create statistics sf_b3z8
--on RentalCar_b3z8(DailyRate)
--where CarType='Luxury';
go
--drop statistics RentalCar_b3z8.sf_b3z8;
--create index IxRentalCar_Covering_b3z8
--on RentalCar_b3z8(CarType, DailyRate) include (MoreColumns);
--drop index IxRentalCar_Covering_b3z8 on RentalCar_b3z8
go
SELECT *
FROM RentalCar_b3z8 --with (index=Ix_RentalCar_CarType_DailyRate_b3z8)
WHERE CarType='Luxury' and DailyRate < 90
--go
