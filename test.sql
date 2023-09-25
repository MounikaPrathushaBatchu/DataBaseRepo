javaEventAPI.GetEventInfo;

select cisnumber,ui.INITIALS,  c.companyname,
                et.type eventtype,
                to_char(e.begintime,'fmhh:fmmi AM') as truncbegintime,
                to_char(e.endtime,'fmhh:fmmi AM') as truncendtime,
                guestcount, otherguests,  to_char(e.begintime,'fmmm/dd/yyyy') as truncbegindate,
                to_char(begintime, 'Dy') as dayofweek, otherlocation,
                e.street,e.suite,ecm.GLNUMBER cust_account_id,
                (select INITIALS from userinfo where id = e.MANAGER_ID) EMINITIALS
                from event e,customer c,userinfo ui,eventtype et,expcustomermap ecm
                where  e.customer_id = c.id
                and e.salesexecutive_id = ui.id(+)
                and e.eventtype_id=et.id
                 and c.id=ecm.CUSTOMERID(+)
                and e.id = :iEventId;