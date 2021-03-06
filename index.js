/**
 * A sample Express server with static resources.
 */
"use strict";

const port    = process.env.DBWEBB_PORT || 1337;
const path    = require("path");
const express = require("express");
const session  = require("express-session");
const app     = express();

const routeCategory = require("./route/category.js");
const routeCustomer  = require("./route/customer.js");
const routEshop = require("./route/eshop.js");
const routeIndex = require("./route/index.js");
const routeProduct  = require("./route/product.js");
const routeUser  = require("./route/user.js");

const middleware = require("./middleware/index.js");


app.set("view engine", "ejs");

// app.use("/eshop", routEshop);
// app.use(middleware.logIncomingToConsole);
// app.use(express.static(path.join(__dirname, "public")));

// app.listen(port, logStartUpDetailsToConsole);

app.use(session({
    secret: "dbwebb",
    resave: false,
    saveUninitialized: true
}));

app.use(middleware.logIncomingToConsole);
app.use(express.static(path.join(__dirname, "public")));
app.use(/^\/(?!user\/login).*/, middleware.authenticatedOrLogin);
app.use("/", routeIndex);
app.use("/category", routeCategory);
app.use("/customer", routeCustomer);
app.use("/eshop", routEshop);
app.use("/product", routeProduct);
app.use("/user", routeUser);
app.listen(port, logStartUpDetailsToConsole);


/**
 * Log app details to console when starting up.
 *
 * @return {void}
 */
function logStartUpDetailsToConsole() {
    let routes = [];

    // Find what routes are supported
    app._router.stack.forEach((middleware) => {
        if (middleware.route) {
            // Routes registered directly on the app
            routes.push(middleware.route);
        } else if (middleware.name === "router") {
            // Routes added as router middleware
            middleware.handle.stack.forEach((handler) => {
                let route;

                route = handler.route;
                route && routes.push(route);
            });
        }
    });

    console.info(`Server is listening on port ${port}.`);
    console.info("Available routes are:");
    console.info(routes);
}
