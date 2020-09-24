/**
 * Route for Café.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const eshop    = require("../src/category.js");
const sitename   = "| The eshop";




router.get("/category", async (req, res) => {
    let data = {
        title: "Show Category | The Café",
        user: req.session.acronym || null
    };

    data.res = await eshop.showCategory();

    res.render("eshop/category", data);
});

router.get("/category-show/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `category ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.showProductFromCategory(id);

    res.render("eshop/category-show", data);
});


module.exports = router;
