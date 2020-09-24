/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showCustomers: showCustomers,
    showOneCustomer: showOneCustomer
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
async function showCustomers() {
    let sql = `CALL visa_kund();`;
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
async function showOneCustomer(ettId) {
    let sql = `CALL visa_hela_kund(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
