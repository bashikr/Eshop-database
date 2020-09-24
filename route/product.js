/**
 * Route for Café.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const eshop    = require("../src/product.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const sitename   = "| The Eshop";




router.get("/product", async (req, res) => {
    let data = {
        title: `product ${sitename}`,
        user: req.session.acronym || null
    };

    data.res = await eshop.showProduct();

    res.render("eshop/product", data);
});



router.get("/product-show/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Product ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.showOneProduct(id);

    res.render("eshop/product-show", data);
});




router.get("/product-create", (req, res) => {
    let data = {
        title: `Create new product ${sitename}`,
        user: req.session.acronym || null
    };

    res.render("eshop/product-create", data);
});


router.post("/product-create", urlencodedParser, async (req, res) => {
    // console.log(JSON.stringify(req.body, null, 4));
    await eshop.createProduct(
        req.body.ettId,
        req.body.ett_pris,
        req.body.ett_prodnamn,
        req.body.en_bildlank,
        req.body.en_beskrivning
    );
    res.redirect("/eshop/product");
});


router.get("/delete/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Delete product ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.showOneProduct(id);

    res.render("eshop/product-delete", data);
});

router.post("/delete", urlencodedParser, async (req, res) => {
    await eshop.deleteProduct(req.body.ettId);
    res.redirect(`/eshop/product`);
});


router.get("/edit/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Edit account ${id} ${sitename}`,
        user: req.session.acronym || null,
        account: id
    };

    data.res = await eshop.showOneProduct(id);

    res.render("eshop/product-edit", data);
});

router.post("/edit", urlencodedParser, async (req, res) => {
    await eshop.editProduct(req.body.ettId,
        req.body.ett_pris,
        req.body.ett_prodnamn,
        req.body.en_bildlank,
        req.body.en_beskrivning
    );
    res.redirect(`/eshop/product`);
});

module.exports = router;
