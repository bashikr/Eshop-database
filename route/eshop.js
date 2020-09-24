/**
 * Route for Café.
 */
"use strict";

const express = require("express");
const router  = express.Router();
const app = express();
const eshop    = require("../src/eshop.js");
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const sitename = "| The eshop";

app.use("/static", express.static(__dirname + "/static"));
app.set('view engine', 'ejs');


var index = require("../route/index");

router.use("/", index);

var product = require("../route/product");

router.use("/", product);


var category = require("../route/category");

router.use("/", category);


var customer = require("../route/customer");

router.use("/", customer);

var user = require("../route/user");

router.use("/", user);



router.get("/order", async (req, res) => {
    let data = {
        title: `order ${sitename}`,
        user: req.session.acronym || null
    };

    data.res = await eshop.showOrder();
    res.render("eshop/order", data);
});




router.get("/order-show/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Product ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.showOneOrder(id);
    data.res1 = await eshop.getOrderRow(id);
    res.render("eshop/order-show", data);
});


router.get("/picklist/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Picklist ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.pickListWeb(id);
    res.render("eshop/picklist", data);
});


router.get("/order-delete/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Product ${id} ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.deleteOrder(id);
    res.render("eshop/order-delete", data);
});



router.get("/send/:ettId", async (req, res) => {
    let id = req.params.ettId;
    let data = {
        title: `Product ${sitename}`,
        user: req.session.acronym || null,
        order: id
    };

    data.res2 = await eshop.showOneOrder(id);
    data.res = await eshop.deliver(id);
    res.render("eshop/send", data);
});


router.get("/order-create/:kundId", async (req, res) => {
    let id = req.params.kundId;
    let data = {
        title: `order ${sitename}`,
        user: req.session.acronym || null,
        product: id
    };

    data.res = await eshop.createOrder(id);
    res.render("eshop/order-create", data);
});



router.post('/order-create', urlencodedParser, async (req, res) => {
    let data = {
        title: `Product ${sitename}`,
        user: req.session.acronym || null
    };

    data.res = await eshop.showOrder();

    res.redirect("/eshop/order");
});


router.get("/order-row-create/:orderId", async (req, res) => {
    let data = {
        title: "Make an order | Eshop",
        user: req.session.acronym || null
    };

    data.orderId = req.params.orderId;

    data.res = await eshop.showProduct();

    data.numb = eshop.orderDone(req.params.orderd, req.params.id);
    console.log(data);

    res.render("eshop/order-row-create", data);
});


router.post('/order-row-create', urlencodedParser, async (req, res) => {
    await eshop.createOrderRow(req.body);
    // await order.orderDone(req.params.orderd, req.params.id);


    res.redirect("../eshop/order-show/" + req.body.orderId);
});

router.post('/order-row-create', urlencodedParser, async (req, res) => {
    await eshop.createOrderRow(req.body);
    await eshop.orderDone(req.params.orderd, req.params.id);

    res.redirect("../eshop/order/" + req.body.orderId);
});



router.get("/log", async (req, res) => {
    let data = {
        title: "log | Eshop",
        user: req.session.acronym || null
    };

    if (req.query.search == null) {
        data.res = await eshop.showLog();
        console.log(data.res)
    } else {
        data.res = await eshop.searchLog(req.query.search);
        console.log("this is data res search", data.res)
    }
    res.render("eshop/show-log", data);
});

router.post('/log', urlencodedParser, async (req, res) => {
    await eshop.searchLog(req.body.search);

    res.redirect("../eshop/log");
});



module.exports = router;
