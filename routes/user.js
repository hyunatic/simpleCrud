const express = require("express");
const knex = require("../dbConfig/config");
const router = express.Router();
const jwt = require("jsonwebtoken");

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  if (token == null) return res.sendStatus(401);
  jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
};

//Write your API codes over here
router.get("/getUser", authenticateToken, async (req, res) => {
  try {
    const query = await knex("user");
    res.send(query);
  } catch (err) {
    res.send(err);
  }
});

router.post("/login", async (req, res) => {
  try {
    const query = await knex("user")
      .where("Username", req.body.Username)
      .where("Password", req.body.Password);

    const accessToken = jwt.sign(
      req.body.Username,
      process.env.ACCESS_TOKEN_SECRET
    );
    query.length > 0
      ? res.send({ Response: accessToken })
      : res.send([{ Response: "User Not Found" }]);
  } catch (err) {
    res.send(err);
  }
});

module.exports = router;
