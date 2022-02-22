CREATE DATABASE diggers_rental_db;
\c diggers_rental_db;

CREATE TABLE diggers(id SERIAL PRIMARY KEY,brand TEXT,model TEXT,img_url TEXT,rental_startdate TEXT,rental_enddate TEXT,rate TEXT);

INSERT INTO diggers(brand,model,img_url,rental_startdate,rental_enddate,rate)VALUES('THWAITES','6 Tonne Dumpers','https://www.eeaustralia.com.au/wp-content/uploads/2020/05/5a14f773aed421.jpg','20/1/2022','19/2/2022','$1800/week');



INSERT INTO diggers(brand,model,img_url,rental_startdate,rental_enddate,rate)VALUES('CAT','20 Tonne Wheeled Excavator','https://a-plant.com.au/wp-content/uploads/2019/07/20-TONNE-1.png','17/1/2022','25/1/2022','$400/day');