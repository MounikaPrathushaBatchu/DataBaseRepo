select * from Resources where FNAME = 'Sonia';
select * from Resources where FNAME = 'Rosa';

alter table resources add harassment_training_date date;

--UPDATE Table_Name SET Column_Name = New_Value WHERE Condition;

update Resources set harassment_training_date = null where id = 2349;

select * from Resources where id = 2349;