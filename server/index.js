const express = require('express');
const app = express();
const PORT = 3000;
const mongoose = require('mongoose');
const authRoute = require('./routes/auth')
const adminRoute = require("./routes/admin_route");
const productRoute = require("./routes/product_route");
const userRoute = require("./routes/user");

const DB ="mongodb+srv://onyearugbulem7:obasooto@ecommerce.xzuvmax.mongodb.net/?retryWrites=true&w=majority"
app.use(express.json())
app.use(authRoute);
app.use(adminRoute);
app.use(productRoute);
app.use(userRoute);
mongoose
.connect(DB)
.then(() => {
  console.log('connection succefull')  
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`connected at ${PORT}`);
});