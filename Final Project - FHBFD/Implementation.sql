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
DROP TABLE IF EXISTS box;
DROP TABLE IF EXISTS stations;
DROP TABLE IF EXISTS mutualAid;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS positions;

--Creates tables 
CREATE TABLE positions(
	positionID int NOT NULL unique,
	jobID int NOT NULL unique,
	primary key (positionID, jobID)
);
CREATE TABLE job(
	jobID int not null unique references positions(jobID),
	title char(10),
	dateAcquired date,
	primary key (jobID)
);
CREATE TABLE mutualAid(
	mutualAidID int NOT NULL unique,
	stationID int NOT NULL unique,
	primary key (mutualAidID, stationID)
);
CREATE TABLE stations(
	stationID int NOT NULL unique references mutualAid(stationID),
	countyNumber int,
	townName text,
	primary key (stationID)
);
CREATE TABLE box(
	boxID int NOT NULL unique,
	classification text,
	mutualAidID int references mutualAid(mutualAidId)
);
CREATE TABLE address(
	addressID int NOT NULL unique,
	houseNumber int,
	street text,
	zipCode int,
	city text,
	state text,
	boxID int references box(boxID),
	primary key (addressID)
);
CREATE TABLE calls(
	callID int NOT NULL unique,
	addressID int references address(addressID),
	type text,
	description text,
	dispatchTime timestamp,
	clearTime timestamp,
	primary key (callID)
);
CREATE TABLE apparatusType(
	apparatusTypeID int NOT NULL unique,
	classification text,
	truckRole text,
	primary key (apparatusTypeID)
);
CREATE TABLE apparatus(
	apparatusID int NOT NULL unique,
	countyIdentification int,
	passangerCapacity int,
	manufacturer text,
	yearBuilt int,
	apparatusTypeID int references apparatusType(apparatusTypeID),
	primary key(apparatusID)
);
CREATE TABLE responderApparatus(
	apparatusID int NOT NULL references apparatus(apparatusID),
	callID int NOT NULL references calls(callID),
	primary key (apparatusID, callID)
);
CREATE TABLE members(
	memberID int NOT NULL unique,
	firstName text,
	lastName text,
	dateOfBirth date,
	dateJoin date NOT NULL,
	dateQuit date,
	addressID int references address(addressID),
	primary key (memberID)
);
CREATE TABLE responderPeople(
	memberID int NOT NULL,
	callID int NOT NULL,
	primary key(memberID, callID)
);
CREATE TABLE firefighter(
	memberID int NOT NULL unique references members(memberID),
	certification text,
	positionID int NOT NULL references positions(positionID),
	primary key (memberID)
);
CREATE TABLE associateMember(
	memberID int NOT NULL unique references members(memberID),
	primary key (memberID)
);
CREATE TABLE administrativeMember(
	memberID int NOT NULL unique references members(memberID),
	positionID int NOT NULL references positions(positionID),
	primary key (memberID)
);