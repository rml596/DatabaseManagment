--Query to return the amount of members that responded to a call
select calls.callID,
       count(members.firstName) 
from calls, members, responderPeople
where calls.callID = responderPeople.callID
and   responderPeople.memberID=members.memberID
group by calls.callID
order by calls.callID;


--Query to return the amount of calls that a member has responded to
select members.memberID,
       count(calls.callID)
from calls, members, responderPeople
where members.memberID = responderPeople.memberID
and   responderPeople.callID=calls.callID
--ADD ABILITY TO VIEW THE MEMBERS WHO DIDN'T GO ON ANY CALLS
group by members.memberID
order by members.memberID;

