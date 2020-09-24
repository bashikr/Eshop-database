/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showProduct: showProduct,
    createProduct: createProduct,
    deleteProduct: deleteProduct,
    showOneProduct: showOneProduct,
    editProduct: editProduct
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
 * Show details for an account.
 *
 * @async
 * @param {string} id A id of the account.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOneProduct(ettId) {
    let sql = `CALL visa_id_produkt(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Delete an account.
 *
 * @async
 * @param {string} id The id of the account.
 *
 * @returns {void}
 */
async function deleteProduct(ettId) {
    let sql = `CALL tabort_produkt(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}


/**
 * Create a new account.
 *
 * @async
 * @param {string} id      A id of the account.
 * @param {string} name    The name of the account holder.
 * @param {string} balance Initial amount in the account.
 *
 * @returns {void}
 */
async function createProduct(ettId, ettPris, ettProdnamn, enBildlank, enBeskrivning) {
    let sql = `CALL skapa_produkt(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [ettId, ettPris, ettProdnamn, enBildlank, enBeskrivning]);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}


/**
 * Edit details on an account.
 *
 * @async
 * @param {string} id      The id of the account to be updated.
 * @param {string} name    The updated name of the account holder.
 * @param {string} balance The updated amount in the account.
 *
 * @returns {void}
 */
async function editProduct(ettId, ettPris, ettProdnamn, enBildlank, enBeskrivning) {
    let sql = `CALL uppdatera_produkt(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [ettId, ettPris, ettProdnamn, enBildlank, enBeskrivning]);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}
