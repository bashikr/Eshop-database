USE eshop;

SET NAMES 'utf8';


--
-- Create procedure for showing customer
--
DROP PROCEDURE IF EXISTS visa_kund;
DELIMITER ;;
CREATE PROCEDURE visa_kund()
BEGIN
    SELECT
    id,
    fornamn,
    efternamn,
    adress,
    telefon
    FROM kund;
END
;;
DELIMITER ;

CALL visa_kund();


--
-- Create procedure for showing customer
--
DROP PROCEDURE IF EXISTS visa_hela_kund;
DELIMITER ;;
CREATE PROCEDURE visa_hela_kund(
    ett_id INT
)
BEGIN
    SELECT
        *
    FROM kund
    WHERE
    ett_id = id;
END
;;
DELIMITER ;

CALL visa_hela_kund(1);



-------------------------------------------------------------------------------

--
-- Function to
--
DROP FUNCTION IF EXISTS order_status;
DELIMITER ;;

CREATE FUNCTION order_status(
    created TIMESTAMP,
    updated TIMESTAMP,
    deleted TIMESTAMP,
    orderd  TIMESTAMP,
    delivered TIMESTAMP
)
RETURNS VARCHAR(20)
NOT DETERMINISTIC NO SQL
BEGIN
    IF delivered IS NOT NULL THEN
    RETURN "deliverd";
    ELSEIF orderd IS NOT NULL THEN
    RETURN "orderd";
    ELSEIF deleted IS NOT NULL THEN
    RETURN "deleted";
    ELSEIF updated != created THEN
    RETURN "updated";
    END IF;
    RETURN "created";
END
;;
DELIMITER ;


--
-- Shows all orders
--
DROP PROCEDURE IF EXISTS visa_alla_ordrar;
DELIMITER ;;
CREATE PROCEDURE visa_alla_ordrar()
BEGIN
SELECT *, o.id AS order_id,
        order_status(created, updated, deleted, orderd, delivered) AS status,
        (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
        FROM `order` o
        INNER JOIN kund K
        ON K.id = o.kundId
        GROUP BY order_id
        ORDER BY K.fornamn DESC;
END
;;
DELIMITER ;

CALL visa_alla_ordrar();



--
-- Shows all orders from the terminal
--
DROP PROCEDURE IF EXISTS visa_alla_ordrar_terminal;
DELIMITER ;;
CREATE PROCEDURE visa_alla_ordrar_terminal()
BEGIN
SELECT
    o.id AS order_id,
    o.kundId AS kundId,
    o.created AS created,
    order_status(created, updated, deleted, orderd, delivered) AS `status`,
    (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
    FROM `order` o
    INNER JOIN kund K
    ON K.id = o.kundId
    GROUP BY order_id
    ORDER BY K.fornamn DESC;
END
;;
DELIMITER ;

CALL visa_alla_ordrar_terminal();


--
-- Shows orders by search from the terminal
--
DROP PROCEDURE IF EXISTS visa_ordrar_sok_terminal;
DELIMITER ;;
CREATE PROCEDURE visa_ordrar_sok_terminal(
    ett_kund_id INT
)
BEGIN
SELECT
    o.id AS order_id,
    o.kundId AS kundId,
    o.created AS created,
    order_status(created, updated, deleted, orderd, delivered) AS `status`,
    (SELECT COUNT(produktId) FROM orderrader WHERE orderId = o.id) AS antal
    FROM `order` o
    WHERE kundId = ett_kund_id
    OR o.id = ett_kund_id
    GROUP BY order_id
    ORDER BY order_id DESC;
END
;;
DELIMITER ;


CALL visa_ordrar_sok_terminal(52);



--
-- Shows one order
--
DROP PROCEDURE IF EXISTS visa_en_order;
DELIMITER ;;
CREATE PROCEDURE visa_en_order(
    ett_id INT
)
BEGIN
SELECT *, o.id AS order_id FROM `order` o
    INNER JOIN kund K
    ON K.id = o.kundId
    WHERE o.id = ett_id;
END
;;
DELIMITER ;

CALL visa_en_order(1);



--
-- PROCEDURE to make an order row
--
DROP PROCEDURE IF EXISTS skapa_orderrad;
DELIMITER ;;
CREATE PROCEDURE skapa_orderrad(
    ett_order_id INT,
    ett_prod_id VARCHAR(20),
    ett_antal INT
)
BEGIN
    INSERT INTO orderrader(orderId, produktId, antprodukter) VALUES(ett_order_id, ett_prod_id, ett_antal);
END
;;
DELIMITER ;

CALL skapa_orderrad(38, "te1", 1);


--
-- PROCEDURE to create an order
--
DROP PROCEDURE IF EXISTS skapa_order;
DELIMITER ;;
CREATE PROCEDURE skapa_order(
    ett_kund_id INT
)
BEGIN
    INSERT INTO `order`(kundId) VALUES(ett_kund_id);
END
;;
DELIMITER ;

CALL skapa_order(1);


--
-- PROCEDURE to delete an order
--
DROP PROCEDURE IF EXISTS tabort_order;
DELIMITER ;;
CREATE PROCEDURE tabort_order(
    ett_id INT
)
BEGIN
    -- Delete rows from table 'TableName'
    DELETE FROM `order`
    WHERE id = ett_id;
END
;;
DELIMITER ;

CALL tabort_order(20);


--
-- PROCEDURE to display that an order is done
--
DROP PROCEDURE IF EXISTS skapad_order;
DELIMITER ;;
CREATE PROCEDURE skapad_order()
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.orderd = NOW() WHERE s.orderId = s.orderId;

END
;;
DELIMITER ;

CALL skapad_order();


--
-- PROCEDURE to bring a specific order row
--
DROP PROCEDURE IF EXISTS vald_orderrad;
DELIMITER ;;
CREATE PROCEDURE vald_orderrad(
    a_order_id INT
)
BEGIN
    SELECT * FROM orderrader o INNER JOIN produkt p
    ON o.produktId = p.id
    WHERE o.orderId = a_order_id;
END
;;
DELIMITER ;


-----------------------------------------------------------------------------------


--
-- PROCEDURE to
--
DROP PROCEDURE IF EXISTS plock_lista;
DELIMITER ;;
CREATE PROCEDURE plock_lista(
    a_order_id INT
)
BEGIN

SELECT
    r.orderId,
    r.produktId,
    r.antprodukter AS `bestallt antal`,
    s.antal AS `antal i lager`,
    s.plats AS lagerhylla,
    (s.antal - r.antprodukter) AS lagerDiff,
    IF(r.antprodukter>s.antal, "Tog slut", "Finns pa lagret" ) AS `status`
        FROM orderrader AS r
        INNER JOIN produkt2lager s
        ON s.produkt_id = r.produktId
        WHERE r.orderId = a_order_id;

END
;;
DELIMITER ;

CALL plock_lista(56);


--
-- PROCEDURE to
--
DROP PROCEDURE IF EXISTS frakt;
DELIMITER ;;
CREATE PROCEDURE frakt(
    ett_kund_id INT
)
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.delivered = NOW() WHERE s.orderId = ett_kund_id;
END
;;
DELIMITER ;

CALL frakt(56);


--
-- PROCEDURE to
--
DROP PROCEDURE IF EXISTS sandning;
DELIMITER ;;
CREATE PROCEDURE sandning(
    a_kund_id INT
)
BEGIN
UPDATE `order` AS r
INNER JOIN orderrader s
ON s.orderId = r.id
SET r.delivered = NOW() WHERE s.orderId = a_kund_id;
END
;;
DELIMITER ;

CALL sandning(17);


-----------------------------------------------------------------------------------


--
-- Create procedure for insert into account
--
DROP PROCEDURE IF EXISTS skapa_produkt;
DELIMITER ;;
CREATE PROCEDURE skapa_produkt(
    ett_id VARCHAR(20),
    ett_pris INT,
    ett_prodnamn VARCHAR(40),
    en_bildlank VARCHAR(50),
    en_beskrivning VARCHAR(100)
)
BEGIN
    INSERT INTO produkt VALUES (ett_id, ett_pris, ett_prodnamn, en_bildlank, en_beskrivning);
END
;;
DELIMITER ;



--
-- Create procedure for edit account details
--
DROP PROCEDURE IF EXISTS uppdatera_produkt;
DELIMITER ;;
CREATE PROCEDURE uppdatera_produkt(
    ett_id VARCHAR(20),
    ett_pris INT,
    ett_prodnamn VARCHAR(40),
    en_bildlank VARCHAR(50),
    en_beskrivning VARCHAR(100)
)
BEGIN
    UPDATE produkt SET
        `pris` = ett_pris,
        `prodnamn` = ett_prodnamn,
        `bildlank` = en_bildlank,
        `beskrivning` = en_beskrivning
    WHERE
        `id` = ett_id;
END
;;
DELIMITER ;



--
-- Create procedure for delete account
--
DROP PROCEDURE IF EXISTS tabort_produkt;
DELIMITER ;;
CREATE PROCEDURE tabort_produkt(
    ett_id CHAR(20)
)
BEGIN
    DELETE FROM produkt
    WHERE
        `id` = ett_id;
END
;;
DELIMITER ;

-- CALL tabort_produkt("cappuccino1");
-- SHOW WARNINGS;



--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS visa_produkt;
DELIMITER ;;
CREATE PROCEDURE visa_produkt()
BEGIN
    SELECT * FROM produkt;
END
;;
DELIMITER ;

CALL visa_produkt();


--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS visa_id_produkt;
DELIMITER ;;
CREATE PROCEDURE visa_id_produkt(
    ett_id CHAR(20)
)
BEGIN
    SELECT * FROM produkt
    WHERE `id` = ett_id;
END
;;
DELIMITER ;

CALL visa_id_produkt("te1");


--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS visa_id_kategori;
DELIMITER ;;
CREATE PROCEDURE visa_id_kategori(
    ett_id CHAR(20)
)
BEGIN
    SELECT produkt_id FROM produkt2kategori
    WHERE `kategori_id` = ett_id;
END
;;
DELIMITER ;

CALL visa_id_kategori("kaffe");



-- Show the products
DROP PROCEDURE IF EXISTS hela_produkt_information;
DELIMITER ;;
CREATE PROCEDURE hela_produkt_information()
BEGIN
    SELECT
        p.id,
        GROUP_CONCAT(p_k.kategori_id) AS kategori,
        p.prodnamn,
        p.pris,
        p.beskrivning,
        p_l.antal
    FROM produkt AS p
        LEFT JOIN produkt2lager AS p_l
            ON p.id = p_l.produkt_id
        LEFT JOIN produkt2kategori AS p_k
            ON p.id = p_k.produkt_id
    GROUP BY p.id
;
END
;;
DELIMITER ;

CALL hela_produkt_information();


--
-- Create procedure for select * from account
--
DROP PROCEDURE IF EXISTS visa_lagerhylla;
DELIMITER ;;
CREATE PROCEDURE visa_lagerhylla()
BEGIN
    SELECT * FROM lagerhylla;
END
;;
DELIMITER ;

CALL visa_lagerhylla();



DROP PROCEDURE IF EXISTS visa_produkt_logg;
DELIMITER ;;
CREATE PROCEDURE visa_produkt_logg(
    a_limit INT
)
BEGIN
    SELECT 
        * 
    FROM logg
    ORDER BY id DESC
    LIMIT a_limit;
END
;;
DELIMITER ;

CALL visa_produkt_logg(2);




-- Shows products in warehouse "detailed"
DROP PROCEDURE IF EXISTS visa_produkter_i_lagret;
DELIMITER ;;
CREATE PROCEDURE visa_produkter_i_lagret()
BEGIN
    SELECT * FROM produkter_i_lagret;
END
;;
DELIMITER ;

CALL visa_produkter_i_lagret();


-- Searches in the view produkter_i_lagret
DROP PROCEDURE IF EXISTS sok_i_lagret;
DELIMITER ;;
CREATE PROCEDURE sok_i_lagret(
    search VARCHAR(50)
)
BEGIN
    SELECT * FROM produkter_i_lagret
    WHERE id LIKE search OR
    namn LIKE search OR
    plats LIKE search;
END
;;
DELIMITER ;

CALL sok_i_lagret("te1");



DROP PROCEDURE IF EXISTS addera_till_lagret;
DELIMITER ;;
CREATE PROCEDURE addera_till_lagret(
    a_produkt_id VARCHAR(20),
    a_plats VARCHAR(15),
    a_antal INT
)
BEGIN
    INSERT INTO produkt2lager(produkt_id, plats, antal)
    VALUES(a_produkt_id, a_plats, a_antal);
END
;;
DELIMITER ;

CALL addera_till_lagret("te1", "A:101", 24);



DROP PROCEDURE IF EXISTS tabort_fron_lagret;
DELIMITER ;;
CREATE PROCEDURE tabort_fron_lagret(
    a_produkt_id VARCHAR(20),
    a_plats VARCHAR(15),
    a_antal INT
)
BEGIN
    DELETE FROM produkt2lager
    WHERE
        produkt_id = a_produkt_id AND
        plats = a_plats AND
        antal = a_antal;
END
;;
DELIMITER ;

-- CALL tabort_fron_lagret("kaffemix1", "C:101", 20);

--------------------------------------------------------------------------

-- mysqldump -uuser -p --routines --add-drop-database --result-file=backup.sql --databases eshop
