a)
select *
from dentist, belongs
where belongs.Did = dentist.Did;

b)
select *
from appointment
where Did = "given dentist id" AND data < "endDate" AND data > "beginDate" ;

c)
select *
from appointment, belongs
where appointment.Did = belongs.Did AND 
		appointment.data = "given date" AND 
		belongs.Cname = "given clinic name";

d)
select *
from appointment
where Sin = "given sin";

e)
select Sin, count(*) as count
from appointment
where miss = "yes"
group by Sin
having count(*) > 0;

f)
select appointment.Bid, treatment.Tname, treatment.fee 
from appointment, include, treatment
where Aid = "given appointment id" AND 
		appointment.Bid = include.Bid AND 
		include.Tname = treatment.Tname;

g)
select Bid
from bill
where paid = "no";