--Query to return the amount of members that responded to a call
select calls.callID,
       count(members.firstName) 
from calls, members, responderPeople
where calls.callID = responderPeople.callID
and   responderPeople.memberID=members.memberID
group by calls.callID
order by calls.callID;


--Query to return the amount of calls that a member has responded to
select m.memberID, count(r.callID)
from members m
full outer join responderPeople r on r.memberID = m.memberID
group by m.memberID
order by m.memberID;

--Query to return the manhours of a call that a member has responded to
select callTime.callID, callTime.sum*callTimeResponder.count
from callTime, callTimeResponder
where callTime.callID=callTimeResponder.callID
order by callTimeResponder.callID;

--Query to return the total time of a call
select callID, sum(clearTime-dispatchTime)
from calls
group by callID
order by callID;
