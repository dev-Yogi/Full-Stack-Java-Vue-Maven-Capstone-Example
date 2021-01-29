-- CREATE DATABASE clevelandcarpentry;

USE clevelandcarpentry;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS ledger;
DROP TABLE IF EXISTS revenues;
DROP TABLE IF EXISTS wood_prices;
DROP TABLE IF EXISTS wood_types;
DROP TABLE IF EXISTS wood_species;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS timeclock;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS markup;
drop table if exists referrals;
DROP TABLE IF EXISTS statuses;
DROP TABLE IF EXISTS expense_types;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS revenue_types;

CREATE TABLE statuses (
	status_id INT AUTO_INCREMENT PRIMARY KEY,
    project_status VARCHAR(50) NOT NULL
);

insert into statuses (project_status) values ('INQUIRED');
insert into statuses (project_status) values ('ESTIMATE WITH CLIENT');
insert into statuses (project_status) values ('IN PROGRESS');
insert into statuses (project_status) values ('COMPLETED');
insert into statuses (project_status) values ('DECLINED');
insert into statuses (project_status) values ('INACTIVE');



CREATE TABLE referrals (
referral_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
referral_type VARCHAR(50)
);

insert into referrals (referral_type) values ('Family');
insert into referrals (referral_type) values ('Friend');
insert into referrals (referral_type) values ('Coworker');
insert into referrals (referral_type) values ('Client Referral');
insert into referrals (referral_type) values ('Walk-by');
insert into referrals (referral_type) values ('Instagram');
insert into referrals (referral_type) values ('Facebook');
insert into referrals (referral_type) values ('Other');



CREATE TABLE clients (
client_id INT AUTO_INCREMENT PRIMARY KEY,
client_code VARCHAR(3) NOT NULL,
client_first_name VARCHAR(25) NOT NULL,
client_last_name VARCHAR(25) NOT NULL,
client_email_address VARCHAR(50),
client_phone_number VARCHAR(10),
referral_id INT,
FOREIGN KEY (referral_id) REFERENCES referrals (referral_id)
);

insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('CC', 'Claire', 'Cleveland', 1, '4025154339');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('ZF', 'Zach', 'Fallowfield', 2, '4024804572');
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('SK', 'Sam', 'Kemig', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number, client_email_address) values ('LT', 'Lauren', 'Teaford', 1, '4029601835', 'teaford.lauren@yahoo.com');
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('DP', 'Doug', 'Pyzel', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number, client_email_address) values ('RT', 'Rachel', 'Teaford', 1, '4029536993', 'rachel.teaford@yahoo.com');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('SB', 'Steve', 'Barry', 2, '4022167273');
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('DN', 'Desi', 'Noel', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('KH', 'Kiefer', 'Hyland', 2);
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('KB', 'Kelly', 'Bast', 2, '4026608276');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('WA', 'William', 'Arebalo', 5, '4025106594');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('KT', 'Kim', 'Teaford', 1, '4029536994');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('KJ', 'Kelsey', 'Johnson', 2, '4029902587');
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('LD', 'Lani', 'Dash', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('AM', 'Ashley', 'Michelle', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('AS', 'Amber', 'Schmit', 7);
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('MC', 'Maria', 'Clark', 2, '4022019937');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('DA', 'Daryl', 'Anderson', 3, '4029909975');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('NL', 'Nikki', 'Loos', 2, '4025400708');
insert into clients (client_code, client_first_name, client_last_name, referral_id) values ('SA', 'Sara', 'Atkins', 6);
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('JL', 'Jessica', 'Loos', 2, '4027300778');
insert into clients (client_code, client_first_name, client_last_name, referral_id, client_phone_number) values ('CJ', 'Cole', 'Jennings', 3, '4022763157');


select * from clients;

create table projects (
project_id INT AUTO_INCREMENT PRIMARY KEY,
project_code VARCHAR(20) NOT NULL,
project_desc VARCHAR(75),
status_id INT,
client_id INT,
FOREIGN KEY (client_id) REFERENCES clients (client_id),
client_project_number INT,
inquiry_date DATE,
start_date DATE,
completion_date DATE
);

insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('CC-01', 'Amish Coffee Table', 4, 1, 1, '2020-04-04');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('ZF-01', '(2) Twin Nightstands', 4, 2, '01', '2020-05-02');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('LT-01', 'Shiplap Coffee Table', 4, 4, 1, '2020-05-09');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('KB-01', 'Outdoor Bench', 6, 10, 1, '2020-05-10');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('DP-01', 'Guitar Display Wall', 5, 5, 1, '2020-05-14');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('LD-01', 'Bathroom Linen Cabinet', 6, 14, 1, '2020-05-22');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('SK-01', 'Herringbone Bench', 4, 3, 1, '2020-05-22');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('WA-01', 'Concealed Rifle Flag Cabinet', 4, 11, 1, '2020-05-29');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('DN-01', 'American Flag', 6, 8, 1, '2020-05-30');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date, completion_date) values ('ZF-02', 'Concealed Rifle Flag Cabinet', 4, 2, 2, '2020-05-29', '2020-06-30');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date, completion_date) values ('SB-01', 'Concealed Rifle Flag Cabinet', 4, 7, 2, '2020-05-29', '2020-07-08');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('RT-01', 'Herringbone Coffee Table', 4, 6, 2, '2020-06-19');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('AM-01', 'Porch Swing', 5, 15, 1, '2020-06-20');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('MC-01', '(2) Twin Nightstands', 5, 17, 1, '2020-06-24');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KT-01', 'Outdoor Fence', 1, 12, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number) values ('KT-02', 'Laundry Cabinet Doors', 1, 12, 1);
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('CC-02', 'Modern Desk', 4, 1, 2, '2020-07-14');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('KJ-01', 'Laundry Cabinets', 6, 13, 1, '2020-07-14');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, completion_date) values ('KH-01', '(2) Adirondack Chairs', 4, 9, 1, '2020-08-18');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('DA-01', '(2) Adirondack Chairs', 6, 18, 1, '2020-08-19');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('SA-01', 'Outdoor Picnic Trestle Table & (2) Benches', 2, 20, 1, '2020-08-20');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date, start_date) values ('NL-01', 'Outdoor Table + (4) High-Top Adirondack Chairs', 3, 19, 1, '2020-08-20', '2020-08-28');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('JL-01', 'Picture Frame', 3, 21, 1, '2020-08-30');
insert into projects (project_code, project_desc, status_id, client_id, client_project_number, inquiry_date) values ('CJ-01', 'Trestle Dining Table', 1, 22, 1, '2020-08-24');


select * from clients;
select * from projects;

create table ledger (
transaction_id INT AUTO_INCREMENT PRIMARY KEY,
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
transaction_amount INT NOT NULL,
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id)
);



create table expense_types (
expense_type_id INT AUTO_INCREMENT PRIMARY KEY,
expense_type VARCHAR(50)
);

insert into expense_types (expense_type) values ('Wood');
insert into expense_types (expense_type) values ('Tool');
insert into expense_types (expense_type) values ('Hardware');
insert into expense_types (expense_type) values ('Tax');
insert into expense_types (expense_type) values ('Finish/Paint');
insert into expense_types (expense_type) values ('Misc');

create table revenue_types (
revenue_type_id INT AUTO_INCREMENT PRIMARY KEY,
revenue_type VARCHAR(50)
);

insert into revenue_types (revenue_type) values ('Deposit');
insert into revenue_types (revenue_type) values ('Final Payment');
insert into revenue_types (revenue_type) values ('Tax Return');
insert into revenue_types (revenue_type) values ('Return');


create table locations (
location_id INT AUTO_INCREMENT PRIMARY KEY,
location_name VARCHAR(50),
address_desc VARCHAR(50),
location_mileage INT,
location_address VARCHAR(50)
);

insert into locations (location_name, address_desc, location_mileage, location_address) values ('Lowe''s', '183rd & Center', 3.8, '18375 Wright St, Omaha, NE 68130');
insert into locations (location_name, address_desc, location_mileage, location_address) values ('Lowe''s', '75th & Dodge', 14.2, '7525 Dodge St, Omaha, NE 68114');
insert into locations (location_name, location_mileage, location_address) values ('Liberty Hardwoods', 17.1, '1920 S 19th St, Omaha, NE 68108');
insert into locations (location_name, address_desc, location_mileage, location_address) values ('Home Depot', 'L Street', 5.8, '12710 L St, Omaha, NE 68137');
insert into locations (location_name, location_mileage, location_address) values ('Woodcraft', 6.3, '14605 Wright St, Omaha, NE 68144');
insert into locations (location_name, address_desc, location_mileage, location_address) values ('Sherwin Williams', '180th & Q', 1.7, '18128 R Plaza, Omaha, NE 68144');


select * from locations;

create table revenues (
revenue_id INT AUTO_INCREMENT PRIMARY KEY,
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
FOREIGN KEY (location_id) REFERENCES locations (location_id),
revenue_type_id INT,
FOREIGN KEY (revenue_type_id) REFERENCES revenue_types (revenue_type_id),
transaction_amount INT NOT NULL,
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id)
);

insert into revenues (date_of_transaction, transaction_description, revenue_type_id, transaction_amount, project_id) values ('2020-08-17', 'Payment for Chairs', 2, 415.00, 19);
insert into revenues (date_of_transaction, transaction_description, revenue_type_id, transaction_amount) values ('2020-06-04', 'Mortising Bit and Chisel 1/2"', 4, 21.39);
insert into revenues (date_of_transaction, transaction_description, revenue_type_id, transaction_amount) values ('2020-06-03', 'BSH 3/4-IN x 3/4-IN HNGE', 4, 19.23);


create table expenses (
expense_id INT AUTO_INCREMENT PRIMARY KEY,
transaction_id VARCHAR(13),
date_of_transaction DATE,
transaction_description VARCHAR(250) NOT NULL,
location_id INT,
FOREIGN KEY (location_id) REFERENCES locations (location_id),
transaction_amount DECIMAL(16,2) NOT NULL,
expense_type_id INT,
FOREIGN KEY (expense_type_id) REFERENCES expense_types (expense_type_id),
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id),
item_quantity INT,
board_feet_quantity INT
);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200831-01', '2020-08-31', 'Band Saw', 5, 349.99, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200831-01', '2020-08-31', 'WR 3n1 Trammel Set', 5, 30.99, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200831-01', '2020-08-31', 'Tax', 5, 26.45, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200723-02', '2020-07-23', '1/2 4x8 Sheet Sande Plywood', 4, 71.90, 1, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200723-02', '2020-07-23', 'Tapcon 3/16x1-3/4 Phillips, 25 PK', 4, 13.16, 3, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200723-02', '2020-07-23', 'Tax', 4, 5.95, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200602-03', '2020-06-02', '1lb Construction Screw 1-5/8-IN', 1, 7.98, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200602-03', '2020-06-02', 'BSH 3/4-IN x 3/4-IN Hinge', 1, 17.97, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200602-03', '2020-06-02', 'Irwin 1/2-IN Pipe Clamp', 1, 25.94, 2, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200602-03', '2020-06-02', '1-12-8 Utility Shelf Board', 1, 30.96, 1, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200602-03', '2020-06-02', '1/2IN x 72IN Black Iron Pipe', 1, 24.10, 3, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200602-03', '2020-06-02', '1-4-8 2 TC Whitewood Boar', 1, 4.72, 1);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200602-03', '2020-06-02', 'Tax', 1, 7.82, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200806-04', '2020-08-06', 'BSH 4 1/2IN ECLN WD T-SHK', 1, 10.98, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200806-04', '2020-08-06', 'Bosch 6.5-AMP Top Handle Jigsaw', 1, 119.00, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200806-04', '2020-08-06', 'Tax', 1, 9.10, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200731-05', '2020-07-31', 'Gallon D16W151 Cashmere', 6, 37.23, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200731-05', '2020-07-31', 'QT SW PLAS RATIO CON', 6, 1.27, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200731-05', '2020-07-31', '2IN 2 Clearcut Elite Bow', 6, 13.42, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200731-05', '2020-07-31', '2IN 2 XL-CUB', 6, 13.85, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200731-05', '2020-07-31', 'Tax', 6, 3.62, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200801-06', '2020-08-01', 'GF Exterior 450 Satin Qt', 5, 24.99, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200801-06', '2020-08-01', 'Round Over Bit 5/32 1/4SH', 5, 30.47, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200801-06', '2020-08-01', 'White China Brush 2.5IN', 5, 12.99, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200801-06', '2020-08-01', 'Painters Pyramids 4 Grabbers 4', 5, 6.99, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200801-06', '2020-08-01', 'Tax', 5, 5.28, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200611-07', '2020-06-11', 'Minwax 8 oz. Pickled Oak', 1, 9.96, 5, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200611-07', '2020-06-11', 'Zinsser QT Clear Shellac', 1, 14.98, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200611-07', '2020-06-11', 'GTR P 5IN 8-H H/L Disc 2', 1, 7.98, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200611-07', '2020-06-11', 'Tax', 1, 2.30, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200713-08', '2020-07-13', '48-IN Adjustable T-Square', 1, 26.98, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200713-08', '2020-07-13', 'TPN 75CT 3/16IN x 1-1/4IN', 1, 13.48, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200713-08', '2020-07-13', 'KBLT 27-CT Multi SD Set', 1, 14.96, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200713-08', '2020-07-13', 'Tax', 1, 3.88, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200604-09', '2020-06-04', 'Jet Mortise Machine', 5, 339.99, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200604-09', '2020-06-04', 'Mortising Bit and Chisel 1/2"', 5, 19.99, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200604-09', '2020-07-17', 'Self-Close OLVY Hinge', 1, 17.88, 3, 6);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200604-09', '2020-07-17', 'Powerpro One EXT XL #6 X', 1, 5.16, 3, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200604-09', '2020-07-17', 'TPN 25-CT 3/16 X 2-1/4IN', 1, 7.58, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200604-09', '2020-07-17', '5/32IN X 5-1/2IN BI', 1, 5.98, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200604-09', '2020-07-17', 'Tax', 1, 2.56, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200719-10', '2020-07-19', '1/2 4x8 MDF PNL', 4, 20.96, 1);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200719-10', '2020-07-19', '1/2 4x8 Sheet Sande Plywood', 4, 143.80, 1, 4);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200719-10', '2020-07-19', '1/4 4x8 Sheet Sande Plywood', 4, 45.84, 1, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200719-10', '2020-07-19', '1-1/4" Gold Screw 1lb', 4, 8.20, 3, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200719-10', '2020-07-19', 'Tax', 4, 15.32, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200724-11', '2020-07-24', 'Self-Close OLVY Hinge 2-P', 1, 14.90, 3, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200724-11', '2020-07-24', 'TPN 25-CT 3/16 X 2-3/4IN', 1, 8.98, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200724-11', '2020-07-24', 'Tax', 1, 1.67, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', '1-Gal Titebond III Ult Wood Glue', 1, 28.98, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', 'Titebond Wood Glue Applicator', 1, 3.38, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200728-12', '2020-07-28', '1/4-IN USS STP Nut', 1, 2.97, 3, 9);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200728-12', '2020-07-28', 'HM 1-CT 1/4IN-20 x 4IN CA', 1, 13.86, 3, 9);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200728-12', '2020-07-28', 'HM 1-CT 1/4-IN SS Flat WA', 1, 1.98, 3, 9);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', '3M Asst Grit 8CT 1/3 Shee', 1, 6.98, 6);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', '1lb Ext Screw PGP 1-5/8 IN', 1, 9.48, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200728-12', '2020-07-28', 'Project Source Mini Roller', 1, 3.76, 5, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', 'WRNR 3-IN Flex Putty Knife', 1, 7.98, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200728-12', '2020-07-28', 'Tax', 1, 6.25, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', 'TPN 8CT 1/4-IN x 2-1/4-IN', 1, 5.28, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', 'TPN 8CT 1/4-IN x 1-3/4-IN', 1, 4.98, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', 'BSH LBHX 1/4-IN x 6-IN', 1, 4.48, 3);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', '40-FT 16/3 Green Outdoor', 1, 12.97, 6);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', '360Pro 5-Outlet Power Hub', 1, 17.48, 6);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200623-13', '2020-06-23', 'Tax', 1, 5.26, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-14', '2020-08-31', 'HM 1-CT 1/4IN 20 x 2-1/2IN', 1, 19.50, 3, 25, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200831-14', '2020-08-31', 'Tax', 1, 1.37, 4, 22);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity) values ('20200831-15', '2020-08-31', 'Pony Band Clamp', 1, 19.98, 2, 25);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-15', '2020-08-31', '88CT Trim Screw SS 1-5/8', 1, 25.96, 3, 2, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200831-15', '2020-08-31', '88CT Deck Screw SS 2 IN', 1, 12.98, 3, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-15', '2020-08-31', 'HM 1-CT 5/16IN-18 x 3IN', 1, 37.00, 3, 25, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-15', '2020-08-31', '3/8-IN USS Fin Nut', 1, 45.00, 3, 100, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-15', '2020-08-31', 'HM 1-CT 3/8-IN Flat Washer', 1, 27.00, 3, 100, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, item_quantity, project_id) values ('20200831-15', '2020-08-31', 'HM 1-CT 1/4-IN SS Flat Washer', 1, 21.00, 3, 100, 22);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200831-15', '2020-08-31', 'Tax', 1, 13.22, 4, 22);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, board_feet_quantity) values ('20200828-16', '2020-08-28', '5/4 Oak White F1F', 3, 498.75, 1, 22, 105);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200828-16', '2020-08-28', 'Tax', 3, 34.91, 4, 22);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, board_feet_quantity) values ('20200625-17', '2020-06-25', '8/4 Oak White QRTD SEL&BTR', 3, 122.18, 1, 17, 13);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, board_feet_quantity) values ('20200625-17', '2020-06-25', '4/4 Oak White QRTD SEL&BTR', 3, 35.40, 1, 17, 6);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-17', '2020-06-25', 'Tax', 3, 11.03, 4, 17);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, board_feet_quantity) values ('20200701-18', '2020-07-01', '4/4 Oak White QRTD SEL&BTR', 3, 70.80, 1, 17, 12);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200701-18', '2020-07-01', '1/4 Birch SW A1 MDF', 3, 58.82, 1, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200701-18', '2020-07-01', 'Tax', 3, 9.07, 4, 17);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, board_feet_quantity) values ('20200724-19', '2020-07-24', '4/4 Oak White Rift SEL&BTR', 3, 249.00, 1, 19, 30);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, board_feet_quantity) values ('20200724-19', '2020-07-24', '8/4 Maple Hard 1,2 White SEL&BTR', 3, 39.00, 1, 10);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200724-19', '2020-07-24', 'Tax', 3, 20.16, 1, 19);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, item_quantity) values ('20200630-20', '2020-06-30', '1x6x10 Poplar Board', 1, 56.00, 1, 17, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200630-20', '2020-06-30', 'Tax', 1, 3.96, 4, 17);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id, item_quantity) values ('20200624-21', '2020-06-24', '12.25-FL OZ Minwax Satin LA', 1, 19.36, 5, 11, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200624-21', '2020-06-24', 'TPN 5/32-IN x 4-1/2-IN CN', 1, 5.48, 3, 11);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200624-21', '2020-06-24', '3/4-2x4 Maple Plywood', 1, 26.98, 1, 11);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200624-21', '2020-06-24', 'Hammer Drill', 1, 59.98, 2);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200624-21', '2020-06-24', 'Tax', 1, 7.83, 4);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200612-22', '2020-06-12', 'Frog 48MM Delicate Surface Tape', 4, 8.97, 6, 12);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200612-22', '2020-06-12', '1 Quart Paint Stick', 4, 0.98, 5, 12);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200612-22', '2020-06-12', 'Vara 3x Stain Oil Flagstone QT', 4, 8.98, 5, 12);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200612-22', '2020-06-12', 'Tax', 4, 1.33, 4, 12);

insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', 'Energizer Max AAA30', 4, 16.98, 6, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', 'Diablo 10"x40T General Purpose', 4, 29.97, 6, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', '3/4 4x8 Birch Plywood', 4, 55.98, 1, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', 'Weldwood Contact Cement', 4, 13.98, 6, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id) values ('20200625-23', '2020-06-25', 'Titebond Wood Glue 16 OZ', 4, 5.97, 5);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', 'Bondo 262 Body Filler 1 QT', 4, 8.32, 6, 17);
insert into expenses (transaction_id, date_of_transaction, transaction_description, location_id, transaction_amount, expense_type_id, project_id) values ('20200625-23', '2020-06-25', 'Tax', 4, 9.18, 4, 17);

select * from locations;
select * from projects;

create table tasks (
task_id INT AUTO_INCREMENT PRIMARY KEY,
task_type VARCHAR(50),
task_code VARCHAR(4),
hourly_rate INT
);

create table timeclock (
time_id INT AUTO_INCREMENT PRIMARY KEY,
project_id INT,
FOREIGN KEY (project_id) REFERENCES projects (project_id),
task_id INT,
FOREIGN KEY (task_id) REFERENCES tasks (task_id),
time_logged DECIMAL(16,2) NOT NULL
);

insert into tasks (task_type, task_code, hourly_rate) values ('Shopping', 'SHOP', 15);
insert into tasks (task_type, task_code, hourly_rate) values ('Woodworking', 'WW', 30);
insert into tasks (task_type, task_code, hourly_rate) values ('Finishing', 'FNSH', 25);
insert into tasks (task_type, task_code, hourly_rate) values ('Project Management', 'PROM', 20);

create table markup (
markup_id INT AUTO_INCREMENT PRIMARY KEY,
referral_id INT,
FOREIGN KEY (referral_id) REFERENCES referrals (referral_id),
markup DECIMAL(2,2) NOT NULL
);

insert into markup (referral_id, markup) values (1, 0);
insert into markup (referral_id, markup) values (2, 0);
insert into markup (referral_id, markup) values (3, 0.15);
insert into markup (referral_id, markup) values (4, 0.15);
insert into markup (referral_id, markup) values (5, 0.15);
insert into markup (referral_id, markup) values (6, 0.15);
insert into markup (referral_id, markup) values (7, 0.15);
insert into markup (referral_id, markup) values (8, 0.15);

create table wood_species (
wood_species_id INT AUTO_INCREMENT PRIMARY KEY,
wood_species VARCHAR (30)
);

insert into wood_species (wood_species) values ('White Oak');
insert into wood_species (wood_species) values ('Maple');
insert into wood_species (wood_species) values ('Birch');
insert into wood_species (wood_species) values ('Teak');
insert into wood_species (wood_species) values ('Poplar');
insert into wood_species (wood_species) values ('Pine');
insert into wood_species (wood_species) values ('Red Oak');
insert into wood_species (wood_species) values ('Spanish Cedar');
insert into wood_species (wood_species) values ('Sanded');
insert into wood_species (wood_species) values ('MDF');
insert into wood_species (wood_species) values ('Sanded');
insert into wood_species (wood_species) values ('KD Fir');

create table wood_types (
wood_type_id INT AUTO_INCREMENT PRIMARY KEY,
wood_species_id INT,
FOREIGN KEY (wood_species_id) REFERENCES wood_species (wood_species_id),
variety VARCHAR (20),
thickness_of_wood VARCHAR (20),
size VARCHAR (20)
);


insert into wood_types (wood_species_id, thickness_of_wood, variety) values (1, '4/4', 'Rift');
insert into wood_types (wood_species_id, variety, thickness_of_wood) values (2, 'Hard 1,2 White', '8/4');
insert into wood_types (wood_species_id, thickness_of_wood, variety) values (1, '4/4', 'Quarter-Sawn');
insert into wood_types (wood_species_id, variety, thickness_of_wood) values (3, 'Plywood', '1/4');
insert into wood_types (wood_species_id, thickness_of_wood, variety) values (1, '8/4', 'Quarter-Sawn');
insert into wood_types (wood_species_id, thickness_of_wood) values (1, '5/4');
insert into wood_types (wood_species_id, variety, thickness_of_wood) values (2, 'Plywood', '1/2');
insert into wood_types (size, wood_species_id, thickness_of_wood) values ('6x10', 5, '3/4');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('4x8', 9, 'Plywood', '1/4');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('4x8', 9, 'Plywood', '1/2');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('4x8', 10, 'Panel', '1/2');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('4x8', 3, 'Plywood', '3/4');
insert into wood_types (size, wood_species_id, thickness_of_wood) values ('25''', 3, '3/4');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('4x12', 10, 'Board', '6/4');
insert into wood_types (size, wood_species_id, variety, thickness_of_wood) values ('6x12', 10, 'Board', '6/4');

create table wood_prices (
wood_price_id INT AUTO_INCREMENT PRIMARY KEY,
wood_type_id INT,
FOREIGN KEY (wood_type_id) REFERENCES wood_types (wood_type_id),
price_per_unit DECIMAL(16,2) NOT NULL,
unit_type VARCHAR (20),
location_id INT,
FOREIGN KEY (location_id) REFERENCES locations (location_id)
);

insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (1, 8.30, 'BF', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (2, 3.90, 'BF', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (3, 5.90, 'BF', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (4, 58.82, 'Sheet', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (5, 9.3984, 'BF', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (6, 4.75, 'BF', 3);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (7, 26.98, 'Sheet', 1);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (8, 28.30, 'Board', 1);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (9, 22.92, 'Sheet', 4);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (10, 35.95, 'Sheet', 4);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (11, 20.96, 'Sheet', 4);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (12, 55.98, 'Sheet', 4);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (13, 6.58, 'Board', 1);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (12, 55.98, 'Sheet', 1);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (14, 5.64, 'Board', 1);
insert into wood_prices (wood_type_id, price_per_unit, unit_type, location_id) values (15, 8.46, 'Board', 1);


select * from wood_prices;

select e.* from expenses e where e.project_id=1;