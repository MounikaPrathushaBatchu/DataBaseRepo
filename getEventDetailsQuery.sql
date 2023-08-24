Select     Distinct E.ID, E.CISNumber, E.EventTypeFlag, E.BeginTime EventBeginTime,
           to_char(E.BeginTime, 'fm MM/dd/yyyy') BeginDate,
           to_char(E.BeginTime, 'fm HH:fmMI AM') BeginTime1,
           to_char(E.BeginTime, 'DD Mon YYYY HH:MI AM') BeginTime,
           to_char(E.EndTime, 'fm HH:fmMI AM') EndTime,
           E.GuestCount, ET.TypeCode, E.Street, E.Suite, E.City,
           S.Name,pcount,E.Zip, nvl(E.Location_Id,0) LocationId,C.Id custId,OtherLocation ,nvl(C.CompanyName,
           C.LastName ||''|| C.FirstName) CustomerName,PR.Status,tbl.total Total,tbl.need Needed,tbl.assigned Asgd,tbl.confirm conf
           From    Event E, Customer C, PartyStatus PR,EventType ET,tblpersonnelcount tbl, State S ,tblEventServiceStatus tblESS,
              (select Event_Id, count(s.id) pCount
                from ScheduleDetails S
                where s.PositionDeleted = 0
                group by event_id) PersonnelRequested   
                Where   E.Customer_Id = C.Id    
                And     E.PartyStatus_Id = PR.Id    
                And     E.EventType_Id = ET.Id 
                And tbl.event_id= e.id    
                And     E.State_Id  = S.Id (+)  and E.ID = tblESS.Event_ID(+) 
                and NVL(tblESS.S2,1) in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24)  
                and e.id=PersonnelRequested.Event_id(+) 
                and e.eventdate between  To_Date('17 Aug 2023') 
                And To_Date('17 Aug 2023') 
                And     To_Date('17 Aug 2023') Between To_Date(BeginTime) 
                And To_Date(EndTime) 
                and NVL(tblESS.S2,1)  in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24) 
                and E.businessunits_id in (-1) and E.partystatus_id  in (2,1,7)   
                And     E.CorpFlag = 0 Order By EventBeginTime,E.ID;