/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showLog: showLog,
    showShelves: showShelves,
    showInventory: showInventory,
    showProduct2shelves: showProduct2shelves,
    addToInventory: addToInventory,
    deleteFromInventory: deleteFromInventory,
    showOrder: showOrder,
    showOrderBySearch: showOrderBySearch,
    pickList: pickList,
    developersName: developersName,
    ship: ship,
    searchLogTerminal: searchLogTerminal,
    createOrderRowTerminal: createOrderRowTerminal
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
 * Show specified number of entries in the product log table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showLog(limit) {
    let sql = `CALL visa_produkt_logg(?);`;
    let res;

    res = await db.query(sql, [limit]);
    console.table(res[0]);
}


/**
 * Show all entries in the shelf table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showShelves() {
    let sql = `CALL visa_lagerhylla();`;
    let res;

    res = await db.query(sql);
    console.table(res[0]);
}


async function showInventory() {
    let sql = `CALL visa_produkter_i_lagret();`;
    let res;

    res = await db.query(sql);
    console.table(res[0]);
}


async function showProduct2shelves(search) {
    const db = await mysql.createConnection(config);
    let like = `%${search}%`;
    let sql = ` CALL sok_i_lagret(?)`;
    let res;

    res = await db.query(sql, [like]);
    console.table(res[0]);
}


async function addToInventory(produktId, plats, antal) {
    let sql = ` CALL addera_till_lagret(?, ?, ?)`;

    await db.query(sql, [produktId, plats, antal]);
}

async function deleteFromInventory(produktId, plats, antal) {
    let sql = ` CALL tabort_fron_lagret(?, ?, ?)`;

    await db.query(sql, [produktId, plats, antal]);
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOrder() {
    let sql = `CALL visa_alla_ordrar_terminal();`;
    let res;

    res = await db.query(sql);
    console.table(res[0]);
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOrderBySearch(search) {
    let sql = `CALL visa_ordrar_sok_terminal(?);`;
    let res;

    res = await db.query(sql, [search]);
    console.table(res[0]);
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function pickList(search) {
    let sql = `CALL plock_lista(?);`;
    let res;

    res = await db.query(sql, [search]);
    console.table(res[0]);
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function ship(search) {
    let sql = `CALL frakt(?);`;
    // let res;

    await db.query(sql, [search]);
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function developersName() {
    const db = await mysql.createConnection(config);
    let sql = ` SELECT 'Bashar Altaleb' AS Developer`;
    let res;

    res = await db.query(sql);
    console.table(res);
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function searchLogTerminal(search) {
    let sql = `CALL sok_logg(?);`;
    let res;
    let like = `%${search}%`;

    res = await db.query(sql, [like]);
    console.table(res[0]);
}




// Adds products and amount to a targeted order
async function createOrderRowTerminal(orderId, produktId, antprodukter) {
    let sql = `CALL skapa_orderrad(?, ?, ?);`;
    // let res;

    await db.query(sql, [orderId, produktId, antprodukter]);
}
