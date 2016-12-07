--Store Procedures

--Drops the store procedures
drop function if exists viewMembersResponding(char(5), refcursor);
drop function if exists viewMemberInformation(char(4), refcursor);
drop function if exists viewMutualAid(char(4), refcursor);
drop function if exists insertIntoFirefighter(char(4));
drop function if exists insertIntoAssociateMember(char(4));
drop function if exists insertIntoAdministrativeMember(char(4), boolean);
drop function if exists newMember();

create function viewMembersResponding(char(5), refcursor) returns refcursor AS
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

/*select viewMembersResponding('c0001', 'results');
fetch all from results;*/



create function viewMemberInformation(char(4), refcursor) returns refcursor AS
$$
declare
   memberIDInput text := $1;
   resultSet refcursor := $2;
begin
      if exists (select memberID from firefighter where memberID=memberIDInput) then
            open resultSet for
               select members.firstName, 
                      members.lastName, 
                      members.dateOfBirth,
                      members.dateJoin,
                      members.dateQuit,
                      firefighter.certification, 
                      positions.dateAcquired, 
                      job.title
               from members, firefighter, positions, job
               where members.memberID=memberIDInput
               and members.memberID=firefighter.memberID
               and firefighter.positionID=positions.positionID
               and positions.jobID=job.jobID;
            return resultSet;
      end if;   
      if exists (select memberID from administrativeMember where memberID=memberIDInput) then
            open resultSet for
               select members.firstName, 
                      members.lastName, 
                      members.dateOfBirth,
                      members.dateJoin,
                      members.dateQuit,  
                      positions.dateAcquired, 
                      job.title 
               from members, positions, job, administrativeMember
               where members.memberID=memberIDInput
               and members.memberID=administrativeMember.memberID
               and administrativeMember.positionID=positions.positionID
               and positions.jobID=job.jobId;
            return resultSet;
      end if;
      if exists (select memberID from associateMember where memberID=memberIDInput) then
            open resultSet for
               select members.firstName, 
                      members.lastName, 
                      members.dateOfBirth,
                      members.dateJoin,
                      members.dateQuit
               from members, associateMember
               where members.memberID=memberIDInput
               and members.memberID=associateMember.memberID;
            return resultSet;
      end if;   
end;
$$
language plpgsql;

/* select viewMemberInformation('m012', 'results');
fetch all from results;*/


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






--Functions for Trigger
create function insertIntoFirefighter(char(4)) returns boolean AS
$$
declare 
   memberInput text := $1;
begin
   if exists (select memberID from associateMember where memberID=memberInput) then
      return true;
   elsif exists (select memberID from administrativeMember where memberID=memberInput) then
      return true;
   else
      return false;
   end if;
end;
$$
language plpgsql;

create function insertIntoAssociateMember(char(4)) returns boolean AS
$$
declare 
   memberInput text := $1;
begin
   if exists (select memberID from firefighter where memberID=memberInput) then
      return true;
   elsif exists (select memberID from administrativeMember where memberID=memberInput) then
      return true;
   else
      return false;
   end if;
end;
$$
language plpgsql;

create function insertIntoAdministrativeMember(char(4)) returns boolean AS
$$
declare 
   memberInput text := $1;
begin
   if exists (select memberID from firefighter where memberID=memberInput) then
      return true;
   elsif exists (select memberID from associateMember where memberID=memberInput) then
      return true;
   else
      return false;
   end if;
end;
$$
language plpgsql;


--Actual Trigger Function
create function newMember() returns trigger AS
$$
declare
   test1 boolean = insertIntoFirefighter(new.memberID);
   test2 boolean = insertIntoAssociateMember(new.memberID);
   test3 boolean = insertIntoAdministrativeMember(new.memberID);
begin
   if(test1=true) then
      raise exception 'Member is already in another table';
   elsif (test2=true) then
      raise exception 'Member is already in another table';
   elsif(test3=true) then
      raise exception 'Member is already in another table';
   else
      return new;
   end if;
end;
$$
language plpgsql;