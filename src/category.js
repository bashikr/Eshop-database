/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showCategory: showCategory,
    showProductFromCategory: showProductFromCategory
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
async function showCategory() {
    return findAllInTable("kategori");
}


/**
 * Show all entries in the selected table.
 *
 * @async
 * @param {string} table A valid table name.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function findAllInTable(table) {
    let sql = `SELECT * FROM ??;`;
    let res;

    res = await db.query(sql, [table]);
    console.table(res);
    return res;
}




/**
 * Show details for an account.
 *
 * @async
 * @param {string} id A id of the account.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProductFromCategory(ettId) {
    let sql = `CALL visa_id_kategori(?);`;
    let res;

    res = await db.query(sql, [ettId]);
    // console.table(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


