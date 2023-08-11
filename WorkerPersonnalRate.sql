select nvl(FREELANCER,0) from resources where id = 2349;

select nvl(max(id),0)
      from PTAEffective_Dates
      where RESOURCE_ID =2349
      and  sysdate >= Startdate;
      
select * from PTAEffective_Dates where RESOURCE_ID =2349;

Select to_char(StartDate,'MM/DD/YYYY') StartDate
          from PTAEffective_Dates
            where   Id = 5388;
            
select  Rate 
                from    PersonnelTypeAssociation
                where   Worker_Id = 2349
                and     PTAEffective_Dates_ID=5388;
                
select  * 
                from    PersonnelTypeAssociation
                where   Worker_Id = 2349
--                and     PersonnelType_Id = 2
                and     PTAEffective_Dates_ID=5388;
                
select Id,Type,23 rate
              from PersonnelType
              where Active =1 order by SortOrder,Upper(Type);
--  or              
select Id,Type,rate
              from PersonnelType
              where Active =1 order by SortOrder,Upper(Type);
              
select nvl(value,'America/New_York')
       From Special_Attributes sp
       where sp.attribute = 'DB SERVER TIMEZONE';

select nvl(ctz.short_name,'America/New_York')
           From Special_Attributes sp,caterer_time_zone ctz
           where sp.attribute = 'TIMEZONE'
           and   upper(sp.value)=ctz.name;
           
Select PE.Id,to_char(PE.StartDate,'fm MM/DD/YYYY') StartDate,
       to_char(PE.endDate,'fm MM/DD/YYYY') enddate,
       (select Decode(u.LastName,null,'',u.LastName||', ')|| u.FirstName  from userinfo u where id=PE.updatedby) Updatedby,
--       Decode(u.LastName,null,'''',u.LastName||'', '')|| u.FirstName Updatedby,
       javaprefapi.getTimeZoneTime('America/New_York',To_Char(UpdatedOn,'yyyy-mm-dd hh24:mi:ss'),'fm MM/DD/YYYY HH:fmMI AM') UpdatedOn,
       JavaWorkerAPI.getPersonnelRates(2349,PE.Id) type
       from PTAEFFECTIVE_DATES PE,UserInfo U
        Where U.ID(+)=PE.updatedby and
        Pe.Resource_ID=2349 Order by PE.startdate desc;
        
-- saveOperation in workerPersonalRates
select * from PTAEffective_Dates where resource_id=2349;

select * from PerstypeAssociationHistory where worker_id=2349 and ptaeffective_dates_id=5388;

select worker_id, ptaeffective_dates_id,personneltype_id,rate
                                      From PersonnelTypeAssociation
                                            Where   Worker_Id   = 2349
                                                and     PTAEffective_Dates_ID= 5388;
                                                
Select Count(ID)
              From PTaEffective_Dates
              where Resource_ID=2349;
              
Select Id,startdate from PTAEffective_dates where Resource_ID=2349;

Select Min(StartDate-1) from PTAEffective_Dates where Resource_ID=2349 and startdate > data.startdate;
           
           