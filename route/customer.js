/**
 * Route for Café.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const eshop    = require("../src/customer.js");
const sitename   = "| The eshop";



router.get("/customer", async (req, res) => {
    let data = {
        title: `customer ${sitename}`,
        user: req.session.acronym || null
    };

    data.res = await eshop.showCustomers();
    res.render("eshop/customer", data);
});


router.get("/customer-show/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Product ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.showOneCustomer(id);

    res.render("eshop/customer-show", data);
});

module.exports = router;
