require("dotenv").config();

const config = {
  client: "mysql2",
  connection: {
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    port: process.env.DB_PORT,
  },
};

const knex = require("knex")(config);
module.exports = knex;
