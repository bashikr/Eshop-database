/**
 * Route for Café.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const sitename   = "| The Eshop";


router.get("/index", (req, res) => {
    let data = {
        title: `index ${sitename}`,
        user: req.session.acronym || null
    };

    res.render("eshop/index", data);
});

router.get("/about", (req, res) => {
    let data = {
        title: `about ${sitename}`,
        user: req.session.acronym || null
    };

    res.render("eshop/about", data);
});

module.exports = router;
