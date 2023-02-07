const express = require("express");
const knex = require("../dbConfig/config");
const router = express.Router();

//Write your API codes over here
router.get("/getUser", async (req, res) => {
  try {
    const query = await knex("user");
    res.send(query);
  } catch (err) {
    res.send(err);
  }
});

router.get("/login", async (req, res) => {
  try {
    const query = await knex("user");
    res.send(query);
  } catch (err) {
    res.send(err);
  }
});

module.exports = router;
