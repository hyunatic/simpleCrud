require("dotenv").config();
const express = require("express");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

//Declare routes
let userRoutes = require("./routes/user");
let transactionRoutes = require("./routes/transactions");

app.use("/user", userRoutes);
app.use("/transactions", transactionRoutes);

app.listen(process.env.LOCALHOST_PORT, () =>
  console.log(`App listening on port ${process.env.LOCALHOST_PORT}`)
);
