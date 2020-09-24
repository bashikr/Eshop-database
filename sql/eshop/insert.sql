USE eshop;

DELETE FROM kund;
DELETE FROM produkt;
DELETE FROM kategori;
DELETE FROM lagerhylla;
DELETE FROM produkt2kategori;
DELETE FROM produkt2lager;


SET NAMES 'utf8';
--
-- Enable LOAD DATA LOCAL INFILE on the server.
--
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

--
-- Insert into kund.
--
LOAD DATA LOCAL INFILE '01_kund.csv'
INTO TABLE kund
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kund;



--
-- Insert into produkt.
--
LOAD DATA LOCAL INFILE '02_produkt.csv'
INTO TABLE produkt
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM produkt;


--
-- Insert into kategori.
--
LOAD DATA LOCAL INFILE '03_kategori.csv'
INTO TABLE kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM kategori;


--
-- Insert into kategori.
--
LOAD DATA LOCAL INFILE '04_lagerhylla.csv'
INTO TABLE lagerhylla
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

SELECT * FROM lagerhylla;



--
-- Insert into produkt2kategori.
--
LOAD DATA LOCAL INFILE '05_produkt2kategori.csv'
INTO TABLE produkt2kategori
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES

(produkt_id, kategori_id)
;
SELECT * FROM produkt2kategori;




--
-- Insert into produkt2lager.
--
LOAD DATA LOCAL INFILE '06_produkt2lager.csv'
INTO TABLE produkt2lager
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES

(produkt_id, plats, antal)
;
SELECT * FROM produkt2lager;


