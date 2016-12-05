DROP FUNCTION IF EXISTS viewMembersResponding(char(5), refcursor);
DROP FUNCTION IF EXISTS viewMemberInformation(char(4), refcursor);
DROP FUNCTION IF EXISTS viewMutualAid(char(4), refcursor);

DROP VIEW IF EXISTS memberAddress;
DROP VIEW IF EXISTS memberJobs;
DROP VIEW IF EXISTS callInformation;
DROP VIEW IF EXISTS boxMutualAid;
DROP VIEW IF EXISTS apparatusInformation;
DROP VIEW IF EXISTS memberResponders;

DROP TABLE IF EXISTS administrativeMember;
DROP TABLE IF EXISTS associateMember;
DROP TABLE IF EXISTS firefighter;
DROP TABLE IF EXISTS responderPeople;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS responderApparatus;
DROP TABLE IF EXISTS apparatus;
DROP TABLE IF EXISTS apparatusType;
DROP TABLE IF EXISTS calls;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS mutualAid;
DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS box;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS job;

--Creates tables 
CREATE TABLE job(
	jobID char(4) not null unique,
	title char(20),
	primary key (jobID)
);
CREATE TABLE positions(
	positionID char(4) NOT NULL unique,
	jobID char(4) NOT NULL references job(jobID),
	dateAcquired date,
	primary key (positionID)
);
CREATE TABLE box(
	boxID char(4) NOT NULL unique,
	classification text,
        primary key (boxID)
);
CREATE TABLE stations(
	stationID char(4) NOT NULL,
	countyNumber int,
	townName text,
	primary key (stationID)
);
CREATE TABLE mutualAid(
	boxID char(4) NOT NULL references box(boxID),
	stationID char(4) NOT NULL references stations(stationID),
	primary key (boxID, stationID)
);
CREATE TABLE address(
	addressID char(6) NOT NULL unique,
	houseNumber int,
	street text,
	city text,
	state text,
        zipCode char(5),
	boxID char(4) references box(boxID),
	primary key (addressID)
);
CREATE TABLE calls(
	callID char(5) NOT NULL unique,
	addressID char(6) references address(addressID),
	callType text,
	description text,
	dispatchTime timestamp,
	clearTime timestamp,
	primary key (callID)
);
CREATE TABLE apparatusType(
	apparatusTypeID char(4) NOT NULL unique,
	classification text,
	truckRole text,
	primary key (apparatusTypeID)
);
CREATE TABLE apparatus(
	apparatusID char(4) NOT NULL unique,
	countyIdentification int,
	passangerCapacity int,
	manufacturer text,
	yearBuilt int,
	apparatusTypeID char(4) references apparatusType(apparatusTypeID),
	primary key(apparatusID)
);
CREATE TABLE responderApparatus(
	callID char(6) NOT NULL references calls(callID),
	apparatusID char(4) NOT NULL references apparatus(apparatusID),
	primary key (callID, apparatusID)
);
CREATE TABLE members(
	memberID char(4) NOT NULL unique,
	firstName text,
	lastName text,
	dateOfBirth date,
	dateJoin date NOT NULL,
	dateQuit date,
	addressID char(6) references address(addressID),
	primary key (memberID)
);
CREATE TABLE responderPeople(
	callID char(6) NOT NULL,
	memberID char(4) NOT NULL,
	primary key(callID, memberID)
);
CREATE TABLE firefighter(
	memberID char(4) NOT NULL unique references members(memberID),
	certification text,
	positionID char(4) NOT NULL references positions(positionID),
	primary key (memberID)
);
CREATE TABLE associateMember(
	memberID char(4) NOT NULL unique references members(memberID),
	primary key (memberID)
);
CREATE TABLE administrativeMember(
	memberID char(4) NOT NULL unique references members(memberID),
	positionID char(4) NOT NULL references positions(positionID),
	primary key (memberID)
);




--Creates Views
CREATE VIEW memberAddress AS
   select members.memberID, 
          members.firstName, 
          members.lastName, 
          address.houseNumber, 
          address.street, 
          address.city, 
          address.state,
          address.zipcode
   from members, address
   where members.addressID = address.addressID
   order by members.memberID;
--Select statement
select * from memberAddress;

CREATE VIEW memberJobs AS
   select members.memberID,
          members.firstName,
          members.lastName,
          job.jobID,
          job.title
   from members, positions, job, firefighter, administrativeMember
   where (members.memberID = firefighter.memberID or members.memberID = administrativeMember.memberID)
   and   (firefighter.positionID = positions.positionID or administrativeMember.positionID = positions.positionID)
   and   positions.jobID = job.jobID
   order by members.memberID;
--Select statement      
select * from memberJobs;

CREATE VIEW callInformation AS 
   select calls.callID,
          calls.callType,
          calls.description,
          calls.dispatchTime,
          calls.clearTime,
          address.houseNumber,
          address.street,
          address.city,
          address.state,
          address.zipCode
   from calls, address
   where calls.addressID=address.addressID
   order by dispatchTime asc;
--Select statement
select * from callInformation;

CREATE VIEW boxMutualAid AS
   select box.boxID, 
          box.classification, 
          stations.countyNumber, 
          stations.townName
   from box, stations, mutualAid
   where box.boxID=mutualAid.boxID
   and   mutualAid.stationID = stations.stationID
   order by box.boxID asc;
--Select statement
select * from boxMutualAid;

CREATE VIEW apparatusInformation AS
   select apparatus.apparatusID, 
          apparatus.countyIdentification, 
          apparatus.passangerCapacity, 
          apparatus.manufacturer,
          apparatus.yearBuilt,
          apparatusType.classification,
          apparatusType.truckRole
   from apparatus, apparatusType
   where apparatus.apparatusTypeID = apparatusType.apparatusTypeID;
--Select statement
select * from apparatusInformation;

CREATE VIEW memberResponders AS 
   select calls.callID, 
          calls.dispatchTime, 
          calls.callType, 
          members.firstName, 
          members.lastName
   from calls, members, responderPeople
   where calls.callID = responderPeople.callID
   and   responderPeople.memberID=members.memberID;
--Select statement
select * from memberResponders;