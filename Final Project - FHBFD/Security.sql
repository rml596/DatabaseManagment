--Security

--drops rolls
drop role if exists officer;
drop role if exists members;
drop role if exists administrativeMember;
drop role if exists admin;


--CREATES ROLES
--Admin role
create role admin;
grant all on all tables in schema public to admin;

--Officer role
create role officer;
grant select on calls, responderPeople, responderApparatus,
                apparatus, apparatusType, address, box, mutualAid, 
                stations
to officer;
grant insert on calls, 
                responderPeople, 
                responderApparatus, 
                address
to officer;
grant update on calls, 
                responderPeople, 
                responderApparatus, 
                address
to officer;

--Member Role
create role members;
grant select on members, 
                firefighter, 
                associateMember, 
                administrativeMember,
                positions,
                job,
                address
to members;
grant update on members, address
to members;

--Administration Member
create role administrativeMember;
grant select on members, 
                firefighter, 
                associateMember, 
                administrativeMember,
                positions,
                job,
                address
to administrativeMember;
grant insert on positions,
             job
to administrativeMember;
grant update on members, 
                positions, 
                job
to administrativeMember;