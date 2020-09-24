/**
 * A test program to show off async and await.
 *
 * @author Bashar Altaleb
 */
"use strict";


const readline = require("readline");
const eshop = require("./src/eshopTerminal.js");


const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});


/**
 * Main function.
 *
 * @returns void
 */

(async function () {
    rl.on("close", exitProgram);
    rl.on("line", (handleInput));

    Welcome();
    rl.setPrompt("Write a command: ");
    rl.prompt();

    // rl.on("close", process.exit);
})();


/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
 * @returns {void}
 */
async function handleInput(line) {
    line = line.trim();
    let lineArray = line.split(" ");

    switch (lineArray[0]) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "menu":
        case "help":
            showMenu();
            break;
        case "log":
            await eshop.showLog(lineArray[1]);
            break;
        case "shelf":
            await eshop.showShelves();
            break;
        case "inventory":
            if (lineArray == "inventory" ) {
                await eshop.showInventory();
            } else {
                await eshop.showProduct2shelves(lineArray[1]);
            }
            break;
        case "invadd":
            await eshop.addToInventory(lineArray[1], lineArray[2], lineArray[3]);
            break;
        case "invdel":
            await eshop.deleteFromInventory(lineArray[1], lineArray[2], lineArray[3]);
            break;
        case "order":
            if (lineArray == "order" ) {
                await eshop.showOrder();
            } else {
                await eshop.showOrderBySearch(lineArray[1]);
            }
            break;
        case "picklist":
            await eshop.pickList(lineArray[1]);
            break;
        case "ship":
            await eshop.ship(lineArray[1]);
            break;
        case "logsearch":
            await eshop.searchLogTerminal(lineArray[1]);
            break;
        case "about":
            await eshop.developersName();
            break;
        case "createOrderRow":
            await eshop.createOrderRowTerminal(lineArray[1], lineArray[2], lineArray[3]);
            break;
        default:
            break;
    }
    rl.prompt();
}


function showMenu() {
    console.info(
        `\nYou can choose from the following commands:\n\n` +
        `-------------------------------------- --------------------------------------\n` +
        `1- help, menu:                         - Shows this menu.                   -\n` +
        `2- log <number>                        - shows number of the latest events. -\n` +
        `3- shelf                               - Shows the warehouse's shelves.     -\n` +
        `4- inventory                           - Shows a table of the warehouse.    -\n\n` +
        `5- inventory <search something>        - Search products in the warehouse.  -\n` +
        `6- invadd <productid> <shelf> <number> - Adds products on the shelves.      -\n` +
        `7- invdel <productid> <shelf> <number> - Deletes products from the shelves. -\n\n` +
        `8- order                               - Shows orders and customers id.     -\n` +
        `9- order <search customer or order_id> - Searches by order_id or kund_id    -\n` +
        `10- picklist <search by order_id>      - Generates a picklist.              -\n` +
        `11- ship <search by order_id>          - Set status as "orderd" on order_id.-\n\n` +
        `12- about                              - Shows the name of developers.      -\n` +
        `13- logsearch <str>                    - Searches in log table.             -\n` +
        `14- createOrderRow <ordId> <prd> <nr>  - Creates a new order row            -\n` +
        `15- Exit, quit                         - finish the program.                -\n` +
        `-------------------------------------- --------------------------------------`
    );
}
function Welcome() {
    console.info(
        `\nHello and welcome to Bank terminal program!\n` +
        `Type menu to see some commands that you can use.\n\n`
    );
}


/**
 * Close down program and exit with a status code.
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
