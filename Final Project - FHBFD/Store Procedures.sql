--Store Procedures

--Drops the store procedures
drop function if exists viewMembersResponding(char(5), refcursor);
drop function if exists viewMemberInformation(char(4), refcursor);
drop function if exists viewMutualAid(char(4), refcursor);

create function viewMembersResponding(char, refcursor) returns refcursor AS
$$
declare
   callInput text := $1;
   resultSet refcursor := $2;
begin
   open resultSet for
      select responderPeople.callID,
             members.firstName, 
             members.lastName
      from members, responderPeople
      where callInput= responderPeople.callID
      and   responderPeople.memberID=members.memberID;
   return resultSet;
end;
$$
language plpgsql;

select viewMembersResponding('c0001', 'results');
fetch all from results;


create function viewMemberInformation(char(4), refcursor) returns refcursor AS
$$
declare
   callInput text := $1;
   resultSet refcursor := $2;
begin
   open resultSet for
      --INSERT CODE HERE
   return resultSet;
end;
$$
language plpgsql;


create function viewMutualAid(char(4), refcursor) returns refcursor AS
$$
declare
   boxInput text := $1;
   resultSet refcursor := $2;
begin
   open resultSet for
      select box.boxID, 
          box.classification, 
          stations.countyNumber, 
          stations.townName
      from box, stations, mutualAid
      where boxInput=box.boxID
      and box.boxID=mutualAid.boxID
      and   mutualAid.stationID = stations.stationID;
   return resultSet;
end;
$$
language plpgsql;

select viewMutualAid('2902', 'results');
fetch all from results;