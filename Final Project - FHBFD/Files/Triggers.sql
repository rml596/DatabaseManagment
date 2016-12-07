--Triggers
drop trigger if exists newMember on firefighter;
drop trigger if exists newMember on associateMember;
drop trigger if exists newMember on administrativeMember;

create trigger newMember
before insert on firefighter
for each row
execute procedure newMember();

create trigger newMember
before insert on associateMember
for each row
execute procedure newMember();

create trigger newMember
before insert on administrativeMember
for each row
execute procedure newMember();
