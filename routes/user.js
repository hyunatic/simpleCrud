const express = require("express");
const knex = require("../dbConfig/config");
const router = express.Router();

//Write your API codes over here
router.get("/getUser", async (req, res) => {
  try {
    const query = await knex("usertable");
    res.send(query);
  } catch (err) {
    res.send(err);
  }
});

router.get("/getUser1", (req, res) => {
  knex("usertable")
    .then((data) => {
      res.send(data);
    })
    .catch((err) => res.send(err));
});

router.get("/updateUser", async (req, res) => {
  try {
    await knex("usertable")
      .update({
        email: "hy@gmail.com",
      })
      .where({ id: 1 });
    let query = await knex("usertable").where({ id: 1 });
    res.send(query);
  } catch (err) {
    res.send(err);
  }
});

module.exports = router;
