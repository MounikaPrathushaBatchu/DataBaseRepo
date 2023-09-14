JavaEventAPI.getColsedDayBasedOnBUOnSaveEvent;

select nvl(businessunits_id,0)
                                    from event
                                    where id = 845702;
                                    
select count(c.id)
             from
             closedays c, closedday_bu_mapping cbm
             where c.id =cbm.closedday_id
             and cbm.businessunits_id = 1
             and c.end_date >= to_date('09/06/2023 11:00 AM','mm/dd/yyyy hh:mi AM')
             and  c.closedate <= to_date('09/06/2023 04:00 PM','mm/dd/yyyy hh:mi AM');
             
select DECODE(c.DateType,1,'Green',2,'Orange',3,'Yellow',4,'Red') Color
        from
        closedays c, closedday_bu_mapping cbm
        where c.id =cbm.closedday_id
        and cbm.businessunits_id = 1
        and c.end_date >= to_date('09/06/2023 11:00 AM','mm/dd/yyyy hh:mi AM')
        and  c.closedate <= to_date('09/06/2023 04:00 PM','mm/dd/yyyy hh:mi AM')
        and rownum = 1
        order by c.datetype desc;
        
