const express = require("express");
const knex = require("../db/knexConfig");
const router = express.Router();

//Write your API codes over here
router.get("/getTransaction", (req, res) => {
  res.send("This is from transaction route");
});

module.exports = router;
