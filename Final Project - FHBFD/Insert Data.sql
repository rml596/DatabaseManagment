--Deletes all information in the database
delete from administrativeMember;
delete from associateMember;
delete from firefighter;
delete from responderPeople;
delete from members;
delete from responderApparatus;
delete from apparatus;
delete from apparatusType;
delete from calls;
delete from address;
delete from mutualAid;
delete from stations;
delete from box;
delete from positions;
delete from job;


--Inserts data into the Jobs table
insert into job(jobID, title) values
   ('j001','Interior'),
   ('j002','Lieutenant'),
   ('j003','Chief'),
   ('j004','Vice President'),
   ('j005','President');


--Inserts data into the Positions table
insert into positions(positionID, jobID, dateAcquired) values
   ('p001','j001','2010-10-08'),
   ('p002','j001','2012-06-20'),
   ('p003','j001','2005-12-04'),
   ('p004','j002','2014-01-01'),
   ('p005','j002','2016-01-01'),
   ('p006','j003','2012-01-01'),
   ('p007','j004','2015-01-01'),
   ('p008','j005','2015-01-01'),
   ('p009','j001','2011-02-15'),
   ('p010','j001','2012-10-12');
   


--Inserts data into Box Table
insert into box(boxID, classification) values
   ('2901', 'Farm'),
   --The Hills
   ('2902', 'Residential'),
   --Pluckemin
   ('2903', 'Commercial'),
   --Bedminster
   ('2904', 'Residential');


--Inserts data into Stations
insert into stations(stationID, countyNumber, townName) values
   ('St01', '22', 'Bernardsville'),
   ('St02', '40', 'Liberty Corner'),
   ('St03', '51', 'Peapack-Gladstone'),
   ('St04', '63', 'Pottersville'),
   ('St05', '20', 'Basking Ridge'),
   ('St06', '49', 'North Branch'),
   ('St07', '60', 'Watchung'),
   ('St08', '34', 'Green Knoll');


--Inserts data into MutualAid Table
insert into mutualAid(boxID, stationID) values
   --Box 2901 --> Farm
   ('2901', 'St01'),
   ('2901', 'St02'),
   ('2901', 'St03'),
   ('2901', 'St04'),
   ('2901', 'St05'),
   --2902 --> The Hills (Residential)
   ('2902', 'St01'),
   ('2902', 'St02'),
   ('2902', 'St03'),
   ('2902', 'St05'),
   ('2902', 'St06'),
   --2903 --> Pluckemin (Commercial)
   ('2903', 'St02'),
   ('2903', 'St03'),
   ('2903', 'St06'),
   --2904 --> Bedminster (Residential)
   ('2904', 'St01'),
   ('2904', 'St02'),
   ('2904', 'St03'),
   ('2904', 'St04');


--Inserts data into Address Table
insert into address(addressID, houseNumber, street, city, zipCode, state, boxID) values
   --Box 2901
   ('Ad0001', '900', 'Lamington Road','Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0002', '100', 'River Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0003', '400', 'Cedar Ridge Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0004', '200', 'Cowperthwaite Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0005', '1765', 'River Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0006', '1265', 'Rattlesnake Bridge Rd', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0007', '1050', 'Larger Cross Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   ('Ad0008', '505', 'Larger Cross Road', 'Bedminster', '07921', 'New Jersey', '2901'),
   --Box 2902
   ('Ad0009', '3', 'Wescott Road', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0010', '5', 'Cortland Lane', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0011', '10', 'Teal Lane', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0012', '6', 'Stone Run Road', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0013', '4', 'Hyde Court', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0014', '19', 'Encantment Drive', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0015', '51', 'Carlisle Road', 'Bedminster', '07921', 'New Jersey', '2902'),
   ('Ad0016', '165', 'Smoke Rise Road', 'Bedminster', '07921', 'New Jersey', '2902'),
   --Box 2903
   ('Ad0017', '359', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0018', '28', 'Crossroads Drive', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0019', '414', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0020', '414', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0021', '318', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0022', '75', 'Washington Valley Road', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0023', '247', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0024', '180', 'Washington Valley Road', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0025', '101', 'Timberbrook Drive', 'Bedminster', '07921', 'New Jersey', '2903'),
   ('Ad0026', '135', 'US-202/206', 'Bedminster', '07921', 'New Jersey', '2903'),
   --Box 2904
   ('Ad0027', '325', 'Tutle Ave', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0028', '10', 'Wildwood Avenue', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0029', '7', 'Railroad Avenue', 'Far Hills', '07931', 'New Jersey', '2904'),
   ('Ad0030', '7', 'Prospect Street', 'Far Hills', '07931', 'New Jersey', '2904'),
   ('Ad0031', '42', 'Peapack Road', 'Far Hills', '07931', 'New Jersey', '2904'),
   ('Ad0032', '5', 'Schley Road', 'Far Hills', '07931', 'New Jersey', '2904'),
   ('Ad0033', '4', 'Ludlow Ave', 'Far Hills', '07931', 'New Jersey', '2904'),
   ('Ad0034', '24', 'Old Dutch Place', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0035', '31', 'Old Stonehouse Road', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0036', '30', 'Woods Road', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0037', '34', 'Deer Haven Road', 'Bedminster', '07921', 'New Jersey', '2904'),
   ('Ad0038', '5', 'Ski Hill Drive', 'Bedminster', '07921', 'New Jersey', '2904');


--Inserts data into Calls
insert into calls (callID, addressID, callType, description, dispatchTime, clearTime) values
   ('c0001', 'Ad0033', 'Fire Alarm', 'Unintentional activation due to cooking', '2015-05-10 15:22', '2015-05-10  15:40'),
   ('c0002', 'Ad0017', 'Fire Alarm', 'Unknown reason for activation', '2015-05-10 20:09', '2015-05-10 20:27'),
   ('c0003', 'Ad0013', 'Fire Alarm', 'False activation', '2015-05-13 07:48', '2015-05-14 08:03'),
   ('c0004', 'Ad0002', 'CO-Alarm', 'No levels', '2015-05-17 10:12', '2015-05-17 10:50'),
   ('c0005', 'Ad0024', 'Smoke Condition', 'Smoke Condition from chimney. Vented Structure', '2015-05-17 12:14', '2015-05-17 13:20'), 
   ('c0006', 'Ad0004', 'Structure Fire', 'Box 2901 struck for MutualAid, 2&1/2 Story Structure w/ fire on the A/D corner. Fire knocked, overhall commenced.', '2015-05-20 07:15', '2015-05-20 14:23'),
   ('c0007', 'Ad0030', 'Motor Vehicle Accident', 'Two car MVA, 2 patients treated', '2015-05-27 15:02', '2015-05-27 15:30'),
   ('c0008', 'Ad0021', 'MVA w/ Entrapment', 'Driver entraped, extricated & treated', '2015-06-03 02:16', '2015-06-03 03:10'),
   ('c0009', 'Ad0018', 'Fire Alarm', 'Faulty detector, Advised homeowner to replace detector', '2015-06-03 12:57', '2015-06-03 13:17'),
   ('c0010', 'Ad0003', 'CO-Alarm', 'No levels read', '2015-06-05 23:46', '2015-06-06 00:09'); 


--Insert data into Apparatus Type
insert into apparatusType(apparatusTypeID, classification, truckRole) values
   ('At01', 'Engine', 'Firematics'),
   ('At02', 'Bucket Truck', 'Firematics'),
   ('At03', 'Tanker', 'Firematics'),
   ('At04', 'Rescue Truck', 'Rescue'),
   ('At05', 'Incident Command', 'Utility'),
   ('At06', 'Utility', 'Utility');


--Insert data into Apparatus
insert into apparatus(apparatusID, countyIdentification, passangerCapacity, manufacturer, yearBuilt, apparatusTypeID) values
   ('A001', '101', '6','Spartan ERV', '2014', 'At01'),
   ('A002', '102', '10', 'Pierce Mfg', '1993', 'At01'),
   ('A003', '121', '10', 'Pierce Mfg', '2009', 'At02'),
   ('A004', '132', '2', 'Peterbuilt', '1996', 'At03'),
   ('A005', '151', '5', 'Pierce Mfg', '2006', 'At04'),
   ('A006', '161', '4', 'Chevrolet', '2006', 'At05'),
   ('A007', '162', '4', 'Ford', '2004', 'At06');


 --Inserts data into Responder Apparatus
 insert into responderApparatus(callID, apparatusID) values
    --Call c0001
    ('c0001','A001'),
    ('c0001','A005'),
    --Call c0002
    ('c0002','A001'),
    ('c0002','A006'),
    --Call c0003
    ('c0003','A006'),
    --Call c0004
    ('c0004','A001'),
    ('c0004','A006'),
    --Call c0005
    ('c0005','A001'),
    ('c0005','A003'),
    ('c0005','A005'),
    ('c0005','A002'),
    --Call c0006
    ('c0006','A001'),
    ('c0006','A006'),
    ('c0006','A004'),
    ('c0006','A003'),
    ('c0006','A002'),
    ('c0006','A007'),
    ('c0006','A005'),
    --Call c0007
    ('c0007','A001'),
    ('c0007','A006'),
    ('c0007','A004'),
    --Call c0008
    ('c0008','A001'),
    ('c0008','A006'),
    ('c0008','A004'),
    ('c0008','A007'),
    --Call c0009
    ('c0009','A001'),
    ('c0009','A006'),
    --Call c0010
    ('c0010','A001'),
    ('c0010','A006');


--Inserts data into Members
insert into members(memberID, firstName, lastName, dateOfBirth, dateJoin, dateQuit, addressID) values
   ('m001', 'John', 'Smith', '1990-02-12', '2013-01-10', NULL, 'Ad0038'),
   ('m002', 'Miguel', 'Mad', '1995-06-14', '2015-12-01', NULL, 'Ad0001'),
   ('m003', 'Edward', 'Joser', '1983-09-22', '2003-10-04', NULL, 'Ad0009'),
   ('m004', 'Ross', 'Lyppe', '1997-02-03', '2012-03-06', NULL, 'Ad0012'),
   ('m005', 'Joe', 'Hoath', '1973-07-03', '1997-02-09', NULL, 'Ad0035'),
   ('m006', 'Larry', 'Vander', '1999-12-08', '2015-04-28', NULL, 'Ad0022'),
   ('m007', 'Mike', 'Mathews', '1986-04-02', '2000-08-13', NULL, 'Ad0015'),
   ('m008', 'Tom', 'Alpha', '1997-08-30', '2016-01-09', NULL, 'Ad0005'),
   ('m009', 'Anthony', 'Smith', '1963-10-31', '2005-04-01', NULL, 'Ad0001'),
   ('m010', 'Bob', 'Romeo', '1975-01-01', '1991-10-13', NULL, 'Ad0026'),
   ('m011', 'Evan', 'Olsen', '1972-09-15', '1989-10-01', '2000-03-01', 'Ad0018'),
   ('m012', 'Anthony', 'Renalds', '1997-04-04', '2015-08-15', '2016-12-03', 'Ad0032');


--Inserts data into ResponderPeople
insert into responderPeople(callID, memberID) values
   --Call c0001
   ('c0001','m002'),
   ('c0001','m003'),
   ('c0001','m004'),
   --Call c0002
   ('c0002','m001'),
   ('c0002','m003'),
   ('c0002','m007'),
   ('c0002','m008'),
   --Call c0003
   ('c0003','m001'),
   ('c0003','m004'),
   ('c0003','m009'),
   --Call c0004
   ('c0004','m001'),
   ('c0004','m010'),
   --Call c0005
   ('c0005','m004'),
   ('c0005','m006'),
   ('c0005','m007'),
   ('c0005','m009'),
   --Call c0006
   ('c0006','m001'),
   ('c0006','m003'),
   ('c0006','m004'),
   ('c0006','m005'),
   ('c0006','m006'),
   ('c0006','m008'),
   ('c0006','m010'),
   --Call c0007
   ('c0007','m002'),
   ('c0007','m003'),
   ('c0007','m005'),
   --Call c0008
   ('c0008','m001'),
   ('c0008','m003'),
   ('c0008','m004'),
   ('c0008','m005'),
   ('c0008','m009'),
   --Call c0009
   ('c0009','m005'),
   ('c0009','m007'),
   ('c0009','m010'),
   --Call c0010
   ('c0010','m007'),
   ('c0010','m009'),
   ('c0010','m010');

--Inserts data into firefighter
insert into firefighter(memberID, certification, positionID) values
   ('m001','Firerfighter 1', 'p001'),
   ('m002','Firerfighter 1', 'p002'),
   ('m003','Firerfighter 1', 'p003'),
   ('m004','Firerfighter 1', 'p004'),
   ('m005','Firerfighter 1', 'p005'),
   ('m006','Firerfighter 1', 'p006'),
   ('m007','Firerfighter 1', 'p009'),
   ('m008','Firerfighter 1', 'p010');


--Inserts data into Administrative Members
insert into administrativeMember(memberID, positionID) values
   ('m009', 'p007'),
   ('m010', 'p008');

--Inserts data into Associate Members
insert into associateMember(memberID) values
   ('m011'),
   ('m012');
