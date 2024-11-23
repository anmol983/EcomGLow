require('dotenv').config();
const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
const PORT = 3000;
const app = express();
const DB = process.env.DB;
app.use(express.json());
app.use(authRouter);
app.use(productRouter);
app.use(adminRouter);
app.use(userRouter);

mongoose
.connect("mongodb+srv://anmolr444:09Anmol@cluster0.pcwjcxv.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
.then(() => {
    console.log('Connection Successful');
}).catch(e => {
    console.log(e);
});


app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});


