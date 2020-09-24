-- Skapa databas
-- CREATE DATABASE eshop;

DROP DATABASE IF EXISTS eshop;

CREATE DATABASE IF NOT EXISTS eshop;

-- Välj vilken databas du vill använda
USE eshop;


-- som heter något i stil med skolan
SHOW DATABASES LIKE "%eshop%";

-- Skapa en användare user med lösenorder pass och ge tillgång oavsett
-- hostnamn. 
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'pass';



-- Ge användaren alla rättigheter på en specifk databas.
GRANT ALL PRIVILEGES ON eshop.* TO 'user'@'%';



-- Visa vad en användare kan göra mot vilken databas.
SHOW GRANTS FOR 'user'@'%';

-- SET foreign_key_checks = 1;