/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showOrder: showOrder,
    showOneOrder: showOneOrder,
    createOrder: createOrder,
    deleteOrder: deleteOrder,
    createOrderRow: createOrderRow,
    deliver: deliver,
    getOrderRow: getOrderRow,
    orderDone: orderDone,
    showProduct: showProduct,
    searchLog: searchLog,
    showLog: showLog,
    pickListWeb: pickListWeb
};

const mysql  = require("promise-mysql");
const config = require("../config/db/eshop.json");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProduct() {
    let sql = `CALL hela_produkt_information();`;
    let res;

    res = await db.query(sql);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOrder() {
    let sql = `CALL visa_alla_ordrar();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOneOrder(ettId) {
    let sql = `CALL visa_en_order(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function createOrder(kundId) {
    let sql = `CALL skapa_order(?);`;
    let res;

    res = await db.query(sql, [kundId]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function deleteOrder(orderId) {
    let sql = `CALL tabort_order(?);`;
    let res;

    res = await db.query(sql, [orderId]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


// Adds products and amount to a targeted order
async function createOrderRow(body) {
    let sql = `CALL skapa_orderrad(?, ?, ?);`;
    let res;

    res = await db.query(sql, [body.orderId, body.prod_id, body.amount]);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


// shows that the order is ordered
async function orderDone() {
    let sql = `CALL skapad_order()`;
    let res;

    res = await db.query(sql);
    return res[0];
}


// shows on order details by its id
async function getOrderRow(orderId) {
    let sql = `CALL vald_orderrad(?);`;
    let res;

    res = await db.query(sql, [orderId]);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



// shows that the order is delivered
async function deliver(ettId) {
    let sql = `CALL sandning(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function searchLog(search) {
    let sql = `CALL sok_logg(?);`;
    let res;
    let like = `%${search}%`;
    
    res = await db.query(sql, [like]);
    console.table(res[0])
    console.info(`SQL: ${sql} got ${res.length} rows.`);
    return res[0];
}





// shows that the order is ordered
async function showLog() {
    let sql = `CALL visa_produkt_logg(20);`;
    let res;

    res = await db.query(sql);
    return res[0];
}




/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function pickListWeb(search) {
    let sql = `CALL plock_lista(?);`;
    let res;

    res = await db.query(sql, [search]);
    return res[0];
}


