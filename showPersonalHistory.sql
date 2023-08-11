Select PE.Id,to_char(PE.StartDate,'fm MM/DD/YYYY') StartDate,
            Decode(u.LastName,null,'',u.LastName||', ')|| u.FirstName Updatedby,
            javaprefapi.getTimeZoneTime('America/New_York',To_Char(peh.lastupdated,'yyyy-mm-dd hh24:mi:ss'),'fm MM/DD/YYYY HH:fmMI AM') UpdatedOn,
            JavaWorkerAPI.getPersonnelRatesFor1og(2349,PEH.group_id) type ,
            PEH.group_id group_id
            from PTAEFFECTIVE_DATES PE,UserInfo U,PerstypeAssociationHistory PEH
            Where U.ID(+)=PEH.userid
            and PEH.worker_id=PE.Resource_ID
            and PE.Id='09-NOV-21'
            and PE.Id=PEH.ptaeffective_dates_id
            Order by peh.lastupdated desc;
            
--Select PE.Id,to_char(PE.StartDate,''fm MM/DD/YYYY'') StartDate,
--            Decode(u.LastName,null,'''',u.LastName||'', '')|| u.FirstName Updatedby,
--            javaprefapi.getTimeZoneTime('''||ltimezone||''',To_Char(peh.lastupdated,''yyyy-mm-dd hh24:mi:ss''),''fm MM/DD/YYYY HH:fmMI AM'') UpdatedOn,
--            JavaWorkerAPI.getPersonnelRatesFor1og('||iResourceId||',PEH.group_id) type ,
--            PEH.group_id group_id
--            from PTAEFFECTIVE_DATES PE,UserInfo U,PerstypeAssociationHistory PEH
--            Where U.ID(+)=PEH.userid
--            and PEH.worker_id=PE.Resource_ID
--            and PE.Id='||iEffectiveDateID||'
--            and PE.Id=PEH.ptaeffective_dates_id
--            Order by peh.lastupdated desc;