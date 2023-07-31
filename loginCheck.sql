select * from user_session$;

select * from userinfo;

select count(us.id) as count from user_session$ us,userinfo u where u.loginid=us.loginid and us.session_id = 307841720 and  u.id =-1;